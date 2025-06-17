#include "Calibration.h"
#include <math.h>

using namespace std;

int main()
{    
    int iRetValue;
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

    if (m_pLLT->SetProfileConfig(PROFILE) < GENERAL_FUNCTION_OK)
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

    cout << "Register callbacks\n";

    if ((m_pLLT->RegisterControlLostCallback((gpointer)&ControlLostCallback, NULL)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error while registering control lost callback!\n";
        exit(0);
    }

    if (Calibration() < GENERAL_FUNCTION_OK)
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
	
	delete m_pLLT;
}

/*
* Set Calibration
*/
int Calibration()
{    
    int iRetValue = 0;
    /**** Custom calibration****/

    // Center of rotation and angle
    double center_x = -9; // mm
    double center_z = 86.7; // mm
    double angle = -45; // \B0

    // Rotation center is shifted by
    double shift_x = 0; // mm
    double shift_z = 0; // mm

    cout << "Set Calibration" << "\n";
    if ((iRetValue = m_pLLT->SetCustomCalibration(center_x, center_z, angle, shift_x, shift_z)) < GENERAL_FUNCTION_OK)
    {
        return iRetValue;
    }

    cout << "Reset Calibration" << "\n";
    if ((iRetValue = m_pLLT->ResetCustomCalibration()) < GENERAL_FUNCTION_OK)
    {
        return iRetValue;
    }

    return GENERAL_FUNCTION_OK;
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
