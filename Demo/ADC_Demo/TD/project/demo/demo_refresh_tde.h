
/*Tde Embedded File for Tde*/
unsigned char MaskBuf[5];		/* Memory to hold MASK data. */

unsigned char TdiBuf[8001];			/* Memory to hold TDI data. */

unsigned char TdoBuf[8001];			/* Memory to hold TDO data. */

unsigned char *HdrBuf=NULL;		/* Memory to hold HDR data. */

unsigned char *TdrBuf=NULL;		/* Memory to hold TDR data. */

unsigned char *HirBuf=NULL;		/* Memory to hold HIR data. */

unsigned char *TirBuf=NULL;		/* Memory to hold TIR data. */

unsigned char *HeapBuf=NULL;		/* Memory to hold HEAP data. */

unsigned char *DMASKBuf=NULL;		/* Memory to hold DMASK data. */

unsigned char * LCOUNTBuf = NULL;	/* Memory to hold LCOUNT data. */

LVDSPair * LVDSBuf = NULL;	/* Memory to hold LVDS Pair. */

extern unsigned char vme1[87L];

short int     vmearrays = 1;
unsigned char *vmeArray[1] = {vme1};
long g_pArraySizes[ 1 ] = { 87L };