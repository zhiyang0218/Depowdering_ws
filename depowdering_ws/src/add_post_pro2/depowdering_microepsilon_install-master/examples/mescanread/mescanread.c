#include "mescanread.h"
#include <sched.h>
#include <errno.h>
#include <pthread.h>

// If cancel is TRUE, the g_main_loop is terminated after e.g. periodic_task_cb timeout
static gboolean cancel = FALSE;
EHANDLE event;

/***
   main
***/
int
main (int argc, char **argv)
{
    /* Please make sure the scanner is in default transmission mode */

    int i, param;
    int iRetValue;
    char * acInterfaces[MAX_INTERFACE_COUNT];
    unsigned int uiInterfaceCount = 0;

    CreateEvent(&event);

    pthread_t thread1;

    m_ProfileCount = 0;
    m_NeededProfileCount = 100;

    /* DEFINE CURRENTLY SET SCANNER RESOLUTION HERE */
    m_uiResolution = 1280;

    ApplicationData data;
    MEDeviceData device_data;
    ArvCamera * camera;
    ArvStream * stream;
    ArvDevice * device;

    /* Init standard settings */
    const char * path_dev_properties = "./device_properties.dat";
    double exposure_time_ms = 0.05*1000, frame_rate_Hz = 25;

    /* Option handler */
    while ( (param = getopt(argc, argv, "hp:f:e:") ) != -1)
    {
        switch( param )
        {
        case 'h':   /* show help */
            show_help();
            exit(0);
            break;
        case 'p':	/* path to device_properties.dat */
            path_dev_properties = (char *)optarg;
            break;
        case 'f':	/* set frame rate in Hz */
            frame_rate_Hz = (double)atof(optarg);
            break;
        case 'e':	/* set exposure time in ms */
            exposure_time_ms = (double)atof(optarg) *1000;
            break;
        default:	break;
        }
        exit(0);
    }

    iRetValue = GetDeviceInterfaces(&acInterfaces[0], (sizeof(acInterfaces) / sizeof(char)));
    if (iRetValue == -251)
    {
        printf("There are more than %ld scanCONTROL connected \n", (sizeof(acInterfaces) / sizeof(*acInterfaces)));
        uiInterfaceCount = (sizeof(acInterfaces) / sizeof(*acInterfaces));

    }
    else if (iRetValue < 1)
    {
        printf("A error occured during searching for connected scanCONTROL \n");
        uiInterfaceCount = 0;
    }
    else
        uiInterfaceCount = iRetValue;

    if (uiInterfaceCount == 0)
        printf("There is no scanCONTROL connected \n");
    else if (uiInterfaceCount == 1)
        printf("There is 1 scanCONTROL connected \n");
    else
        printf("There are %d scanCONTROL connected \n", uiInterfaceCount);

    for (i = 0; i < iRetValue; i++)
        printf("Dev %d: %s\n", i , acInterfaces[i]);

    /* Mandatory glib type system initialization */
    arv_g_type_init ();

    /* Instantiation of the first available camera */
    camera = arv_camera_new (NULL);

    if (camera != NULL)
    {
        void (*old_sigint_handler)(int);
        gint payload;
        //GError * error = NULL;

        const char * camera_name;
        const char * vendor_name;
        const char * serial_number;
        int iRetValue = 0;

        /* Get camera information*/
        camera_name = arv_camera_get_model_name (camera);
        vendor_name = arv_camera_get_vendor_name (camera);
        serial_number = arv_camera_get_device_id(camera);
        printf("---\nCamera Information:\n---\nVendor Name:\t%s\nCamera Name:\t%s\nSerial Number:\t%s\n---\n", vendor_name, camera_name, serial_number);

        /* Get device object for more complete access to camera features */
        device = arv_camera_get_device (camera);

        /* Example Device operation via register (Change LaserPower on to off) */
        //arv_device_write_register (device, 0xf0f00824, 0x82000000, &error);
        /* if (error != NULL)
        {
            printf("Setting the laser power failed\n");
            g_clear_error(&error);
        }*/

        /* Example Device operation via genicam integer node (Change LaserPower off to reduced) (other nodes are equivalent) */
        //arv_device_set_integer_feature_value (device, "LaserPower", 1);

        /* Set back to standard laser power */
        //arv_device_write_register (device, 0xf0f00824, 0x82000002, &error);
        /* if (error != NULL)
        {
            printf("Setting the laser power failed\n");
            g_clear_error(&error);
        }*/

        /* Init ME scanner device */
        iRetValue = InitDevice(camera_name, &device_data, path_dev_properties);
        if (iRetValue < 1)
        {
            printf("Error - Init failed (Error: %d)\n", iRetValue);
            exit(0);
        }

        /* Setting up necessary callback data */
        data.scaling = device_data.scaling;
        data.offset = device_data.offset;

        /* Set acquisition data */
        //arv_camera_set_frame_rate (camera, frame_rate_Hz);
        //arv_camera_set_exposure_time (camera,  exposure_time_ms);
	
        m_uiProfileBufferSize = m_uiResolution * 64;
        m_uiProfileBuffer = (guchar *)malloc(m_uiProfileBufferSize*sizeof(guchar));

        /* iRetValuerieve image payload (number of bytes per image) */
        payload = arv_camera_get_payload (camera);

        /* Create a new stream object */
        stream = arv_camera_create_stream (camera, NULL/*stream_cb*/, NULL); // activate stream callback if aravis version 0.3.7 has performance issues

        if (stream != NULL)
        {
            /* Push 50 buffer in the stream input buffer queue */
            for (i = 0; i < 50; i++)
                arv_stream_push_buffer (stream, arv_buffer_new (payload, NULL));

            /* Start the video stream */
            arv_camera_start_acquisition (camera);

            /* Connect the new-buffer signal */
            g_signal_connect (stream, "new-buffer", G_CALLBACK (new_buffer_cb), &data);

            /* And enable emission of this signal (it's disabled by default for performance reason) */
            arv_stream_set_emit_signals (stream, TRUE);

            /* Connect the control-lost signal */
            g_signal_connect (device, "control-lost", G_CALLBACK (control_lost_cb), NULL);

            /* Install the callback for periodic tasks every x seconds */
            g_timeout_add_seconds (1, periodic_task_cb, &data);

            /* Create a new glib main loop */
            data.main_loop = g_main_loop_new (NULL, FALSE);

            old_sigint_handler = signal (SIGINT, set_cancel);

            /* Run the main loop */
            pthread_create(&thread1, NULL, (void*)&g_main_loop_run, data.main_loop);

	    printf("Start aquisition!\n");

	    ResetEvent(&event);	    
	    if (WaitForSingleObject(&event, 5) != 0)
	    {
		printf("Timeout or Error while waiting for event\n");
	    }
	    
            signal (SIGINT, old_sigint_handler);

            g_main_loop_quit (data.main_loop);

            g_main_loop_unref (data.main_loop);

            /* Stop the video stream */
            arv_camera_stop_acquisition (camera);

            g_object_unref (stream);

            if (m_ProfileCount == m_NeededProfileCount)
                printf("All profiles received!\n");
            else
                printf("Not all profiles received!\n");

            printf("Convert Profiles\n");
            double ValueX[m_uiResolution];
            double ValueZ[m_uiResolution];

            iRetValue = ConvertProfile2Values(&m_uiProfileBuffer[0], m_uiProfileBufferSize, &data, m_uiResolution, 0, NULL, NULL, NULL, &ValueX[0], &ValueZ[0], NULL, NULL);
            if (iRetValue < 1)
            {
                printf("Error while ConvertProfile2Values!\n");
            }
        }
        else
        {
            printf ("Can't create stream thread (check if the device is not already used)\n");
            exit(0);
        }

        printf("Disconnect!\n");
        g_object_unref (camera);
    }
    else
    {
        printf ("No Scanner found\n");
        exit(0);
    }

    FreeEvent(&event);

    return 0;
}

