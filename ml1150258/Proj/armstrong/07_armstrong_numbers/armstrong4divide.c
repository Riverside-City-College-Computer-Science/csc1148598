#include "stdio.h"
#include "stdint.h"
#include "stdlib.h"
#include "math.h"

/* work on base 10 */
#define BASE 10

int main()
{
  uint8_t numlen = 2;
  uint16_t number;
  for (number=10; number < 10000; number++)
  {
    if (number >= 1000)
      numlen = 4;
    else if (number >= 100)
      numlen = 3;

    uint32_t counter = number;
    uint8_t digit = counter % BASE;
    uint32_t armstrong = pow(digit, numlen);
    while (counter = (uint32_t) floor(counter / BASE))
    {
      digit = counter % BASE;
      armstrong += pow(digit, numlen);
    }

    if (armstrong == number)
      printf("ARMSTRONG NUMBER is %d\n", armstrong);
  }
  exit(0);
}
