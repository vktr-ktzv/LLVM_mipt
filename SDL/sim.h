#define SIM_X_SIZE 512
#define SIM_Y_SIZE 256

#include "stdbool.h"
#include "stdio.h"
#include "stdlib.h"
#include "time.h"
#include <unistd.h>

#ifndef __sim__
void simFlush();
void simPutPixel(int x, int y, int argb);
int simRand();
#endif

extern void simInit();
extern void app();
extern void simExit();
