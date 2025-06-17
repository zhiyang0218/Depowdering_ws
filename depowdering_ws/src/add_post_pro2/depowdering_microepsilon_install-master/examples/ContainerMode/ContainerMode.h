#ifndef TRANSFERMULTIPLEPROFILESEXAMPLE_H
#define TRANSFERMULTIPLEPROFILESEXAMPLE_H

#include <libllt.h>
#include <iostream>
#include <vector>

#define MAX_INTERFACE_COUNT 	5
#define MAX_RESOLUTION 		6

void ControlLostCallback(ArvGvDevice *gv_device, gpointer user_data);

int ContainerMode(void);
void DisplayProfiles(double * , double * , unsigned int);
void DisplayTimestamp (unsigned int * );

void NewProfile (const void * , size_t, gpointer user_data);

LLT * m_pLLT;
guint32 m_uiResolution;
std::vector<guint16> m_uiContainerBuffer;
TScannerType m_tscanCONTROLType;
unsigned int    m_ContainerCount,
                m_NeededContainerCount;


guint32 m_uiProfileDataSize;


#endif // TRANSFERMULTIPLEPROFILESEXAMPLE_H