/***
   show_help prints the help dialog
***/
void show_help (void)
{
    printf( "\nmescanread version 0.1b\n"
            "Program connects to SCANCONTROL and reads requested data\n"
            "Usage: mescanread [-hd] [-f measurement_frequency] [-e exposure_time] [-p path_to_device_propierties.dat]\n"
            "\t-h show this help\n"
            "\t-f Set measurment frequency\n"
            "\t-e Set exposure time\n"
            "\t-p path to device propierties\n");
}

/***
   set_cancel defines the cancel signal
***/
void
set_cancel (int signal)
{
    cancel = TRUE;
}

/***
   periodic_task_cb is executed every timeout (timeout set by g_timeout_add_seconds)
***/
gboolean
periodic_task_cb (void *abstract_data)
{
        // For regular output

        ApplicationData *data = abstract_data;
        /*int i;
        double ValueX[m_uiResolution];
        double ValueZ[m_uiResolution];

        ConvertProfile2Values(&m_uiProfileBuffer[0], m_uiProfileBufferSize, data, m_uiResolution, 0, NULL, NULL, NULL, &ValueX[0], &ValueZ[0], NULL, NULL);

        for (i = 0; i < m_uiResolution; i+=10)
        {
                printf("%.3f:%.3f\r", ValueX[i], ValueZ[i]);
                usleep(5);
        }*/

        if (cancel)
        {
                if (g_main_loop_is_running(data->main_loop) == TRUE)
                	g_main_loop_quit (data->main_loop);
                return FALSE;
        }

        return TRUE;
}

