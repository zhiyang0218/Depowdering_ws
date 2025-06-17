#ifndef TRANSFERMULTIPLEPROFILESEXAMPLE_H
#define TRANSFERMULTIPLEPROFILESEXAMPLE_H

#include <libllt.h>
#include <iostream>
#include <vector>

#define MAX_INTERFACE_COUNT 	5
#define MAX_RESOLUTION 		6

void ControlLostCallback(ArvGvDevice *gv_device);

int MultiLLT(void);
void DisplayProfiles(double * , double * , guint32);
void DisplayTimestamp (guchar * );
void NewProfile (const void * , size_t , gpointer);

LLT * m_pLLT, * m_pLLT2;
guint32 m_uiResolution, m_uiResolution2;
std::vector<unsigned char> m_uiProfileBuffer, m_uiProfileBuffer2;
TScannerType m_tscanCONTROLType, m_tscanCONTROLType2;
guint32    m_ProfileCount, m_ProfileCount2, m_NeededProfileCount, m_NeededProfileCount2;
guint32 m_uiProfileDataSize;
guint32 m_uiProfileDataSize2;


#endif // TRANSFERMULTIPLEPROFILESEXAMPLE_H
