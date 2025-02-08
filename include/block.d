import include.colors;
import include.cords;

class Block {
	Color hintColor;

	Cords gridCords;

	string name;
	string title;
	string descript;

	this(string name, string title, string descript, Color hintColor) {
		this.name = name;
		this.title = title;
		this.descript = descript;
		this.hintColor = hintColor;
	}

	void setPos(int gridX, int gridY) {
		gridCords = Cords(gridX, gridY);
	}
};
