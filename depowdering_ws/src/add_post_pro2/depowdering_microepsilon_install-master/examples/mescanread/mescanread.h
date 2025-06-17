#ifndef MESCANREAD_H
#define MESCANREAD_H

#include <arv.h>

#include <libmescan.h>

#define MAX_INTERFACE_COUNT 	5
#define MAX_RESOLUTION 		6

void show_help (void);
void set_cancel (int);
void control_lost_cb (ArvGvDevice * );
gboolean periodic_task_cb (void * );
void new_buffer_cb (ArvStream * , ApplicationData * );
// void stream_cb (void * , ArvStreamCallbackType , ArvBuffer * );

unsigned int m_uiResolution;
guchar * m_uiProfileBuffer;
unsigned int m_ProfileCount;
unsigned int m_NeededProfileCount;
unsigned int m_uiProfileBufferSize;

#endif // MESCANREAD_H
