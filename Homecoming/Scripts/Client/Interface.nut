addEventHandler("onKeyDown", function(key){
	if(isConsoleOpen() || chatInputIsOpen() || isMenuOpened() || isInventoryOpen()) return;

	switch(key){
		case KEY_F1:
			if(animCollection.getVisible()) return;
				PlayerList.setVisible(!PlayerList.visible);
		break;

		case KEY_F2:
			if(animCollection.getVisible()) return;
				toggleMap(!mapCollection.getVisible());
		break;

		case KEY_F3:
				toggleAnim(!animCollection.getVisible());
		break;

		case KEY_F4:
			if(animCollection.getVisible()) return;
				NetStats.setVisible(!NetStats.visible)
		break;

		case KEY_F9:
			if(animCollection.getVisible()) return;
				local disconnectFromVirtual = ServerLeaveMessage(heroId, Player[heroId].getVirtualWorld()).serialize();
				disconnectFromVirtual.send(RELIABLE);

				clearInventory();
				launchMenuScene(true);
		break;

		case KEY_ESCAPE:
			if(animCollection.getVisible()) return;
				// CIngame.nut
		break;
	}
});


addEventHandler("GUI.onMouseIn", function(self){
	if(self.getDisabled()) return;

	if(self instanceof GUI.Label){
		if(menuCollection.getVisible()){
			self.setFont("FONT_OLD_20_WHITE_HI.TGA");
			self.setColor({r = 128, g = 180, b = 128, a = 255});
		}
		return;
	}

	if(self instanceof GUI.ListVisibleRow){
		if(animCollection.getVisible()){
			self.setColor({r = 132, g = 0, b = 255});
			self.setFile("Menu_Choice_Back.TGA");
		}
		return;
	}

	if(self instanceof GUI.Button){
		if(menuCollection.getVisible() || animCollection.getVisible()){
			self.setColor({r = 255, g = 0, b = 0});
			setCursorTxt("L.TGA");
		}
		return;
	}
});

addEventHandler("GUI.onMouseOut", function(self){
	if(self.getDisabled()) return;

	if(self instanceof GUI.Label){
		if(menuCollection.getVisible()){
			self.setFont("FONT_OLD_20_WHITE.TGA");
			self.setColor({r = 255, g = 255, b = 255, a = 255});
		}
		return;
	}

	if(self instanceof GUI.ListVisibleRow){
		if(animCollection.getVisible()){
			self.setColor({r = 255, g = 255, b = 255});
			self.setFile("");
		}
		return;
	}

	if(self instanceof GUI.Button){
		if(menuCollection.getVisible() || animCollection.getVisible()){
			self.setColor({r = 255, g = 255, b = 255});
			setCursorTxt("LO.TGA");
		}
		return;
	}
});