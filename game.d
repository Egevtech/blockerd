import raylib;

import include.grid;
import include.colors;

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