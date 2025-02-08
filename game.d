import raylib;

import include.grid;
import include.colors;
import include.cords;
import include.block;

import std.stdio;
import std.format;

int main() {
	InitWindow(800, 600, "Blocker");
	//SetTargetFPS(60);

	initBlocks();

	while(!WindowShouldClose()) {
	BeginDrawing();
		ClearBackground(ColBlack);

		updateMouse();
		showGrid();

	EndDrawing();
	}

	CloseWindow();

	return 0;
}