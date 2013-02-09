;; pic16f690_osctune, Copyright 2013 Vicente Oscar Mier Vela <vomv1988@gmail.com>
;;    This file is part of pic16f690_osctune.
;;
;;    pic16f690_osctune is free software: you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation, either version 3 of the License, or
;;    (at your option) any later version.
;;
;;    pic16f690_osctune is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.
;;
;;    You should have received a copy of the GNU General Public License
;;    along with pic16f690_osctune.  If not, see <http://www.gnu.org/licenses/>.
	processor	pic16f690
	include		<p16f690.inc>

	global		set_ports

	extern		set_anselh_ansel
	extern		set_pinout_tris
	extern		set_eusart_19200

libtt	code
set_ports:
	call		set_anselh_ansel	;;	<< Initial pinout / EUSART settings
	call		set_pinout_tris		;;	<<
	call		set_eusart_19200	;;	<<
	return
	end
