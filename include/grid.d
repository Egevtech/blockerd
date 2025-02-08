import raylib;

import std.stdio;
import std.datetime;

import std.conv : to;
import std.conv;
import std.string;

// typedef ;

alias Color = raylib.raylib_types.Color;

int rowNum = 25;
int rowLen = 50;
int textSize = 10;

Color ColWhite = Color( 255, 255, 255, 255 );
Color Reddy = Color(255, 100, 100, 255);
Color ColBlack = Color( 0, 0, 0, 255);

struct Cords {
	int x;
	int y;
}

class Block {

}

class Cell {
	Block block;
};

Cell[] gridCells;


Cords mouseCords = {0, 0};
Cords gridCords = {0, 0};

void pushMouseCords(Cords *crds) {
	crds.x = GetMouseX();
	crds.y = GetMouseY();
}

void showGrid() {
	Cords oldCords = mouseCords;
	pushMouseCords(&mouseCords);

	if ((oldCords.x != mouseCords.x || oldCords.y != mouseCords.y) && IsMouseButtonDown(MOUSE_RIGHT_BUTTON)) {
		gridCords.x -= oldCords.x - mouseCords.x;
		gridCords.y -= oldCords.y - mouseCords.y;
	}

	drawGrid();
}

void drawGrid() {

	float wheelMove = GetMouseWheelMove() * 2.00;

	gridCords.x -= wheelMove * 7f;
	gridCords.y -= wheelMove * 7f;

	rowLen += wheelMove;

	if (rowLen < 10) {
		rowLen = 10;

		gridCords.x += wheelMove * 7f;
		gridCords.y += wheelMove * 7f;
	}

	DrawLine(gridCords.x, gridCords.y, gridCords.x+rowNum*rowLen, gridCords.y, ColWhite);
	DrawLine(gridCords.x + rowNum*rowLen, gridCords.y, gridCords.x + rowNum*rowLen, gridCords.y + rowNum*rowLen, ColWhite);
	DrawLine(gridCords.x + rowNum*rowLen, gridCords.y + rowNum*rowLen, gridCords.x, gridCords.y + rowNum*rowLen, ColWhite);
	DrawLine(gridCords.x, gridCords.y + rowNum*rowLen, gridCords.x, gridCords.y, ColWhite);

	Cords grida = gridCords;

	for (int i = 0; i < rowNum; i++) {
		Color c = ColWhite;

		if (grida.x < mouseCords.x && mouseCords.x < grida.x + rowLen) c = Reddy;
		if (grida.x > mouseCords.x && mouseCords.x > grida.x - rowLen) c = Reddy;

		DrawText(to!string(i).toStringz(), (grida.x + (MeasureText(to!string(i).toStringz(), 10)/2)), grida.y - 15, 20, ColWhite);

		DrawLine(grida.x, grida.y, grida.x, grida.y+rowNum*rowLen, c);
		grida.x += rowLen;
	}

	for (int i = 0; i < rowNum; i++) {
		Color c = ColWhite;

		if (grida.y < mouseCords.y && mouseCords.y < grida.y + rowLen) c = Reddy;
		if (grida.y > mouseCords.y && mouseCords.y > grida.y - rowLen) c = Reddy;

		DrawLine(gridCords.x, grida.y, gridCords.x+rowNum*rowLen - 10/2, grida.y, c);
		grida.y += rowLen;
	}

}