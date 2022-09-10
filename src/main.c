#include "STD_TYPES.h"
#include "BIT_MATH.h"

#include "RCC_interface.h"
#include "DIO_interface.h"




int main()
{

	/* ENABLE HSE CLOCK */
	RCC_voidInitSysClock();
	/* ENABLE CLK ON GPIOA and GPIOB */
	RCC_voidEnableClock(RCC_APB2 , 2);

	MGPIO_voidSetPinDirection(PORTA,PIN0,OUTPUT_2MHZ_PP);
	MGPIO_voidSetPinValue(PORTA,PIN0,HIGH);


	while(1)
	{

	}
    return 0;
}
