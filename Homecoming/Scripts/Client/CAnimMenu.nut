animCollection <- GUI.Collection({
	positionPx = {x = 0, y = 0}
});
local animGUI = {
	column = -1,

	grid = GUI.GridList({
		positionPx = {x = nax(50), y = nay(1750)}
		sizePx = {width = nax(1710), height = nay(5765)}
		marginPx = {top = nax(100), left = nay(50)}
		file = "MENU_INGAME.TGA"
		scrollbar = {
			range = {
				file = "MENU_SLIDER_BACK.TGA"
				indicator = {file = "MENU_SLIDER_POS.TGA"}
			}
		}
		collection = animCollection
	}),
	colName = GUI.Button({
		positionPx = {x = nax(50), y = nay(1600)}
		sizePx = {width = nax(1710), height = nay(265)}
		file = "INV_SLOT_FOCUS.TGA"
		draw = {text = "Category"}
		collection = animCollection
	})
}

local aniColumnName = animGUI.grid.addColumn({
	widthPx = nax(1660)
	align = Align.Center
});

local aniColumnTitle = ["Active Animations", "Reaction Animations", "Idle Animations"];

local function refreshGrid(column){
	if(column < 0) column = 2;
	if(column > 2) column = 0;

	if(column != animGUI.column){
		animGUI.grid.clear();
		for(local i = 0, end = anims[column].len(); i < end; i++){
			try {
				local row = animGUI.grid.addRow(
					{text = anims[column][i].name}
				);
			} catch(e) {
				toggleAnim(false);
				toggleAnim(true);
			}
			row.cells[aniColumnName].setDrawColor({r = 145, g = 175, b = 205})
		}
	}

	animGUI.colName.setText(aniColumnTitle[column]);
	animGUI.column = column;
}

function toggleAnim(toggle){
	animCollection.setVisible(toggle);

	setCursorVisible(toggle);
	setCursorPosition(4096, 4096);
	disableControls(toggle);

	if(toggle) refreshGrid(0);
}

addEventHandler("GUI.onClick", function(self){
	if(!animCollection.getVisible()) return;

		if(self instanceof GUI.GridListVisibleCell){
			stopAni(heroId);
			playAni(heroId, anims[animGUI.column][self.parent.id].instance);
		}
		if(self instanceof GUI.Button){
			switch(self){
				case animGUI.colName:
					refreshGrid(animGUI.column + 1);
				break;
			}
		}
});