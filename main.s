	#include <xc.inc>

psect	code, abs
	
main:
	org	0x0
	goto	start

	org	0x100		    ; Main code starts here at address 0x100
start:
	movlw 	0x0
	movwf	TRISC, A	    ; Port C all outputs
	movlw   0xff		    ; Take high value
	movwf   TRISD, A	    ; Port D all inputs
	movlw	0x0		    ; Reset W low
	bra 	test
loop:
	movff 	0x00, PORTC	    ; 0x00 is the counter
	movff   PORTD, 0x01	    ; 0x01 is how much to iterate by
	movf	0x01, W
	addwf 	0x00, A
test:
	movwf	0x00, A		    ; Send W to 0x00
	movlw 	0xff
	cpfsgt 	0x00, A
	bra 	loop		    ; Not yet finished goto start of loop again
	goto 	0x0		    ; Re-run program from start

	end	main
