/////////////////////////////////////////////////////////////////////////////////
// Windar Photnics A/S
// SPI/USB/RS485 hub device
//
// Developed by Michal Gonda
// 20/11/2013
/////////////////////////////////////////////////////////////////////////////////
/*----------------------------------------------------------------------------*/
/* C main line */
/*----------------------------------------------------------------------------*/
#include <m8c.h>
#include "PSoCAPI.h"
#include "TX8SW_1.h"
#include "RX8_1.h"

#define MAX_TX_ARRAY  37

/*-------------------------------------------------------------------*/
/*constant definitions and macros */
/*-------------------------------------------------------------------*/
/* This has the same name as the User Module ISR, so the compiler will */
/* jump directly to the C routine instead of passing through the */
/* assembly language ISR.*/
#pragma interrupt_handler UART_RX_ISR_C

/*-------------------------------------------------------------------*/
/* Prototypes */
/*-------------------------------------------------------------------*/
void TestPrint (int);
BOOL fWaitToReceiveByte(void);
void rs485_Tx(void);	/* set RS485 into Tx mode */
void rs485_Rx(void);	/* set RS485 into Rx mode */

void 
	
/*-------------------------------------------------------------------*/
/* Variable allocation */
/*-------------------------------------------------------------------*/
	
BYTE bRxData; /* Global bRxData - saves code - ptrs are expensive, for fWaitToReceiveByte function */

BYTE buffer[64];
BYTE buffer2[64];
BYTE RS485buffer[64];
BYTE length;

BYTE SPI_DATA;

BYTE Read_Data0[64];
BYTE PC_to_MCU_Data[64];

BYTE Dummt1[MAX_TX_ARRAY] = {0xEA,0x21,0x02,0xb6,0x02,0x56,0x02,0xe9,0x02,0xde,0x01,0x00,0x3f,0x00,0x55,0x00,0x68,0x00,0x6f,0x10,0x11,0x0c,0x0a,0x00,0x05,0x04,0x02,0x12,0x34,0x14,0x32,0x0c,0xcc,0x0f,0xff,0x07,0x16};


void main(void)
{

	
	M8C_EnableGInt;		/* Enable global interrupts */

	TX8SW_1_Start();	/* initalise Software TX-SIO - note that the name is prefix _1_ */
	
	RX8_1_Start(RX8_PARITY_NONE);	/* Enable user module and set parity */
	
	USBFS_Start(0, USB_5V_OPERATION);	/* Start USBFS Operation using device 0 at 5V */
	while(!USBFS_bGetConfiguration());	/* Wait for Device to enumerate */
	USBFS_EnableOutEP(2);				/* Enables the specified endpoint for OUT Bulk or Interrupt transfers/IN COMPARISON DisableOutEP */
	USBFS_LoadInEP(1, &buffer[0], length, USB_NO_TOGGLE);	/* Begin initial USB transfers */
	
	SPIM_1_Start(SPIM_1_SPIM_MODE_0 | SPIM_1_SPIM_MSB_FIRST);	/*Sets the mode configuration of the SPI interface and enables the SPIM module !!! 
																all of the slave select signal(s) should be
																asserted high to deselect connected SPI Slave devices !!! */
	
	TestPrint(1);
	
	while(1)
	{		
		
				
		
		
		
		
		
		
	}
}

void TestPrint(int step)
	{
		switch(step)
		{
			case 1:	TX8SW_1_CPutString(" TEST 1 ");
					break;
			case 2:	TX8SW_1_CPutString(" TEST 2 ");
					break;
			case 3:	TX8SW_1_CPutString(" TEST 3 ");
					break;
			case 4:	TX8SW_1_CPutString(" TEST 4 ");
					break;
			case 5:	TX8SW_1_CPutString(" TEST 5 ");
					break;
		}		
		TX8SW_1_PutCRLF();
	}

BOOL fWaitToReceiveByte(void)
	{
		BYTE bRxStatus;
		/* Wait to receive full byte*/
		while ( !( bRxStatus=RX8_1_bReadRxStatus() & RX8_1_RX_COMPLETE ) )
		{
			/* might want to sleep or keep track of time */
		}
		/* data received, now check for errors */
		if (( bRxStatus & RX8_1_RX_NO_ERROR ) == 0 )
		{
			/* no error detected */
			bRxData = RX8_1_bReadRxData();
			return( TRUE );
		}
		else
		{
			/* error detected */
			bRxData = bRxStatus;
			return( FALSE );
		}
	}

void rs485_Rx(void)
	{
		PRT3DR &= ~0x28;		 // set RS485 into Rx mode		
	}

void rs485_Tx(void)
	{
		PRT3DR |= 0x28;		 // set RS485 into Tx mode		
	}