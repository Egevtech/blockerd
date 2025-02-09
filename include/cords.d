import raylib;

import include.settings;

alias Cords = vec2;

Cords mouseCords = {0, 0};
Cords gridCords = {0, 0};
Cords gridNCords = {0, 0};

void pushMouseCords(Cords *crds) {
	crds.x = GetMouseX();
	crds.y = GetMouseY();
}