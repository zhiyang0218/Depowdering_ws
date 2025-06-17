#ifndef TRANSFERMULTIPLEPROFILESEXAMPLE_H
#define TRANSFERMULTIPLEPROFILESEXAMPLE_H

#include <libllt.h>
#include <iostream>
#include <vector>

#define MAX_INTERFACE_COUNT 	5
#define MAX_RESOLUTION 		6

void ControlLostCallback(ArvGvDevice *gv_device, gpointer);
void ControlLostCallback(ArvGvDevice *gv_device, gpointer);
int Calibration(void);


LLT * m_pLLT;
guint32 m_uiResolution;
TScannerType m_tscanCONTROLType;

#endif // TRANSFERMULTIPLEPROFILESEXAMPLE_H
