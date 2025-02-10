import raylib;

import include.grid;
import include.colors;
import include.cords;
import include.block;
import include.gui;
import include.settings;

import std.stdio;
import std.format;
import std.string;

int main() {
	SetWindowState(0x00000004);
	InitWindow(800, 600, "Blocker");

	menu();

	return 0;
}

void menu() {

	while(!WindowShouldClose()) {
	BeginDrawing();
		Button startButton = new Button(Cords(GetScreenWidth()/2-(100/2), GetScreenHeight()/2), vec2(100, 30), "Start");
		Button quitButton = new Button(Cords(GetScreenWidth()/2-(100/2), GetScreenHeight()/2+40), vec2(100, 30), "Quit");

		ClearBackground(ColBlack);

		startButton.draw();
		quitButton.draw();

		if (startButton.isClicked(MOUSE_LEFT_BUTTON)) {
			EndDrawing();
			game();
			return;
		}

		if (quitButton.isClicked(MOUSE_LEFT_BUTTON)) {
			EndDrawing();
			break;
		}

		drawOverlay();
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

		drawOverlay();
	EndDrawing();
	}

	CloseWindow();
}

void drawOverlay() {
	DrawText("Blocker v0.0.1-beta\n", 10, GetScreenHeight() - 20*2, 10, ColWhite);
	DrawText(toStringz(format("%s%d", "FPS: ", GetFPS())), 10, GetScreenHeight() - 20*1, 10, ColWhite);
}