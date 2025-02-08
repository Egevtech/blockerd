import raylib;

import include.block;
import include.cords;
import include.colors;

int rowNum = 25;
int rowLen = 50;
int textSize = 10;

class Cell {
	Block block;
};

Cell[] gridCells;

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

	if (rowLen > 50) {
		rowLen = 50;

		gridCords.x += wheelMove * 7f;
		gridCords.y += wheelMove * 7f;
	}

	for (int nx = 0; nx < rowNum; nx++) {
	for (int ny = 0; ny < rowNum; ny++) 
	{

		Color col = ColWhite;

		int cellX = nx*rowLen + gridCords.x;
		int cellY = ny*rowLen + gridCords.y;

		if (mouseCords.x > cellX &&
			mouseCords.x < cellX + rowLen &&
			mouseCords.y > cellY &&
			mouseCords.y < cellY + rowLen) 
				DrawRectangle(cellX, cellY, rowLen, rowLen, AGrey);
		else 
			DrawRectangleLines(cellX, cellY, rowLen, rowLen, col);
	}}


	DrawLine(gridCords.x, gridCords.y, gridCords.x+rowNum*rowLen, gridCords.y, ColWhite);
	DrawLine(gridCords.x + rowNum*rowLen, gridCords.y, gridCords.x + rowNum*rowLen, gridCords.y + rowNum*rowLen, ColWhite);
	DrawLine(gridCords.x + rowNum*rowLen, gridCords.y + rowNum*rowLen, gridCords.x, gridCords.y + rowNum*rowLen, ColWhite);
	DrawLine(gridCords.x, gridCords.y + rowNum*rowLen, gridCords.x, gridCords.y, ColWhite);
}