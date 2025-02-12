import raylib;

import include.cords;
import include.colors;
import include.block;
import include.settings;

import std.stdio;

void showGrid() {
	Cords oldCords = mouseCords;
	pushMouseCords(&mouseCords);

	if ((oldCords.x != mouseCords.x || oldCords.y != mouseCords.y) && IsMouseButtonDown(MOUSE_MIDDLE_BUTTON)) {
		gridCords.x -= oldCords.x - mouseCords.x;
		gridCords.y -= oldCords.y - mouseCords.y;
	}
	
	drawGrid();	
}

void checkKeyboard() {
	if (IsKeyDown(341) ) {
		showBlockPallete();
	}

	if (IsKeyDown(341) && GetMouseWheelMove != 0) {
		long currentTemmp = current;
		currentTemmp += GetMouseWheelMove();

		if (currentTemmp < 1) currentTemmp = blocks.length - 1;
		if (currentTemmp > blocks.length - 1) currentTemmp = 1;

		selectItem(currentTemmp);
	}

	if (IsKeyDown(67)) {
		clearGrid();
	}
}

void drawGrid() {

	float wheelMove = IsKeyDown(341) ? 0 : GetMouseWheelMove() * 2.00;

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


		DrawRectangle(cellX, cellY, rowLen, rowLen, gridCells[nx][ny].block.hintColor);

		if (mouseCords.x >= cellX &&
			mouseCords.x < cellX + rowLen &&
			mouseCords.y >= cellY &&
			mouseCords.y < cellY + rowLen) {
				DrawRectangle(cellX, cellY, rowLen, rowLen, AGrey);
				gridNCords = Cords(nx, ny);
		} else {
			DrawRectangleLines(cellX, cellY, rowLen, rowLen, col);
		}	
	}}

	DrawLine(gridCords.x, gridCords.y, gridCords.x+rowNum*rowLen, gridCords.y, ColWhite);
	DrawLine(gridCords.x + rowNum*rowLen, gridCords.y, gridCords.x + rowNum*rowLen, gridCords.y + rowNum*rowLen, ColWhite);
	DrawLine(gridCords.x + rowNum*rowLen, gridCords.y + rowNum*rowLen, gridCords.x, gridCords.y + rowNum*rowLen, ColWhite);
	DrawLine(gridCords.x, gridCords.y + rowNum*rowLen, gridCords.x, gridCords.y, ColWhite);
}

bool IsMouseOnCell() {
	return (mouseCords.x >= gridCords.x &&
			mouseCords.y >= gridCords.y &&
			mouseCords.x < gridCords.x + rowNum*rowLen &&
			mouseCords.y < gridCords.y + rowNum*rowLen);
}