#============================
# ju -- https://bw1.eu -- 17-Jan-19  -- Makefile - Linux
#============================
# Quellcode

TARGETS=\
	backup.x \


#============================
# Variablen

CXX:=g++
CC:=gcc

### linux
#INSTPATH=/usr
#CXX:=$(INSTPATH)/bin/g++
#CC:=$(INSTPATH)/bin/gcc

### win10
#INSTPATH=C:\cygwin64
#CXX:=$(INSTPATH)\bin\g++
#CC:=$(INSTPATH)\bin\gcc
#
### Compileroptimierung: 0=keine, 1, 2, 3, s=max (Ressourcen einsparen u. Lauftzeit optimieren)
OPTI=-O0
#
CXXFLAGS=-Wall -g -Wextra -std=c++14 -lpthread -pthread $(OPTI) -Wno-missing-field-initializers
#CXXLIBS=meineFkt.c -lm
#
CFLAGS=-Wall -g -Wextra -std=c11 -lpthread -pthread $(OPTI) -Wno-missing-field-initializers
#CLIBS=-lz meineFkt.c meineFkt.h -lm
#CLIBS=meineFkt.c -lm

#============================
# Compilieren

all: $(TARGETS)

%.x: %.cpp 
	#$(CXX) $(CXXFLAGS) $< $(CXXLIBS) -o $@ 
	$(CXX) $(CXXFLAGS) $<  -o $@ 
%.x: %.c  
	#$(CC) $(CFLAGS) $< $(CLIBS) -o $@ 
	$(CC) $(CFLAGS) $< -o $@ 

#============================
# clean

clean:
	rm -f $(TARGETS) *.x
	rm -f $(TARGETS) *.exe
	rm -f $(TARGETS) *.o *.*~ *~

