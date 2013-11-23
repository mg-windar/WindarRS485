;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: SPIM_1.asm
;;   Version: 2.6, Updated on 2011/9/2 at 9:40:33
;;  Generated by PSoC Designer 5.1.2309
;;
;;  DESCRIPTION: SPIM User Module software implementation file.
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2011. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "SPIM_1.inc"

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export   SPIM_1_EnableInt
export  _SPIM_1_EnableInt
export   SPIM_1_DisableInt
export  _SPIM_1_DisableInt
export   SPIM_1_Start
export  _SPIM_1_Start
export   SPIM_1_Stop
export  _SPIM_1_Stop
export   SPIM_1_SendTxData
export  _SPIM_1_SendTxData
export   SPIM_1_bReadRxData
export  _SPIM_1_bReadRxData
export   SPIM_1_bReadStatus
export  _SPIM_1_bReadStatus

// These globals will be removed in a future release
// Do not use
export   bSPIM_1_ReadRxData
export  _bSPIM_1_ReadRxData
export   bSPIM_1_ReadStatus
export  _bSPIM_1_ReadStatus

;-----------------------------------------------
;  Constant Definitions
;-----------------------------------------------
bfCONTROL_REG_START_BIT:   equ   1     ; Control register start bit


area UserModules (ROM, REL)

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: SPIM_1_EnableInt
;
;  DESCRIPTION:
;     Enables the SPIM interrupt by setting the interrupt enable mask
;     bit associated with this User Module.
;
;     NOTE:  Remember to enable the global interrupt by calling the
;           M8C global macro: M8C_EnableGInt
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  none
;
;  RETURNS:  none
;
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;     Sets the specific user module interrupt enable mask bit.
;
 SPIM_1_EnableInt:
_SPIM_1_EnableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_EnableIntMask SPIM_1_INT_REG, SPIM_1_bINT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: SPIM_1_DisableInt
;
;  DESCRIPTION:
;     Disables this SPIM's interrupt by clearing the interrupt enable mask bit
;     associated with this User Module.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  none
;
;  RETURNS:  none
;
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;     Clears the specific user module interrupt enable mask bit.
;
 SPIM_1_DisableInt:
_SPIM_1_DisableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   M8C_DisableIntMask SPIM_1_INT_REG, SPIM_1_bINT_MASK
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: SPIM_1_Start
;
;  DESCRIPTION:
;     Sets the start bit, SPI mode, and LSB/MSB first configuration of the SPIM
;     user module.
;
;     Transmission will begin transmitting when a byte is written into the TX buffer
;     using the SPIM_1_SendTxData function.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;     BYTE bConfiguration - Consists of SPI Mode and LSB/MSB first bit.
;           Use defined masks - masks can be OR'd together.
;     PASSED in Accumulator.
;
;  RETURNS:  none
;
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;     1) Set all Slave Select outputs high
;     2) Set the specified SPI configuration bits in the Control register.
;
 SPIM_1_Start:
_SPIM_1_Start:
   RAM_PROLOGUE RAM_USE_CLASS_1
   ; setup the SPIM configuration setting
   or    A, bfCONTROL_REG_START_BIT
   mov   REG[SPIM_1_CONTROL_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: SPIM_1_Stop
;
;  DESCRIPTION:
;     Disables SPIM operation.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  none
;
;  RETURNS:  none
;
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;     Clear the start bit in the Control register.
;
 SPIM_1_Stop:
_SPIM_1_Stop:
   RAM_PROLOGUE RAM_USE_CLASS_1
   ; clear the SPIM stop bits
   and   REG[SPIM_1_CONTROL_REG], ~bfCONTROL_REG_START_BIT
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: SPIM_1_SendTxData
;
;  DESCRIPTION:
;     Initiates an SPI data transfer.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;     BYTE  bTxData - data to transmit.
;        Passed in Accumulator.
;
;  RETURNS:  none
;
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;     Writes data to the TX buffer register.
;
 SPIM_1_SendTxData:
_SPIM_1_SendTxData:
   RAM_PROLOGUE RAM_USE_CLASS_1
   ; Transmit the data!
   mov REG[SPIM_1_TX_BUFFER_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: SPIM_1_bReadRxData
;
;  DESCRIPTION:
;     Reads the RX buffer register.  Should check the status regiser to make
;     sure data is valid.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  none
;
;  RETURNS:
;     bRxData - returned in A.
;
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;
 SPIM_1_bReadRxData:
_SPIM_1_bReadRxData:
 bSPIM_1_ReadRxData:
_bSPIM_1_ReadRxData:
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov A, REG[SPIM_1_RX_BUFFER_REG]
   RAM_EPILOGUE RAM_USE_CLASS_1   
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: SPIM_1_ReadStatus
;
;  DESCRIPTION:
;     Reads the SPIM Status bits in the Control/Status register.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  none
;
;  RETURNS:
;     BYTE  bStatus - transmit status data.  Use the defined bit masks.
;        Returned in Accumulator.
;
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION or PROCEDURE:
;     Read the status and control register.
;
 SPIM_1_bReadStatus:
_SPIM_1_bReadStatus:
 bSPIM_1_ReadStatus:
_bSPIM_1_ReadStatus:
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov A,  REG[SPIM_1_CONTROL_REG]
   RAM_EPILOGUE RAM_USE_CLASS_1   
   ret

.ENDSECTION

; End of File SPIM_1.asm
