import include.cords;
import include.settings;
import include.colors;

import raylib;

alias cstr = char*;

/**
 * 
 * MOUSE_LEFT_BUTTON
 * MOUSE_RIGHT_BUTTON
 * MOUSE_MIDDLE_BUTTON
 * 
 */

class GuiObject {
	Cords pos;
	vec2 size;

	string title;

	this() {}

	this (Cords pos, vec2 size, string title) {
		this.pos = pos;
		this.size = size;
		this.title = title;
	}

	int isHovered() {
		return (GetMouseX() > pos.x &&
			GetMouseY() > pos.y &&
			GetMouseX() < pos.x + size.x &&
			GetMouseY() < pos.y + size.y);
	}

	int isClicked(int button) {
		return (IsMouseButtonDown(button) && isHovered());
	}
};

class Button : GuiObject {
	this() {
		super();
	}

	this (Cords pos, vec2 size, string title) {
		super(pos, size, title);
	}

	void draw() {
		Color col = ColWhite;

		if (isHovered()) col = Reddy;

		DrawRectangle(pos.x, pos.y, size.x, size.y, col);
	}
};