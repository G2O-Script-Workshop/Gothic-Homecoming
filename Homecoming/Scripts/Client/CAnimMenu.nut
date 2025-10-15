animCollection <- GUI.Collection({
	positionPx = {x = 0, y = 0}
});
local animGUI = {
	list = GUI.List({
		positionPx = {x = nax(50), y = nay(1750)}
		sizePx = {width = nax(1710), height = nay(5765)}
		marginPx = {top = nax(100), left = nay(50)}
		file = "MENU_INGAME.TGA"
		scrollbar = {
			range = {
				file = "MENU_INGAME.TGA"
				indicator = {file = "BAR_MISC.TGA"}
			}
		}
		collection = animCollection
	}),
	colName = GUI.Button({
		positionPx = {x = nax(50), y = nay(1600)}
		sizePx = {width = nax(1710), height = nay(265)}
		file = "INV_SLOT_FOCUS.TGA"
		label = {text = "Category"}
		collection = animCollection
	}),

	_column = -1
}

local aniColumnTitle = ["Active Animations", "Reaction Animations", "Idle Animations"];

local function refreshList(column){
	if(column < 0) column = 2;
	if(column > 2) column = 0;

		animGUI.list.clear();
		for(local i = 0, end = anims[column].len(); i < end; i++){
			local row = animGUI.list.addRow(
				{text = anims[column][i].name}
			);
			row.setDrawColor({r = 145, g = 175, b = 205})
		}

	animGUI.colName.setText(aniColumnTitle[column]);
	animGUI._column = column;
}

function toggleAnim(toggle){
	animCollection.setVisible(toggle);

	setCursorVisible(toggle);
	setCursorPosition(4096, 4096);
	disableControls(toggle);

	if(toggle) refreshList(animGUI._column + 1);
}

addEventHandler("GUI.onClick", function(self){
	if(!animCollection.getVisible()) return;

		if(self instanceof GUI.ListVisibleRow){
			stopAni(heroId);
			playAni(heroId, anims[animGUI._column][self.id].instance);
		}
		if(self instanceof GUI.Button){
			switch(self){
				case animGUI.colName:
					refreshList(animGUI._column + 1);
				break;
			}
		}
});