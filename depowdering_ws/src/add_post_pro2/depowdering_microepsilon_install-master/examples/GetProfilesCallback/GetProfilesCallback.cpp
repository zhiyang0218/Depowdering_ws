#include "GetProfilesCallback.h"

// Global variables for debugging only
gboolean firstTrans = true;
guint32 profileCounter = 0, oldProfileCounter = 0, lostProfiles = 0; 
double sc = 0, so = 0;

// Event handle
EHANDLE event;

using namespace std;

int main()
{
    int iRetValue = 0;

    CreateEvent(&event);

    std::vector<char *> vcInterfaces(MAX_INTERFACE_COUNT);
    std::vector<guint32> vuiResolutions(MAX_RESOLUTION);
    guint32 uiInterfaceCount = 0;

    guint32 uiIdleTime = 500;
    guint32 uiShutterTime = 200;

    iRetValue = GetDeviceInterfaces(&vcInterfaces[0], vcInterfaces.size());
    if (iRetValue == ERROR_GETDEVINTERFACE_REQUEST_COUNT)
    {
        cout << "There are more than " << vcInterfaces.size() << " scanCONTROL connected \n";
        uiInterfaceCount = vcInterfaces.size();
    }
    else if (iRetValue < 1)
    {
        cout << "A error occured during searching for connected scanCONTROL \n";
        uiInterfaceCount = 0;
    } else
        uiInterfaceCount = iRetValue;

    if (uiInterfaceCount == 0)
        cout << "There is no scanCONTROL connected \n";
    else if (uiInterfaceCount == 1)
        cout << "There is 1 scanCONTROL connected \n";
    else
        cout << "There are " << uiInterfaceCount << " scanCONTROL connected \n";

    for (guint32 i = 0; i < uiInterfaceCount; i++)
    {
        cout << vcInterfaces[i] << "\n";
    }

    /* Make an instance for each LLT */
    m_pLLT = new LLT();

    if ((iRetValue = SetPathtoDeviceProperties("./device_properties.dat")) < GENERAL_FUNCTION_OK)
    {
        cout << "Error setting device ID path\nExit program...\n";
        exit(0);
    }

    if ((m_pLLT->SetDeviceInterface(vcInterfaces[0])) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting dev id " << iRetValue <<"!\n";
        exit(0);
    }

    /* Connect to sensor */
    if ((iRetValue = m_pLLT->Connect()) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while connecting to camera - Error " << iRetValue <<"!\n";
        exit(0);
    }

    if ((iRetValue = m_pLLT->GetLLTType(&m_tscanCONTROLType)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while GetLLTType!\n";
        exit(0);
    }

    if (iRetValue == GENERAL_FUNCTION_DEVICE_NAME_NOT_SUPPORTED)
    {
        cout << "Can't decode scanCONTROL type. Please contact Micro Epsilon for a newer version of the library.\n";
    }

    if(m_tscanCONTROLType == scanCONTROL27xx_xxx)
    {
        cout << "The scanCONTROL is a scanCONTROL27xx\n";
    }
    else if(m_tscanCONTROLType == scanCONTROL26xx_xxx)
    {
        cout << "The scanCONTROL is a scanCONTROL26xx\n";
    }
    else if(m_tscanCONTROLType == scanCONTROL29xx_xxx)
    {
        cout << "The scanCONTROL is a scanCONTROL29xx\n";
    }
    else
    {
        cout << "The scanCONTROL is a undefined type\nPlease contact Micro-Epsilon for a newer SDK\n";
    }

    cout << "Get all possible resolutions\n";
    if((iRetValue = m_pLLT->GetResolutions(&vuiResolutions[0], vuiResolutions.size())) < GENERAL_FUNCTION_OK)
    {
        cout << "Error GetResolutions!\n";
        exit(0);
    }

    m_uiResolution = vuiResolutions[0];

    if (m_pLLT->SetResolution(m_uiResolution) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting transmission mode!\n";
        exit(0);
    }

    if (m_pLLT->SetProfileConfig(PROFILE) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting SetProfileConfig!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_IDLETIME, uiIdleTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting FEATURE_FUNCTION_IDLETIME!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_SHUTTERTIME, uiShutterTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting FEATURE_FUNCTION_SHUTTERTIME!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_TRIGGER, 0x00000000) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting FEATURE_FUNCTION_TRIGGER!\n";
        exit(0);
    }

    cout << "Register callbacks\n";

    // Example user data
    int llt_id = 1;

    /* Register Callbacks for program handling */
    if ((m_pLLT->RegisterBufferCallback((gpointer)&NewProfile, &llt_id)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while registering buffer callback!\n";
        exit(0);
    }

    if ((m_pLLT->RegisterControlLostCallback((gpointer)&ControlLostCallback, NULL)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while registering control lost callback!\n";
        exit(0);
    }

    if (GetProfilesCallback() < GENERAL_FUNCTION_OK)
    {
        cout << "Error in GetProfiles_Callback!\n";
        exit(0);
    }

    /* Disconnect to sensor */
    cout << "Disconnect\n";
    if ((iRetValue = m_pLLT->Disconnect()) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while connecting to camera - Error " << iRetValue <<"!\n";
        exit(0);
    }

    FreeEvent(&event);
	
	delete m_pLLT;
}

int GetProfilesCallback()
{
    int iRetValue = 0;
    m_ProfileCount = 0;

    std::vector<double> ValueX, ValueZ;

    m_NeededProfileCount = 140;

    cout << "Show getting profiles via Callback\n";

    m_uiProfileBuffer.resize(m_uiResolution * 64);

    ValueX.resize(m_uiResolution);
    ValueZ.resize(m_uiResolution);

    // Setup transfer of multiple profiles
    if ((iRetValue = m_pLLT->TransferProfiles(NORMAL_TRANSFER, true)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error in profile transfer!\n";
        return iRetValue;
    }

    cout << "Start aquisition of profiles\n";

    ResetEvent(&event);
    if(WaitForSingleObject(&event, 2) != 0)
    {
       printf("Timeout!\n");
    }

    /* Stop transfer */
    if ((iRetValue = m_pLLT->TransferProfiles(NORMAL_TRANSFER, false)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while stopping transmission!\n";
        return iRetValue;
    }

    if (m_ProfileCount == m_NeededProfileCount && m_uiProfileDataSize == m_uiProfileBuffer.size())
    {
        cout << "1: All " << m_ProfileCount <<  " profiles reveived with correct size\n";
    }
    else
    {
        cout << "1: Wrong profile count: " << m_ProfileCount << "\n";
    }

    /* Display example points */
    iRetValue = ConvertProfile2Values(&m_uiProfileBuffer[0], m_uiProfileBuffer.size(), &m_pLLT->appData, m_uiResolution, 0, NULL, NULL, NULL, &ValueX[0], &ValueZ[0], NULL, NULL);
    if (iRetValue == (CONVERT_X | CONVERT_Z))
    {
        cout << "X/Z extracted\n";
    }

    DisplayProfiles(&ValueX[0], &ValueZ[0], m_uiResolution);
    DisplayTimestamp(&m_uiProfileBuffer[(m_uiResolution * 64) - 16]);

    return GENERAL_FUNCTION_OK;
}

void NewProfile (const void * pucData, size_t uiSize, gpointer user_data)
{
    if (pucData != NULL && uiSize == m_uiProfileBuffer.size() && *(int *)user_data == 1 && m_ProfileCount < m_NeededProfileCount)
    {
       m_uiProfileDataSize = uiSize;
       memcpy(&m_uiProfileBuffer[0], pucData, uiSize);
       m_ProfileCount++;

       Timestamp2TimeAndCount(&m_uiProfileBuffer[m_uiResolution*64-16], &sc, &so, &profileCounter);
       if (firstTrans == false)
       {
           if ((profileCounter != oldProfileCounter + 1) || !(profileCounter == 0 && oldProfileCounter == 16777215))
               lostProfiles += profileCounter - oldProfileCounter - 1;
       }
       else
           firstTrans = false;

       oldProfileCounter = profileCounter;

       fprintf(stderr, "PC: %d LP: %d \r", profileCounter, lostProfiles);
    }
    if (m_ProfileCount >= m_NeededProfileCount)
    {
         SetEvent(&event);
    }
}

void ControlLostCallback (ArvGvDevice * mydevice, gpointer user_data)
{
    /* Control of the device is lost. Display a message and force application exit */
    if (mydevice)
    {
        cout << "Control lost\n";
        exit(0);        
    } 
}

void DisplayProfiles(double * adValueX, double * adValueZ, guint32 uiResolution)
{
    for (guint32 i = 0; i < uiResolution; i++)
    {
       cout << "\rX: " << adValueX[i] << "  Z: " << adValueZ[i];
       usleep(1250);
    }
    cout << "\n";
}

void DisplayTimestamp (guchar * uiTimestamp)
{
    double dShutterOpen, dShutterClose;
    guint32 uiProfileCount;

    Timestamp2TimeAndCount(&uiTimestamp[0], &dShutterOpen, &dShutterClose, &uiProfileCount);

    cout.precision(8);
    cout << "Profile Count: " << uiProfileCount << " ShutterOpen: " << dShutterOpen << " ShutterClose: " << dShutterClose << "\n";
    cout.precision(6);
}
