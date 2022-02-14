	#include <xc.inc>

psect	code, abs
	
main:
	org	0x0
	goto	start

	org	0x100		    ; Main code starts here at address 0x100
start:
	movlw 	0x0
	movwf	TRISD, A	    ; Port D all outputs
	movlw   0xff		    ; Take high value
	movwf   TRISE, A	    ; Port E all inputs
	
	end	main
