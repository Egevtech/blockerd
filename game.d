import raylib;

import std.system;
import std.stdio;

import include.grid;

int main() {
	InitWindow(800, 600, "Blocker");

	while(!WindowShouldClose()) {
	BeginDrawing();
		ClearBackground(ColBlack);
		showGrid();
	EndDrawing();
	}

	CloseWindow();

	return 0;
}