addEventHandler("onKeyDown", function(key){
	if(isConsoleOpen() || chatInputIsOpen() || isGUIOpened()) return;

	switch(key){
		case KEY_F1:
			PlayerList.setVisible(!PlayerList.visible);
		break;

		case KEY_F2:
			// CMap.nut
		break;

		case KEY_F3:
			toggleAnim(!animCollection.getVisible());
		break;

		case KEY_F4:
			NetStats.setVisible(!NetStats.visible)
		break;

		case KEY_ESC:
			// CIngame.nut
		break;
	}
});


addEventHandler("GUI.onMouseIn", function(self){
	if(!self.getDisabled()) return;

	if(self instanceof GUI.Draw){
		if(menuCollection.getVisible()){
			self.setFont("FONT_OLD_20_WHITE_HI.TGA");
			self.setColor({r = 128, g = 180, b = 128, a = 255});
		}
		return;
	}

	/* if(self instanceof GUI.Texture){
		if(animCollection.getVisible()){
			self.setColor({r = 255, g = 0, b = 0});
			setCursorTxt("L.TGA");
		}
		return;
	} */

	if(self instanceof GUI.Button){
		if(animCollection.getVisible()){
			self.setColor({r = 255, g = 0, b = 0});
			setCursorTxt("L.TGA");
		}
		return;
	}

	if(self instanceof GUI.GridListVisibleCell){
		if(animCollection.getVisible()){
			self.setColor({r = 132, g = 0, b = 255});
			self.setFile("Menu_Choice_Back.TGA");
		}
		return;
	}
});

addEventHandler("GUI.onMouseOut", function(self){
	if(!self.getDisabled()) return;

	if(self instanceof GUI.Draw){
		if(menuCollection.getVisible()){
			self.setFont("FONT_OLD_20_WHITE.TGA");
			self.setColor({r = 255, g = 255, b = 255, a = 255});
		}
		return;
	}

	/* if(self instanceof GUI.Texture){
		if(animCollection.getVisible()){
			self.setColor({r = 255, g = 0, b = 0});
			setCursorTxt("L.TGA");
		}
		return;
	} */

	if(self instanceof GUI.Button){
		if(animCollection.getVisible()){
			self.setColor({r = 255, g = 255, b = 255});
			setCursorTxt("LO.TGA");
		}
		return;
	}

	if(self instanceof GUI.GridListVisibleCell){
		if(animCollection.getVisible()){
			self.setColor({r = 255, g = 255, b = 255});
			self.setFile("");
		}
		return;
	}
});