	#include <xc.inc>

psect	code, abs
	
main:
	org 0x0
	start EQU 0x1		;start the array at this position in the RAM
	length EQU 0x0		;array length here
	movlw 0xa
	movwf length, A
	lfsr 0, start		;set FSR0 to the origin
loop:
	movff FSR0, POSTINC0	;set the element value, increment
	decfsz length, A	;decrease the counter, if good continue
	goto loop
	
