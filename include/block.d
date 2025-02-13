import include.colors;
import include.cords;
import include.settings;

import raylib;

import std.stdio;
import std.string;

class Cell {
	Block *block;

	this(Block *b) {
		block = b;
	}
};

Cell[50][50] gridCells;

class Block {
	Color hintColor;

	string name;
	const char* title;
	const char* descript;

	this(string name, const char* title, const char* descript, Color hintColor) {
		this.name = name;
		this.title = title;
		this.descript = descript;
		this.hintColor = hintColor;
	}
};
Block[] blocks;

Block Grass;
Block Sand;
Block Void;
Block Ice;
Block Granite;

long current;

void initBlocks() {
	Void = new Block("void", "Void", "Empty", ColBlack);
	Grass = new Block("grass", "Grass", "Travka", ColGreen);
	Sand = new Block("sand", "Sand", "It's falling(maybe)", ColYellow);
	Ice = new Block("ice", "Ice", "So cold!", LBlue);
	Granite = new Block("granite", "Red granite", "Very smart", Reddy);

	blocks ~= Void;
	blocks ~= Grass;
	blocks ~= Sand;
	blocks ~= Ice;
	blocks ~= Granite;

	selectItem(0);
	clearGrid();

	selectItem(1);

	writeln("Собраны блоки:");
	foreach(Block blc; blocks) {
		writeln("Блок ", fromStringz(blc.name));
	}
}

void clearGrid() {
	if (isGridEmpty()) return;	

	writeln("Поле очищено");
	for (int i = 0; i < rowNum; i++) {
		for (int j = 0; j < rowNum; j++) {
			gridCells[i][j] = new Cell(&Void);
		}
	}
}

int isGridEmpty() {
	for (int i = 0; i < rowNum; i++) {
		for (int j = 0; j < rowNum; j++) {
			if (!gridCells[i][j]) return 0;
			if (gridCells[i][j].block != &Void) return 0;
		}
	}

	return 1;
}

void updateMouse() {
	if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) destroyBlock(gridNCords);
	else if (IsMouseButtonDown(MOUSE_RIGHT_BUTTON)) setBlock(&blocks[current], gridNCords);
}

void setBlock(Block *block, Cords c) {
	if (gridCells[c.x][c.y].block != block) {
		gridCells[c.x][c.y] = new Cell(block);

		writeln("Установлен блок: ", fromStringz(block.name), ", ", c);
	}
}

void destroyBlock(Cords c) {
	if (gridCells[c.x][c.y].block != &Void) {
		writeln("Блок удален: ", fromStringz(gridCells[c.x][c.y].block.name), ", ", c);
		gridCells[c.x][c.y] = new Cell(&Void);
	}
}

void selectItem(long block) {
	current = block;
	writeln("Выбран блок: ", fromStringz(blocks[current].name));
}

void showBlockPallete() {
	BeginDrawing();
	DrawRectangle(10, 10, 400, 100, ColBlack);
	DrawRectangleLines(10, 10, 400, 100, ColWhite);

	DrawRectangle(20, 20, 80, 80, blocks[current].hintColor);
	DrawRectangleLines(20, 20, 80, 80, ColWhite);

	DrawText(blocks[current].title, 110, 20, 25, ColWhite);
	DrawText(blocks[current].descript, 110, 55, 20, ColWhite);
}
