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
	call	init_delay
        movff 	0x00, PORTC	    ; 0x00 is the counter
	movff   PORTD, 0x01	    ; 0x01 is how much to iterate by
	movf	0x01, 0, 0	    ; send 0x01(iteration)to W
	addwf 	0x00, A		    ; Add W (iteration) to 0x00 (counter)
test:
	movlw 	0xff
	cpfsgt 	0x00, A
	bra 	loop		    ; Not yet finished goto start of loop again
	goto 	0x0		    ; Re-run program from start
	
	goto finish
init_delay:
	movlw 0xff
	movwf 0x02, A
outer_delay:
	movlw 0xff
	movwf 0x03, A
	decfsz 0x02, F, A
	goto inner_delay
	return
inner_delay:
	decfsz 0x03, F, A
	bra inner_delay
	bra outer_delay
finish:
	end	main
