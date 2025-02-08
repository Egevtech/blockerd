sudo ?= sudo
cc ?= ldc2

paths := -I/usr/include/d 

all: build

tempo:
	mkdir -p temp

target:
	mkdir -p target

pre: tempo
	${cc} -c game.d -of=temp/game.o ${paths}
	${cc} -c include/grid.d -of=temp/grid.o ${paths}

build: target pre
	${cc} temp/game.o temp/grid.o -of=target/blocker -L-lraylib 

run: build
	target/blocker