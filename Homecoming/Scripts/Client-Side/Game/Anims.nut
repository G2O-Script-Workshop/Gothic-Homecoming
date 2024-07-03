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

function refreshGrid(column){
	if(column < 0) column = 2;
	if(column > 2) column = 0;

	if(column != animGUI.column){
		animGUI.grid.clear();
		for(local i = 0, end = anims[column].len(); i < end; i++){
			local row = animGUI.grid.addRow(
				{text = anims[column][i].name}
			);
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

	refreshGrid(0);
}

addEventHandler("GUI.onClick", function(self){
	if(animCollection.getVisible()){
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
	}
});

addEventHandler("onKeyDown", function(key){
	switch(key){
		case KEY_F10:
			if(!chatInputIsOpen() || !isGUIOpened()){
				toggleAnim(!animCollection.getVisible());
			}
		break;
	}
});

addEventHandler("GUI.onMouseIn", function(self){
	if(!isCursorVisible() && !animCollection.getVisible()) return;

	if(self instanceof GUI.Button){
		self.setColor({r = 255, g = 0, b = 0});
		setCursorTxt("L.TGA");
	}

	if(self instanceof GUI.GridListVisibleCell){
		self.setColor({r = 132, g = 0, b = 255});
		self.setFile("Menu_Choice_Back.TGA");
	}
});

addEventHandler("GUI.onMouseOut", function(self){
	if(!isCursorVisible() && !animCollection.getVisible()) return;

	if(self instanceof GUI.Button){
		self.setColor({r = 255, g = 255, b = 255});
		setCursorTxt("LO.TGA");
	}

	if(self instanceof GUI.GridListVisibleCell){
		self.setColor({r = 255, g = 255, b = 255});
		self.setFile("");
	}
});