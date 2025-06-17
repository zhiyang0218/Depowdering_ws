#ifndef TRANSFERMULTIPLEPROFILESEXAMPLE_H
#define TRANSFERMULTIPLEPROFILESEXAMPLE_H

#include <libllt.h>
#include <iostream>
#include <vector>

#define MAX_INTERFACE_COUNT 	5
#define MAX_RESOLUTION 		6

void ControlLostCallback(ArvGvDevice *gv_device, gpointer ptr);

int SetPeakFilters(void);
int SetPeakValues(gushort , gushort , gushort , gushort );
int SetFreeMeasuringFieldValues(gushort , gushort , gushort , gushort );
int SetDynamicMeasuringFieldTrackingValues(gushort , gushort , gushort , gushort );

void write_command(guint32 , guint32 );
void write_value(gushort );
void reset_command_list();
void end_command_list();

LLT * m_pLLT;
guint32 m_uiResolution;
TScannerType m_tscanCONTROLType;
int m_toggle = 0;

#endif // TRANSFERMULTIPLEPROFILESEXAMPLE_H
