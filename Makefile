PROFILE = -g #-pg
CFLAGS = $(PROFILE) -O0 `pkg-config --cflags gtk+-2.0` -Wall -Werror
LDFLAGS = $(PROFILE) -O0 `pkg-config --libs gtk+-2.0` -Wall -Werror

all:	mypaint

mypaint:	surface.o mypaint.o brush_dab.o brush.o helpers.o mydrawwidget.o

brush_settings.inc:	brush.h generate.py
	./generate.py

brush.o:	brush_settings.inc brush.c
	cc $(CFLAGS) -c -o brush.o brush.c

clean:
	rm *.o mypaint brush_settings.inc
