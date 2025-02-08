import raylib;

struct Cords {
	int x;
	int y;
}

Cords mouseCords = {0, 0};
Cords gridCords = {0, 0};
Cords gridNCords = {0, 0};

void pushMouseCords(Cords *crds) {
	crds.x = GetMouseX();
	crds.y = GetMouseY();
}