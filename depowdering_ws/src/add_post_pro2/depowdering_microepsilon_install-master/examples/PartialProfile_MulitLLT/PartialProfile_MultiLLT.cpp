#include "PartialProfile_MultiLLT.h"

// Event handle
EHANDLE event;

using namespace std;

int main()
{
    int iRetValue;

    CreateEvent(&event);

    std::vector<char *> vcInterfaces(MAX_INTERFACE_COUNT);
    std::vector<guint32> vuiResolutions(MAX_RESOLUTION);
    guint32 uiInterfaceCount = 0;

    guint32 uiIdleTime = 1500;
    guint32 uiShutterTime = 500;

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

    if (uiInterfaceCount < 2)
    {
        cout << "Please connect 2 scanCONTROL\n";
        exit(0);
    }

    for (guint32 i = 0; i < uiInterfaceCount; i++)
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
    m_pLLT2 = new LLT();

    if ((m_pLLT->SetDeviceInterface(vcInterfaces[0])) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting dev id " << iRetValue <<"!\n";
        exit(0);
    }
    if ((m_pLLT2->SetDeviceInterface(vcInterfaces[1])) < GENERAL_FUNCTION_OK)
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
    if ((iRetValue = m_pLLT2->Connect()) < GENERAL_FUNCTION_OK)
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

    if ((iRetValue = m_pLLT2->GetLLTType(&m_tscanCONTROLType2)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while GetLLTType!\n";
        exit(0);
    }

    if (iRetValue == GENERAL_FUNCTION_DEVICE_NAME_NOT_SUPPORTED)
    {
        cout << "Can't decode scanCONTROL type. Please contact Micro Epsilon for a newer version of the library.\n";
    }

    if(m_tscanCONTROLType2 == scanCONTROL27xx_xxx)
    {
        cout << "The scanCONTROL is a scanCONTROL27xx\n";
    }
    else if(m_tscanCONTROLType2 == scanCONTROL26xx_xxx)
    {
        cout << "The scanCONTROL is a scanCONTROL26xx\n";
    }
    else if(m_tscanCONTROLType2 == scanCONTROL29xx_xxx)
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

    if((iRetValue = m_pLLT2->GetResolutions(&vuiResolutions[0], vuiResolutions.size())) < GENERAL_FUNCTION_OK)
    {
        cout << "Error GetResolutions!\n";
        exit(0);
    }

    m_uiResolution2 = vuiResolutions[0];

    if (m_pLLT2->SetResolution(m_uiResolution2) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting transmission mode!\n";
        exit(0);
    }

    if (m_pLLT->SetProfileConfig(PARTIAL_PROFILE) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting SetProfileConfig!\n";
        exit(0);
    }

    if (m_pLLT2->SetProfileConfig(PARTIAL_PROFILE) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting SetProfileConfig!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_IDLETIME, uiIdleTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting trigger!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_SHUTTERTIME, uiShutterTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting trigger!\n";
        exit(0);
    }

    if (m_pLLT->SetFeature(FEATURE_FUNCTION_TRIGGER, 0x00000000) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting trigger!\n";
        exit(0);
    }

    if (m_pLLT2->SetFeature(FEATURE_FUNCTION_IDLETIME, uiIdleTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting trigger!\n";
        exit(0);
    }

    if (m_pLLT2->SetFeature(FEATURE_FUNCTION_SHUTTERTIME, uiShutterTime) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting trigger!\n";
        exit(0);
    }

    if (m_pLLT2->SetFeature(FEATURE_FUNCTION_TRIGGER, 0x00000000) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while setting trigger!\n";
        exit(0);
    }

    cout << "Register callbacks\n";

    // Example user data
    int llt_id1 = 1;
    int llt_id2 = 2;

    /* Register Callbacks for program handling */
    if ((m_pLLT->RegisterBufferCallback((gpointer)&NewProfile, &llt_id1)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while registering buffer callback!\n";
        exit(0);
    }

    if ((m_pLLT->RegisterControlLostCallback((gpointer)&ControlLostCallback, NULL)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while registering control lost callback!\n";
        exit(0);
    }

    if ((m_pLLT2->RegisterBufferCallback((gpointer)&NewProfile, &llt_id2)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while registering buffer callback!\n";
        exit(0);
    }

    if ((m_pLLT2->RegisterControlLostCallback((gpointer)&ControlLostCallback, NULL)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while registering control lost callback!\n";
        exit(0);
    }

     
    if (MultiLLT() < GENERAL_FUNCTION_OK)
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
    if ((iRetValue = m_pLLT2->Disconnect()) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while connecting to camera - Error " << iRetValue <<"!\n";
        exit(0);
    }

    FreeEvent(&event);
	
	delete m_pLLT;
	delete m_pLLT2;
}

int MultiLLT()
{
    int iRetValue = 0;
    m_ProfileCount = 0;
    m_ProfileCount2 = 0;

    std::vector<double> adValueX, adValueZ, adValueX2,adValueZ2;
	
	// Set Partial Profile Settings for each sensor (X/Z only - more suitable for embedded systems)
    TPartialProfile tPartialProfile1, tPartialProfile2;

    tPartialProfile1.nStartPoint = 0;
    tPartialProfile1.nStartPointData = 4;
    tPartialProfile1.nPointCount = m_uiResolution;
    tPartialProfile1.nPointDataWidth = 4;

    tPartialProfile2.nStartPoint = 0;
    tPartialProfile2.nStartPointData = 4;
    tPartialProfile2.nPointCount = m_uiResolution2;
    tPartialProfile2.nPointDataWidth = 4;

    m_NeededProfileCount = 500;
    m_NeededProfileCount2 = 500;

    cout << "Show getting profiles via Callback\n";

    m_uiProfileBuffer.resize(tPartialProfile1.nPointCount * tPartialProfile1.nPointDataWidth);
    adValueX.resize(tPartialProfile1.nPointCount);
    adValueZ.resize(tPartialProfile1.nPointCount);
    //usInt1.resize(tPartialProfile1.nPointCount);

    m_uiProfileBuffer2.resize(tPartialProfile2.nPointCount * tPartialProfile2.nPointDataWidth);
    adValueX2.resize(tPartialProfile2.nPointCount);
    adValueZ2.resize(tPartialProfile2.nPointCount);
    //usInt2.resize(tPartialProfile1.nPointCount);

        // Setup partial profile transmission
    if ((iRetValue = m_pLLT->SetPartialProfile(tPartialProfile1)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error in set partial profile! " << iRetValue << "\n";
        return iRetValue;
    }

        // Setup partial profile transmission
    if ((iRetValue = m_pLLT2->SetPartialProfile(tPartialProfile2)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error in set partial profile! " << iRetValue << "\n";
        return iRetValue;
    }

    // Setup transfer of multiple profiles
    if ((iRetValue = m_pLLT->TransferProfiles(NORMAL_TRANSFER, true)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error in profile transfer!\n";
        return iRetValue;
    }

    if ((iRetValue = m_pLLT2->TransferProfiles(NORMAL_TRANSFER, true)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error in profile transfer!\n";
        return iRetValue;
    }

    cout << "Start aquisition of profiles\n";

    ResetEvent(&event);

    if(WaitForSingleObject(&event, 11) != 0)
    {
       printf("Timeout!\n");
    }

    /* Stop transfer */
    if ((iRetValue = m_pLLT->TransferProfiles(NORMAL_TRANSFER, false)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error in stopping profile transfer! " << iRetValue << "\n";
        return iRetValue;
    }

    if ((iRetValue = m_pLLT2->TransferProfiles(NORMAL_TRANSFER, false)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error in stopping profile transfer! " << iRetValue << "\n";
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
    if (m_ProfileCount2 == m_NeededProfileCount2 && m_uiProfileDataSize2 == m_uiProfileBuffer2.size())
    {
        cout << "2: All " << m_ProfileCount2 <<  " profiles reveived with correct size\n";
    }
    else
    {
        cout << "2: Wrong profile count: " << m_ProfileCount2 << "\n";
    }

    /* Display example points */
    iRetValue = ConvertPartProfile2Values(&m_uiProfileBuffer[0], m_uiProfileBuffer.size(), &m_pLLT->appData, &tPartialProfile1, 0, NULL, NULL, NULL, &adValueX[0], &adValueZ[0], NULL, NULL);
    if (iRetValue < GENERAL_FUNCTION_OK)
    {
        cout << "Error in converting data! " << iRetValue << "\n";
        return iRetValue;
    }
    iRetValue = ConvertPartProfile2Values(&m_uiProfileBuffer2[0], m_uiProfileBuffer2.size(), &m_pLLT2->appData, &tPartialProfile2, 0, NULL, NULL, NULL, &adValueX2[0], &adValueZ2[0], NULL, NULL);
    if (iRetValue < GENERAL_FUNCTION_OK)
    {
        cout << "Error in converting data! " << iRetValue << "\n";
        return iRetValue;
    }

    DisplayProfiles(&adValueX[0], &adValueZ[0], tPartialProfile1.nPointCount-4);
    DisplayTimestamp(&m_uiProfileBuffer[(tPartialProfile1.nPointCount * tPartialProfile1.nPointDataWidth) - 16]);

    DisplayProfiles(&adValueX2[0], &adValueZ2[0], tPartialProfile2.nPointCount-4);
    DisplayTimestamp(&m_uiProfileBuffer2[(tPartialProfile2.nPointCount * tPartialProfile2.nPointDataWidth) - 16]);

    return GENERAL_FUNCTION_OK;
}

void NewProfile (const void * pucData, size_t uiSize, gpointer user_data)
{
    if (pucData != NULL && *(int *)user_data == 1 && uiSize == m_uiProfileBuffer.size() && m_ProfileCount < m_NeededProfileCount)
    {
       m_uiProfileDataSize = uiSize;
       memcpy(&m_uiProfileBuffer[0], pucData, uiSize);
       m_ProfileCount++;
    }
    if (pucData != NULL && *(int *)user_data == 2  && uiSize == m_uiProfileBuffer2.size() &&  m_ProfileCount2 < m_NeededProfileCount2)
    {
       m_uiProfileDataSize2 = uiSize;
       memcpy(&m_uiProfileBuffer2[0], pucData, uiSize);
       m_ProfileCount2++;
    }
    if (m_ProfileCount >= m_NeededProfileCount && m_ProfileCount2 >= m_NeededProfileCount2)
    {
        SetEvent(&event);
    }
}

void ControlLostCallback (ArvGvDevice * mydevice)
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
