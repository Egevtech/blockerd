import include.colors;
import include.cords;
import include.settings;

import raylib;

import std.stdio;

class Cell {
	Block *block;

	this(Block *b) {
		block = b;
	}
};

Cell[25][25] gridCells;

class Block {
	Color hintColor;

	string name;
	string title;
	string descript;

	this(string name, string title, string descript, Color hintColor) {
		this.name = name;
		this.title = title;
		this.descript = descript;
		this.hintColor = hintColor;
	}
};

Block Grass;
Block Sand;
Block Void;

Block *current;

void initBlocks() {
	Void = new Block("void", "Void", "Empty", ColBlack);
	Grass = new Block("grass", "Grass", "Trvka", ColGreen);
	Sand = new Block("sand", "Sand", "It falls", ColYellow);

	for (int i = 0; i < rowNum; i++) {
		for (int j = 0; j < rowNum; j++) {
			gridCells[i][j] = new Cell(&Void);
		}
	}

	current = &Sand;
}

void updateMouse() {
	if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) destroyBlock(gridNCords);
	else if (IsMouseButtonDown(MOUSE_RIGHT_BUTTON)) setBlock(current, gridNCords);
}

void setBlock(Block *block, Cords c) {
	if (gridCells[c.x][c.y].block != block) {
		gridCells[c.x][c.y] = new Cell(block);

		writeln("Установлен блок: ", block.name, ", ", c);
	}
}

void destroyBlock(Cords c) {
	if (gridCells[c.x][c.y].block != &Void) {
		gridCells[c.x][c.y] = new Cell(&Void);

		writeln("Блок удален: ", c);
	}
}