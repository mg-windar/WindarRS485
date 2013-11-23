;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: USBFSCommon.asm
;;  Version: 1.80, Updated on 2011/9/2 at 9:40:44
;;  Generated by PSoC Designer 5.1.2309
;;
;;  DESCRIPTION: USB Device User Module software implementation file
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
include "USBFS.inc"

;-----------------------------------------------
; include instance specific register definitions
;-----------------------------------------------

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
;-------------------------------------------------------------------
;  Declare the functions global for both assembler and C compiler.
;
;  Note that there are two names for each API. First name is
;  assembler reference. Name with underscore is name refence for
;  C compiler.  Calling function in C source code does not require
;  the underscore.
;-------------------------------------------------------------------

export    USBFS_EP1_ISR
export   _USBFS_EP1_ISR
export    USBFS_EP2_ISR
export   _USBFS_EP2_ISR
export    USBFS_EP3_ISR
export   _USBFS_EP3_ISR
export    USBFS_EP4_ISR
export   _USBFS_EP4_ISR
export    USBFS_RESET_ISR
export   _USBFS_RESET_ISR
export    USBFS_SOF_ISR
export   _USBFS_SOF_ISR
export    USBFS_WAKEUP_ISR
export   _USBFS_WAKEUP_ISR


AREA InterruptRAM (RAM, REL, CON)
;@PSoC_UserCode_INIT@ (Do not change this line.)
;---------------------------------------------------
; Insert your custom declarations below this banner
;---------------------------------------------------

;------------------------
; Includes
;------------------------


;------------------------
;  Constant Definitions
;------------------------


;------------------------
; Variable Allocation
;------------------------


;---------------------------------------------------
; Insert your custom declarations above this banner
;---------------------------------------------------
;@PSoC_UserCode_END@ (Do not change this line.)

AREA text (ROM, REL)

;-----------------------------------------------------------------------------
;  FUNCTION NAME: USBFS_EP1_ISR
;
;  DESCRIPTION:    Handle the Endpoint 1 event by updating the data toggle
;                  and setting the endpoint state to EVENT_PENDING.  The SIE
;                  automatically set the mode to NAK both IN and out transfers
;-----------------------------------------------------------------------------
export  USBFS_EP1_ISR
export _USBFS_EP1_ISR
 USBFS_EP1_ISR:
_USBFS_EP1_ISR:
   ;@PSoC_UserCode_BODY_EP1@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
STD_EP1:    EQU     1   ; Set this equate to 0 to remove the standard
                        ; endpoint handling code
   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

IF  STD_EP1
    push    A
    xor     [USBFS_EPDataToggle], 2 ; Update EP1 data toggle
    M8C_SetBank1	; _EP1MODE is in Bank 1
    mov     A, reg[USBFS_EP1MODE]      ; Get the mode
	M8C_SetBank0
    mov     [USBFS_EndpointAPIStatus+1], EVENT_PENDING ; For the API
    pop     A
    reti
ENDIF

;-----------------------------------------------------------------------------
;  FUNCTION NAME: USBFS_EP2_ISR
;
;  DESCRIPTION:    Handle the Endpoint 2 event by updating the data toggle
;                  and setting the endpoint state to EVENT_PENDING.  The SIE
;                  automatically set the mode to NAK both IN and out transfers
;-----------------------------------------------------------------------------
export  USBFS_EP2_ISR
export _USBFS_EP2_ISR
 USBFS_EP2_ISR:
_USBFS_EP2_ISR:

   ;@PSoC_UserCode_BODY_EP2@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
STD_EP2:    EQU     1   ; Set this equate to 0 to remove the standard
                        ; endpoint handling code
   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

IF  STD_EP2
    push    A
    xor     [USBFS_EPDataToggle], 4 ; Update EP2 data toggle
    M8C_SetBank1
    mov     A, reg[USBFS_EP2MODE]      ; Get the mode
    M8C_SetBank0
    mov     [USBFS_EndpointAPIStatus + 2], EVENT_PENDING ; For the API
    pop     A
    reti
ENDIF


;-----------------------------------------------------------------------------
;  FUNCTION NAME: USBFS_EP3_ISR
;
;  DESCRIPTION:    Handle the Endpoint 3 event by updating the data toggle
;                  and setting the endpoint state to EVENT_PENDING.  The SIE
;                  automatically set the mode to NAK both IN and out transfers
;-----------------------------------------------------------------------------
 USBFS_EP3_ISR:
_USBFS_EP3_ISR:

   ;@PSoC_UserCode_BODY_EP3@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
STD_EP3:    EQU     1   ; Set this equate to 0 to remove the standard
                        ; endpoint handling code
   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

