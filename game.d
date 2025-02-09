import raylib;

import include.grid;
import include.colors;
import include.cords;
import include.block;
import include.gui;
import include.settings;

import std.stdio;
import std.format;

int main() {
	InitWindow(800, 600, "Blocker");
	SetTargetFPS(120);

	menu();

	return 0;
}

void menu() {
	Button startButton = new Button(Cords(GetScreenWidth()/2-(100/2), GetScreenHeight()/2), vec2(100, 30), "Start");

	while(!WindowShouldClose()) {
	BeginDrawing();
		ClearBackground(ColBlack);

		startButton.draw();

		if (startButton.isClicked(MOUSE_LEFT_BUTTON)) {
			EndDrawing();
			game();
			return;
		}

	EndDrawing();
	}
	CloseWindow();
}

void game() {
	initBlocks();

	while(!WindowShouldClose()) {
	BeginDrawing();
		ClearBackground(ColBlack);

		updateMouse();
		showGrid();
		checkKeyboard();

	EndDrawing();
	}

	CloseWindow();
}
