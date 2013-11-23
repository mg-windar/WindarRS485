/******************************************************************************
*  Generated by PSoC Designer 5.1.2309
******************************************************************************/
#include <m8c.h>
// SS_o address and mask defines
#pragma	ioport	SS_o_Data_ADDR:	0x0
BYTE			SS_o_Data_ADDR;
#pragma	ioport	SS_o_DriveMode_0_ADDR:	0x100
BYTE			SS_o_DriveMode_0_ADDR;
#pragma	ioport	SS_o_DriveMode_1_ADDR:	0x101
BYTE			SS_o_DriveMode_1_ADDR;
#pragma	ioport	SS_o_DriveMode_2_ADDR:	0x3
BYTE			SS_o_DriveMode_2_ADDR;
#pragma	ioport	SS_o_GlobalSelect_ADDR:	0x2
BYTE			SS_o_GlobalSelect_ADDR;
#pragma	ioport	SS_o_IntCtrl_0_ADDR:	0x102
BYTE			SS_o_IntCtrl_0_ADDR;
#pragma	ioport	SS_o_IntCtrl_1_ADDR:	0x103
BYTE			SS_o_IntCtrl_1_ADDR;
#pragma	ioport	SS_o_IntEn_ADDR:	0x1
BYTE			SS_o_IntEn_ADDR;
#define SS_o_MASK 0x2
#pragma	ioport	SS_o_MUXBusCtrl_ADDR:	0x1d8
BYTE			SS_o_MUXBusCtrl_ADDR;
// Data_Rdy_i address and mask defines
#pragma	ioport	Data_Rdy_i_Data_ADDR:	0x0
BYTE			Data_Rdy_i_Data_ADDR;
#pragma	ioport	Data_Rdy_i_DriveMode_0_ADDR:	0x100
BYTE			Data_Rdy_i_DriveMode_0_ADDR;
#pragma	ioport	Data_Rdy_i_DriveMode_1_ADDR:	0x101
BYTE			Data_Rdy_i_DriveMode_1_ADDR;
#pragma	ioport	Data_Rdy_i_DriveMode_2_ADDR:	0x3
BYTE			Data_Rdy_i_DriveMode_2_ADDR;
#pragma	ioport	Data_Rdy_i_GlobalSelect_ADDR:	0x2
BYTE			Data_Rdy_i_GlobalSelect_ADDR;
#pragma	ioport	Data_Rdy_i_IntCtrl_0_ADDR:	0x102
BYTE			Data_Rdy_i_IntCtrl_0_ADDR;
#pragma	ioport	Data_Rdy_i_IntCtrl_1_ADDR:	0x103
BYTE			Data_Rdy_i_IntCtrl_1_ADDR;
#pragma	ioport	Data_Rdy_i_IntEn_ADDR:	0x1
BYTE			Data_Rdy_i_IntEn_ADDR;
#define Data_Rdy_i_MASK 0x20
#pragma	ioport	Data_Rdy_i_MUXBusCtrl_ADDR:	0x1d8
BYTE			Data_Rdy_i_MUXBusCtrl_ADDR;
// MISO_i address and mask defines
#pragma	ioport	MISO_i_Data_ADDR:	0x4
BYTE			MISO_i_Data_ADDR;
#pragma	ioport	MISO_i_DriveMode_0_ADDR:	0x104
BYTE			MISO_i_DriveMode_0_ADDR;
#pragma	ioport	MISO_i_DriveMode_1_ADDR:	0x105
BYTE			MISO_i_DriveMode_1_ADDR;
#pragma	ioport	MISO_i_DriveMode_2_ADDR:	0x7
BYTE			MISO_i_DriveMode_2_ADDR;
#pragma	ioport	MISO_i_GlobalSelect_ADDR:	0x6
BYTE			MISO_i_GlobalSelect_ADDR;
#pragma	ioport	MISO_i_IntCtrl_0_ADDR:	0x106
BYTE			MISO_i_IntCtrl_0_ADDR;
#pragma	ioport	MISO_i_IntCtrl_1_ADDR:	0x107
BYTE			MISO_i_IntCtrl_1_ADDR;
#pragma	ioport	MISO_i_IntEn_ADDR:	0x5
BYTE			MISO_i_IntEn_ADDR;
#define MISO_i_MASK 0x8
#pragma	ioport	MISO_i_MUXBusCtrl_ADDR:	0x1d9
BYTE			MISO_i_MUXBusCtrl_ADDR;
// MISO_i Shadow defines
//   MISO_i_DataShadow define
extern BYTE Port_1_Data_SHADE;
#define MISO_i_DataShadow (*(unsigned char*)&Port_1_Data_SHADE)
// MOSI_o address and mask defines
#pragma	ioport	MOSI_o_Data_ADDR:	0x4
BYTE			MOSI_o_Data_ADDR;
#pragma	ioport	MOSI_o_DriveMode_0_ADDR:	0x104
BYTE			MOSI_o_DriveMode_0_ADDR;
#pragma	ioport	MOSI_o_DriveMode_1_ADDR:	0x105
BYTE			MOSI_o_DriveMode_1_ADDR;
#pragma	ioport	MOSI_o_DriveMode_2_ADDR:	0x7
BYTE			MOSI_o_DriveMode_2_ADDR;
#pragma	ioport	MOSI_o_GlobalSelect_ADDR:	0x6
BYTE			MOSI_o_GlobalSelect_ADDR;
#pragma	ioport	MOSI_o_IntCtrl_0_ADDR:	0x106
BYTE			MOSI_o_IntCtrl_0_ADDR;
#pragma	ioport	MOSI_o_IntCtrl_1_ADDR:	0x107
BYTE			MOSI_o_IntCtrl_1_ADDR;
#pragma	ioport	MOSI_o_IntEn_ADDR:	0x5
BYTE			MOSI_o_IntEn_ADDR;
#define MOSI_o_MASK 0x20
#pragma	ioport	MOSI_o_MUXBusCtrl_ADDR:	0x1d9
BYTE			MOSI_o_MUXBusCtrl_ADDR;
// MOSI_o Shadow defines
//   MOSI_o_DataShadow define
extern BYTE Port_1_Data_SHADE;
#define MOSI_o_DataShadow (*(unsigned char*)&Port_1_Data_SHADE)
// SCLK_o address and mask defines
#pragma	ioport	SCLK_o_Data_ADDR:	0x4
BYTE			SCLK_o_Data_ADDR;
#pragma	ioport	SCLK_o_DriveMode_0_ADDR:	0x104
BYTE			SCLK_o_DriveMode_0_ADDR;
#pragma	ioport	SCLK_o_DriveMode_1_ADDR:	0x105
BYTE			SCLK_o_DriveMode_1_ADDR;
#pragma	ioport	SCLK_o_DriveMode_2_ADDR:	0x7
BYTE			SCLK_o_DriveMode_2_ADDR;
#pragma	ioport	SCLK_o_GlobalSelect_ADDR:	0x6
BYTE			SCLK_o_GlobalSelect_ADDR;
#pragma	ioport	SCLK_o_IntCtrl_0_ADDR:	0x106
BYTE			SCLK_o_IntCtrl_0_ADDR;
#pragma	ioport	SCLK_o_IntCtrl_1_ADDR:	0x107
BYTE			SCLK_o_IntCtrl_1_ADDR;
#pragma	ioport	SCLK_o_IntEn_ADDR:	0x5
BYTE			SCLK_o_IntEn_ADDR;
#define SCLK_o_MASK 0x80
#pragma	ioport	SCLK_o_MUXBusCtrl_ADDR:	0x1d9
BYTE			SCLK_o_MUXBusCtrl_ADDR;
// SCLK_o Shadow defines
//   SCLK_o_DataShadow define
extern BYTE Port_1_Data_SHADE;
#define SCLK_o_DataShadow (*(unsigned char*)&Port_1_Data_SHADE)
// SIORX address and mask defines
#pragma	ioport	SIORX_Data_ADDR:	0xc
BYTE			SIORX_Data_ADDR;
#pragma	ioport	SIORX_DriveMode_0_ADDR:	0x10c
BYTE			SIORX_DriveMode_0_ADDR;
#pragma	ioport	SIORX_DriveMode_1_ADDR:	0x10d
BYTE			SIORX_DriveMode_1_ADDR;
#pragma	ioport	SIORX_DriveMode_2_ADDR:	0xf
BYTE			SIORX_DriveMode_2_ADDR;
#pragma	ioport	SIORX_GlobalSelect_ADDR:	0xe
BYTE			SIORX_GlobalSelect_ADDR;
#pragma	ioport	SIORX_IntCtrl_0_ADDR:	0x10e
BYTE			SIORX_IntCtrl_0_ADDR;
#pragma	ioport	SIORX_IntCtrl_1_ADDR:	0x10f
BYTE			SIORX_IntCtrl_1_ADDR;
#pragma	ioport	SIORX_IntEn_ADDR:	0xd
BYTE			SIORX_IntEn_ADDR;
#define SIORX_MASK 0x2
#pragma	ioport	SIORX_MUXBusCtrl_ADDR:	0x1db
BYTE			SIORX_MUXBusCtrl_ADDR;
// SIORX Shadow defines
//   SIORX_DataShadow define
extern BYTE Port_3_Data_SHADE;
#define SIORX_DataShadow (*(unsigned char*)&Port_3_Data_SHADE)
// TX8SW_1Pin address and mask defines
#pragma	ioport	TX8SW_1Pin_Data_ADDR:	0xc
BYTE			TX8SW_1Pin_Data_ADDR;
#pragma	ioport	TX8SW_1Pin_DriveMode_0_ADDR:	0x10c
BYTE			TX8SW_1Pin_DriveMode_0_ADDR;
#pragma	ioport	TX8SW_1Pin_DriveMode_1_ADDR:	0x10d
BYTE			TX8SW_1Pin_DriveMode_1_ADDR;
#pragma	ioport	TX8SW_1Pin_DriveMode_2_ADDR:	0xf
BYTE			TX8SW_1Pin_DriveMode_2_ADDR;
#pragma	ioport	TX8SW_1Pin_GlobalSelect_ADDR:	0xe
BYTE			TX8SW_1Pin_GlobalSelect_ADDR;
#pragma	ioport	TX8SW_1Pin_IntCtrl_0_ADDR:	0x10e
BYTE			TX8SW_1Pin_IntCtrl_0_ADDR;
#pragma	ioport	TX8SW_1Pin_IntCtrl_1_ADDR:	0x10f
BYTE			TX8SW_1Pin_IntCtrl_1_ADDR;
#pragma	ioport	TX8SW_1Pin_IntEn_ADDR:	0xd
BYTE			TX8SW_1Pin_IntEn_ADDR;
#define TX8SW_1Pin_MASK 0x80
#pragma	ioport	TX8SW_1Pin_MUXBusCtrl_ADDR:	0x1db
BYTE			TX8SW_1Pin_MUXBusCtrl_ADDR;
// TX8SW_1Pin Shadow defines
//   TX8SW_1Pin_DataShadow define
extern BYTE Port_3_Data_SHADE;
#define TX8SW_1Pin_DataShadow (*(unsigned char*)&Port_3_Data_SHADE)