/***
   control_lost_cb is executed if the control over the camera is lost
***/
void
control_lost_cb (ArvGvDevice *gv_device)
{
    /* Control of the device is lost. Display a message and force application exit */
    printf ("Control lost\n");
    cancel = TRUE;
}

guint32 old_profile_counter = 0;
guint32 lost_profiles = 0;
gboolean first_trans = TRUE;

/***
   new_buffer_cb is executed for every new frame received
***/
void new_buffer_cb (ArvStream * stream, ApplicationData * data)
{
    ArvBuffer *buffer;
    const void * pucData;
    size_t buffersize;
    guint32 profile_counter = 0;
    double shutter_open = 0.0;
    double shutter_close = 0.0;

    buffer = arv_stream_pop_buffer (stream);

    if (buffer != NULL && arv_buffer_get_status (buffer) == ARV_BUFFER_STATUS_SUCCESS)
    {
        pucData = arv_buffer_get_data(buffer, &buffersize);

fprintf(stderr, "HI");

        if (pucData != NULL && buffersize == m_uiProfileBufferSize)
        {
            memcpy(&m_uiProfileBuffer[0], pucData, buffersize);
            m_ProfileCount++;

            Timestamp2TimeAndCount(&m_uiProfileBuffer[m_uiResolution*64-16], &shutter_open, &shutter_close, &profile_counter);
            if (first_trans == FALSE)
            {
                if ((profile_counter != old_profile_counter + 1) || !(profile_counter == 0 && old_profile_counter == 16777215))
                    lost_profiles += profile_counter - old_profile_counter - 1;
            }
            else
                first_trans = TRUE;

            old_profile_counter = profile_counter;

            fprintf(stderr, "PC: %d LP: %d \r", profile_counter, lost_profiles);
        }
        if (m_ProfileCount >= m_NeededProfileCount)
        {            
             SetEvent(&event);
        }
    }
    arv_stream_push_buffer (stream, buffer);
}

// If aravis 0.3.7 is used this can help with performance issues
/*
void stream_cb (void * user_data, ArvStreamCallbackType type, ArvBuffer * buffer)
{
    if (type == ARV_STREAM_CALLBACK_TYPE_INIT)
    {
        if(!arv_make_thread_realtime(19) && !arv_make_thread_high_priority(-19))
        {
            g_warning("Setting Priority to HIGH failed (nice: -19 | realtime: 19) -> Permission DENIED --- Setting to MEDIUM (nice: -15 | realtime: 15) priority --- may cause profile loss or interrupted transmission");

            if(!arv_make_thread_realtime(15) && !arv_make_thread_high_priority(-15))
                g_warning("Setting Priority to MEDIUM failed -> Permission DENIED --- may cause profile loss or interrupted transmission)");
        }
    }
}*/

