sudo ?= sudo
cc ?= ldc2

all: build

tempo:
	mkdir -p temp

target:
	mkdir -p target

pre: tempo
	${cc} -c game.d -of=temp/game.o -I/usr/include/d

build: target pre
	${cc} temp/game.o -of=target/blocker -L-lraylib 

run: build
	target/blocker