#include "LLTPeakFilter.h"
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

    if (SetPeakFilters() < GENERAL_FUNCTION_OK)
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
 * Set Extra Parameters (Sharpness register) - peak filter, free measuring field
 */
int SetPeakFilters()
{
    int iRetValue = 0;

    // set the desired PeakFilter values:
    ushort min_width = 2;
    ushort max_width = 1023;
    ushort min_intensity = 0;
    ushort max_intensity = 1023;

    // Write PeakFilter settings to sensor
   cout << "Write Peak filter:\n - Min width: " << min_width << "\n - Max width: " << max_width << "\n - Min intensity: " << min_intensity << "\n - Max intensity: " << max_intensity << "\n";
    if ((iRetValue = SetPeakValues(min_width, max_width, min_intensity, max_intensity)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error during setting peak values" << iRetValue << "\n";
    }

    // set the desired free measuring field
    ushort start_z = 20000;
    ushort size_z = 25000;
    ushort start_x = 20000;
    ushort size_x = 25000;

    // Write free measuring field settings to sensor
    cout << "Write free measuring field:\n - Start z: " << start_z << "\n - Size z: " << size_z << "\n - Start x: " << start_x << "\n - Size x: " << size_x << "\n";
    // Enable the free measuring field
    if ((iRetValue = m_pLLT->SetFeature(FEATURE_FUNCTION_MEASURINGFIELD, 0x82000800)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error during setting the free measuring field" << iRetValue << "\n";
        exit(0);
    }
    // Set the values
    if ((iRetValue = SetFreeMeasuringFieldValues(start_z, size_z, start_x, size_x)) < GENERAL_FUNCTION_OK)
    {
        cout << "Error during setting the free measuring field" << iRetValue << "\n";
        exit(0);
    }

    return GENERAL_FUNCTION_OK;
}

// Set PeakFilter values
int SetPeakValues(gushort min_width, gushort max_width, gushort min_intensity, gushort max_intensity)
{
    reset_command_list();
    write_value(max_width);
    write_value(min_width);
    write_value(max_intensity);
    write_value(min_intensity);
    end_command_list();

    return GENERAL_FUNCTION_OK;
}

// Set free measuring field
int SetFreeMeasuringFieldValues(gushort start_z, gushort size_z, gushort start_x, gushort size_x)
{
    reset_command_list();
    write_command(2, 8);
    write_value(start_z);
    write_value(size_z);
    write_value(start_x);
    write_value(size_x);
    end_command_list();

    return GENERAL_FUNCTION_OK;
}

// Set dynamic measuring field tracking
int SetDynamicMeasuringFieldTrackingValues(gushort div_x, gushort div_z, gushort multi_x, gushort multi_z)
{
    reset_command_list();
    write_command(2, 16);
    write_value(div_x);
    write_value(div_z);
    write_value(multi_x);
    write_value(multi_z);
    end_command_list();

    return GENERAL_FUNCTION_OK;
}

// Write command for sequenciell register
void write_command(guint32 command, guint32 data)
{
    m_pLLT->SetFeature(FEATURE_FUNCTION_SHARPNESS, (guint32)(command << 9) + (m_toggle << 8) + data);
    if (m_toggle == 1)
    {
        m_toggle = 0;
    }
    else
    {
        m_toggle = 1;
    }
}

// Write value in sequenciell register
void write_value(gushort value)
{
    write_command(1, (guint32)(value/256));
    write_command(1, (guint32)(value%256));
}

// Reset seq. register
void reset_command_list()
{
    write_command(0, 0);
    write_command(0, 0);
}

// End writing to seq. register
void end_command_list()
{
    write_command(0, 0);
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
