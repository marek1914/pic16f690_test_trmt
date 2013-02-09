;; pic16f690_test_trmt, Copyright 2013 Vicente Oscar Mier Vela <vomv1988@gmail.com>
;;    This file is part of pic16f690_test_trmt.
;;
;;    pic16f690_test_trmt is free software: you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation, either version 3 of the License, or
;;    (at your option) any later version.
;;
;;    pic16f690_test_trmt is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.
;;
;;    You should have received a copy of the GNU General Public License
;;    along with pic16f690_test_trmt.  If not, see <http://www.gnu.org/licenses/>.
	processor	pic16f690
	include		<p16f690.inc>

	global		set_pinout_tris

libtt	code
set_pinout_tris:
	banksel		TRISA		;;	<< These settings provide the following
	movlw		B'00001001'	;;	<< configuration for the physical terminals
	movwf		TRISA		;;	<< of the PIC16F690:
	movlw		B'00100000'	;;	<<
	movwf		TRISB		;;	<< PORT	PIN	I/O	NAME	FUNCTION
	movlw		B'00000000'	;;	<< RA3	4	I	DISIPO	Ser data in
	movwf		TRISC		;;	<< RA5	2	O	DOSIPO	Ser data out
	banksel		PORTA		;;	   RA4	3	O	CKSIPO	Clock out
	clrf		PORTA		;;	   RC5	5	O	LDSIPO	Load D out
	clrf		PORTB		;;	   RC4	6	O	CRSIPO	Clear out
	clrf		PORTC		;;	   RA0	19	I	DIPISO	Ser data in
					;;	   RA1	18	O	DOPISO	Ser data out
					;;	   RA2	17	O	CKPISO	Clock out
					;;	   RC0	16	O	LDPISO	Load D out
					;;	   RC1	15	O	CRPISO	Clear out
					;;	   RB5	12	I	RX	RX in
					;;	   RB7	10	O	TX	TX out
	return
	end
