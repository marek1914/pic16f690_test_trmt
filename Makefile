# pic16f690_test_trmt, Copyright 2013 Vicente Oscar Mier Vela <vomv1988@gmail.com>
#    This file is part of pic16f690_test_trmt.
#
#    pic16f690_test_trmt is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    pic16f690_test_trmt is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with pic16f690_test_trmt.  If not, see <http://www.gnu.org/licenses/>.

#
#	Variables:
#

libdir = ./bin/lib
bindir = ./bin/bin
incdir = ./bin/include

src_libdir = ./src/lib
src_bindir = ./src/bin
src_incdir = ./src/include

objects := \
	${libdir}/test_trmt.o \
	${libdir}/set_ports.o \
		${libdir}/set_anselh_ansel.o \
		${libdir}/set_pinout_tris.o \
		${libdir}/set_eusart_19200.o

objname = trmt
libname = libtt

mainobj := ${bindir}/main_${objname}.o
mosrc := ${src_bindir}/main_${objname}.asm
moincludes := ${incdir}/config.inc
modeps := ${mosrc} ${moincludes}

mainlibs := ${libdir}/${libname}.a
maindeps := ${mainobj} ${mainlibs}

script = /usr/share/gputils/lkr/16f690.lkr

output := ${bindir}/${objname}.hex

stc = ./simu/sim1.stc

#
#	Paths:
#

vpath %.inc ${src_incdir}
vpath %.asm ${src_libdir}

#
#	Main target:
#

all : ${output}

${output} : ${maindeps} ${script}
	gplink -m -o ${@} -s ${script} ${maindeps}

#
#	Main object:
#

${mainobj} : ${modeps}
	gpasm -c -o ${@} -I${incdir} ${<}

${moincludes} : ${incdir}/%.inc : %.inc
	cp ${<} ${@}

#
#	Libraries:
#

${mainlibs} : ${objects}
	test -e ${@} || gplib -c ${@} ${^} && gplib -r ${@} ${?}

${objects} : ${libdir}/%.o : %.asm
	gpasm -c -o ${@} -I${incdir} ${<}

#
#	Phonies:
#

sim :
	test -e ${bindir}/${objname}.cod && \
	gpsim -L. -pp16f690 -s ${bindir}/${objname}.cod -c ${stc}

erase :
	pk2cmd -E -B/usr/share/pk2 -PPIC16F690 

prog :
	pk2cmd -M -B/usr/share/pk2 -PPIC16F690 -F${output}

run :
	pk2cmd -PPIC16F690 -B/usr/share/pk2 -A5 -T

stop :
	pk2cmd -PPIC16F690 -B/usr/share/pk2 -R

clean :
	rm ${libdir}/* ${incdir}/* ${bindir}/*
