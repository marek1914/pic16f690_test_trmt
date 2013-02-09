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
