	processor	pic16f690
	include		<p16f690.inc>

	variable	i

	global		test_trmt

	udata
TRMT_T	res		1

libtt	code
test_trmt:
	movlw		B'00000000'
	movwf		TRMT_T
	banksel		TXREG
	movwf		TXREG		;;	<< The value of WREG is unimportant
	banksel		TXSTA
i = 0
	while		i < 8
	btfsc		TXSTA,1
	bsf		TRMT_T,i
i += 1
	endw
	movfw		TRMT_T
	banksel		PORTC
	movwf		PORTC
	return
	end
