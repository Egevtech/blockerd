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
	${cc} -c include/settings.d -of=temp/settings.o ${paths}
	${cc} -c include/grid.d -of=temp/grid.o ${paths}
	${cc} -c include/block.d -of=temp/block.o ${paths}
	${cc} -c include/cords.d -of=temp/cords.o ${paths}
	${cc} -c include/colors.d -of=temp/colors.o ${paths}

build: target pre
	${cc} temp/game.o temp/grid.o temp/block.o temp/cords.o temp/colors.o temp/settings.o -of=target/blocker -L-lraylib 

run: build
	target/blocker

clean:
	rm -rf target
	rm -rf temp