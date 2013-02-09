	processor	pic16f690
	include		<p16f690.inc>
	include		<coff.inc>
	include		<config.inc>

	extern		set_ports
	extern		test_trmt

start	code		H'0000'
	goto		main

prog	code
main:
	call		set_ports
test:
	call		test_trmt
	goto		test
	end