IF  STD_EP3
    push    A
    xor     [USBFS_EPDataToggle], 8 ; Update EP3 data toggle
    M8C_SetBank1
    mov     A, reg[USBFS_EP3MODE]      ; Get the mode
    M8C_SetBank0
    mov     [USBFS_EndpointAPIStatus + 3], EVENT_PENDING ; For the API
    pop     A
    reti
ENDIF


;-----------------------------------------------------------------------------
;  FUNCTION NAME: USBFS_EP4_ISR
;
;  DESCRIPTION:    Handle the Endpoint 4 event by updating the data toggle
;                  and setting the endpoint state to EVENT_PENDING.  The SIE
;                  automatically set the mode to NAK both IN and out transfers
;-----------------------------------------------------------------------------
 USBFS_EP4_ISR:
_USBFS_EP4_ISR:

   ;@PSoC_UserCode_BODY_EP4@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
STD_EP4:    EQU     1   ; Set this equate to 0 to remove the standard
                        ; endpoint handling code
   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

IF  STD_EP4
    push    A
    xor     [USBFS_EPDataToggle], 16 ; Update EP4 data toggle
    M8C_SetBank1
    mov     A, reg[USBFS_EP4MODE]      ; Get the mode
    M8C_SetBank0
    mov     [USBFS_EndpointAPIStatus + 4], EVENT_PENDING ; For the API
    pop     A
    reti
ENDIF


;-----------------------------------------------------------------------------
;  FUNCTION NAME: USBFS_RESET_ISR
;
;  DESCRIPTION:    Handle the USB Bus Reset Interrupt
;-----------------------------------------------------------------------------
export  USBFS_RESET_ISR
export _USBFS_RESET_ISR
 USBFS_RESET_ISR:
_USBFS_RESET_ISR:
;   mov     [USBFS_Configuration], 0
;   mov     [USBFS_DeviceStatus], 0
;   mov     [USBFS_InterfaceSetting], 0
;   mov     [USBFS_EndpointStatus], 0
;   mov     [USBFS_TransferType], 0
;   mov     [USBFS_fDataPending], 0
;   mov     reg[USBFS_EP0MODE], USB_MODE_STALL_IN_OUT ; ACK Setup/Stall IN/OUT
;   mov     reg[USBFS_EP1MODE], 0
;   mov     reg[USBFS_EP2MODE], 0
;   mov     reg[USBFS_EP3MODE], 0
;   mov     reg[USBFS_EP4MODE], 0
;   mov     X, USB_MAX_EP_NUMBER       ; Set up loop to clear all of the endpoint data items
;.loop:
;   mov     [X + USBFS_EPDataToggle], 0  ; Or in the toggle
;   dec     X                          ; Are we done?
;   jnz     .loop                      ; Jump to do another endpoint

;   mov     reg[USBFS_ADDR], USB_ADDR_ENABLE ; Enable Address 0

   ;@PSoC_UserCode_BODY_USB_RESET@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

STD_USB_RESET:    EQU     1 ; Set this equate to 0 to remove the standard
                            ; USB reset handling code below

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

IF  STD_USB_RESET
	push 	A
	push    X
    ISR_PRESERVE_PAGE_POINTERS
	M8C_SetBank1
	mov		A, reg[USBFS_USB_CR1]		          ; Get the RegEnable
	M8C_SetBank0
	and 	A, 0x03                          ; mask off the RegEnable and EnableLock bits
	mov		X, A                             ; save value in X
    mov     A, [USBFS_bCurrentDevice]     ; Select the current device
    RAM_RESTORE_NATIVE_PAGING
	lcall   _USBFS_Start     ; Restart USB
    ISR_RESTORE_PAGE_POINTERS
    pop X
    pop A

ENDIF

	reti



 USBFS_SOF_ISR:
_USBFS_SOF_ISR:

   ;@PSoC_UserCode_BODY_6@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom assembly code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
   
   ;---------------------------------------------------
   ; Insert your custom assembly code above this banner
   ;---------------------------------------------------
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function below this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   
   ;PRESERVE_CPU_CONTEXT
   ;lcall _My_C_Function
   ;RESTORE_CPU_CONTEXT
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function above this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

 USBFS_WAKEUP_ISR:
_USBFS_WAKEUP_ISR:

   ;@PSoC_UserCode_BODY_7@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom assembly code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
   
   ;---------------------------------------------------
   ; Insert your custom assembly code above this banner
   ;---------------------------------------------------
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function below this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   
   ;PRESERVE_CPU_CONTEXT
   ;lcall _My_C_Function
   ;RESTORE_CPU_CONTEXT
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function above this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

; End of File USBFS.asm