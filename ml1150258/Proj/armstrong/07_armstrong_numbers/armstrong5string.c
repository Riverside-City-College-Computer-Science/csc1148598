#include "stdio.h"
#include "math.h"
#include "stdlib.h"

/* we allocate sufficient space to store the widest integer */
#define MAXWIDTH 5

/* numeric string characters are offset from their value */
#define NUMOFFSET 48

int main()
{
  int number;
  for (number=10; number < 100000; number++)
  {
    char string[MAXWIDTH+1] = {};
    snprintf(string, MAXWIDTH+1, "%d", number);
    int numlen = strnlen(string, MAXWIDTH);
     
    int total = 0;
    int j;
    for (j=0; j < numlen; j++)
    {
      int digit = string[j] - NUMOFFSET;
      total += pow(digit, numlen);
    }
    if (total == number)
      printf("ARMSTRONG NUMBER is %d\n", total);
  }
  exit(0);
}
