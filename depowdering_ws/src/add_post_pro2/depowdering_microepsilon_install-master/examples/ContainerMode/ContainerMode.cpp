#include "ContainerMode.h"
#include <math.h>

// Event handle
EHANDLE event;

using namespace std;

int main()
{
    int iRetValue;

    CreateEvent(&event);

    std::vector<char *> vcInterfaces(MAX_INTERFACE_COUNT);
    std::vector<unsigned int> vuiResolutions(MAX_RESOLUTION);
    unsigned int uiInterfaceCount = 0;

    unsigned int uiIdleTime = 900;
    unsigned int uiShutterTime = 100;

    iRetValue = GetDeviceInterfaces(&vcInterfaces[0], vcInterfaces.size());
    if (iRetValue == ERROR_GETDEVINTERFACE_REQUEST_COUNT)
    {
        cout << "There are more than " << vcInterfaces.size() << " scanCONTROL connected \n";
        uiInterfaceCount = vcInterfaces.size();

    } else if (iRetValue < 1)
    {
        cout << "A error occured during searching for connected scanCONTROL \n";
        uiInterfaceCount = 0;
    } else {
        uiInterfaceCount = iRetValue;
    }

    if (uiInterfaceCount == 0)
        cout << "There is no scanCONTROL connected \n";
    else if (uiInterfaceCount == 1)
        cout << "There is 1 scanCONTROL connected \n";
    else
        cout << "There are " << uiInterfaceCount << " scanCONTROL connected \n";

    for (unsigned int i = 0; i < uiInterfaceCount; i++)
    {
        cout << vcInterfaces[i] << "\n";
    }

    if ((iRetValue = SetPathtoDeviceProperties("./device_properties.dat")) < GENERAL_FUNCTION_OK)
    {
        cout << "Error setting device ID path\nExit program...\n";
        exit(0);
    }

    /* Make an instance for each LLT */
    m_pLLT = new LLT();

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

    if ((m_pLLT->SetProfileConfig(CONTAINER)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting BufferCount!\n";
        exit(0);
    }

    if ((m_pLLT->SetBufferCount(5)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting BufferCount!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_IDLETIME, uiIdleTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting uiIdleTime!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_SHUTTERTIME, uiShutterTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting uiShutterTime!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_TRIGGER, 0x00000000) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting trigger!\n";
        exit(0);
    }

    cout << "Set PacketSize\n";
    if((iRetValue = m_pLLT->SetPacketSize(320)) < GENERAL_FUNCTION_OK)
    {
      cout << "Error during SetPacketSize\n" << iRetValue;
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

    if (ContainerMode() < GENERAL_FUNCTION_OK)
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

int ContainerMode()
{    
     int iRetValue;
     unsigned int uiFieldCount = 1;
     unsigned int uiProfileCount = 100;
     m_ContainerCount = 0;
     m_NeededContainerCount = 1;
     unsigned int dwInquiry;

     //Bitfeld=Round(Log2(Auflösung)) for the resolution bitfield for the container
     double dTempLog = 1.0/log(2.0);
     unsigned int dwResolutionBitField = (unsigned int)floor((log((double)m_uiResolution)*dTempLog)+0.5);

     cout << "Demonstrate the container mode with rearrangement\n";
     if((iRetValue = m_pLLT->GetFeature(INQUIRY_FUNCTION_REARRANGEMENT_PROFILE, &dwInquiry)) < GENERAL_FUNCTION_OK)
     {
       cout << "Error during GetFeature";
       return iRetValue;
     }

     if((dwInquiry & 0x80000000) == 0)
     {
       cout << "\nThe connected scanCONTROL don't support the container mode\n\n";
       return iRetValue;
     }

     //Extract Z
     //calculation for the points per profile = Round(Log2(Auflösung))
     //Extract only 1th reflection
     cout << "Set the rearangement parameter\n";
     if((iRetValue = m_pLLT->SetFeature(FEATURE_FUNCTION_REARRANGEMENT_PROFILE, 0x00120001 | dwResolutionBitField<<12)) < GENERAL_FUNCTION_OK)
     {
       cout << "Error during SetFeature(FEATURE_FUNCTION_REARRANGEMENT_PROFILE)";
       return iRetValue;
     }

     cout << "Set profile container size\n";
     if((iRetValue = m_pLLT->SetProfileContainerSize(m_uiResolution*uiFieldCount, uiProfileCount)) < GENERAL_FUNCTION_OK)
     {
       cout << "Error during SetProfileContainerSize";
       return iRetValue;
     }

     m_uiContainerBuffer.resize(m_uiResolution*uiFieldCount*uiProfileCount);

    // Setup transfer of multiple profiles
    if ((iRetValue = m_pLLT->TransferProfiles(NORMAL_CONTAINER_MODE, true)) < GENERAL_FUNCTION_OK)
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
    if ((iRetValue = m_pLLT->TransferProfiles(NORMAL_CONTAINER_MODE, false)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while stopping transmission!\n";
        return iRetValue;
    }

    if (m_ContainerCount == m_NeededContainerCount && m_uiProfileDataSize == m_uiContainerBuffer.size())
    {
        cout << "1: All " << m_ContainerCount <<  " container reveived with correct size\n";
    }
    else
    {
        cout << "1: Wrong container count: " << m_ContainerCount << "\n";
    }

    cout << "z data first point of image: " << (m_uiContainerBuffer[0] - 32768) * m_pLLT->appData.scaling + m_pLLT->appData.offset << " mm \n";

    return GENERAL_FUNCTION_OK;
}

void NewProfile (const void * pucData, size_t uiSize, gpointer user_data)
{
    if (pucData != NULL && *(int *)user_data == 1)
    {
        if (m_uiContainerBuffer.size() == uiSize/2 && m_ContainerCount < m_NeededContainerCount)
        {
            memcpy(&m_uiContainerBuffer[0], pucData, uiSize/2);
            m_uiProfileDataSize = uiSize/2;
            m_ContainerCount++;
        }
    }
    if (m_ContainerCount >= m_NeededContainerCount)
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

void DisplayProfiles(double * adValueX, double * adValueZ, unsigned int uiResolution)
{
    for (unsigned int i = 0; i < uiResolution; i++)
    {
       cout << "\rX: " << adValueX[i] << "  Z: " << adValueZ[i];
       usleep(1250);
    }
    cout << "\n";
}

void DisplayTimestamp (unsigned char * uiTimestamp)
{
    double dShutterOpen, dShutterClose;
    unsigned int uiProfileCount;

    Timestamp2TimeAndCount(&uiTimestamp[0], &dShutterOpen, &dShutterClose, &uiProfileCount);

    cout.precision(8);
    cout << "Profile Count: " << uiProfileCount << " ShutterOpen: " << dShutterOpen << " ShutterClose: " << dShutterClose << "\n";
    cout.precision(6);
}
