local Music = Sound("GMPMENU.wav");
local Sword = Vob("ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS");

menuCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local menuGUI = {
	logo = GUI.Texture({
		positionPx = {x = nax(4000), y = nay(200)}
		sizePx = {width = nax(5500), height = nay(2000)}
		file = "GMP_LOGO_MENU.TGA"
		scaling = true
		disabled = true
	}),

	play = GUI.Draw({
		positionPx = {x = nax(200), y = nay(3200)}
		text = "Play"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),
	character = GUI.Draw({
		positionPx = {x = nax(200), y = nay(3600)}
		text = "Character"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),
	settings = GUI.Draw({
		positionPx = {x = nax(200), y = nay(4000)}
		text = "Settings"
		font = "FONT_OLD_20_WHITE.TGA"
		color = {r = 180, g = 128, b = 128, a = 64}
		collection = menuCollection
	}),
	options = GUI.Draw({
		positionPx = {x = nax(200), y = nay(4400)}
		text = "Options"
		font = "FONT_OLD_20_WHITE.TGA"
		color = {r = 180, g = 128, b = 128, a = 64}
		collection = menuCollection
	}),
	exit = GUI.Draw({
		positionPx = {x = nax(200), y = nay(4800)}
		text = "Exit"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),

	version = GUI.Draw({
		positionPx = {x = 0, y = 0}
		text = "v0.2b Build 3336"
		font = "FONT_DEFAULT.TGA"
		disabled = true
		collection = menuCollection
	})
}

function launchMenuScene(toggle){
	Camera.setPosition(13354.502930, 2040.0, -1141.678467);
	Camera.setRotation(0, -150, 0);

	menuCollection.setVisible(toggle);

	menuGUI.settings.setDisabled(true);
	menuGUI.options.setDisabled(true);

	if(toggle){
		Sword.addToWorld();
		Sword.setPosition(13346.502930, 2006.0, -1240.678467);

		if(LocalStorage.len() <= 0){
			menuGUI.play.setDisabled(true);
			menuGUI.play.setFont("FONT_OLD_20_WHITE_HI.TGA");
			menuGUI.play.setColor({r = 180, g = 128, b = 128, a = 128});
		} else {
			menuGUI.play.setDisabled(false);
			menuGUI.play.setFont("FONT_OLD_20_WHITE.TGA");
			menuGUI.play.setColor({r = 255, g = 255, b = 255, a = 255});
		}
	} else {
		Sword.removeFromWorld();
	}
}

addEventHandler("onInit", function(){
	setHudMode(HUD_ALL, HUD_MODE_HIDDEN);
	setDayLength(10000);

	setCursorVisible(true);
	setCursorPosition(4096, 4096);
});

JoinMenuMessage.bind(function(message){
	launchMenuScene(true);

	menuGUI.logo.setVisible(true);
	menuGUI.version.setText(message.versionDraw);

	local versionDrawSize = menuGUI.version.getSizePx();
	menuGUI.version.setPositionPx(nax(8192 - anx(versionDrawSize.height + versionDrawSize.width)), nay(8192 - versionDrawSize.width));
	menuGUI.version.setDisabled(true);

	Camera.movementEnabled = false;
	disableControls(true);

	disableMusicSystem(true);

	Music.play();
	//Music.setVolume(100);
	Music.volume = 100;
	Music.looping = true;
});

local vob_rotation_per_second = 60;
addEventHandler("onRender", function(){
	if(Sword){
		local dt = WorldTimer.frameTimeSecs;

		local rotation = Sword.getRotation()
		Sword.setRotation(rotation.x + (vob_rotation_per_second * dt), rotation.y, rotation.z);
	}
});

addEventHandler("GUI.onClick", function(self){
	if(!isCursorVisible()) return;

	if(self instanceof GUI.Draw && menuCollection.getVisible() && !self.getDisabled()){
		switch(self){
			case menuGUI.play:
				local playPacket = PlayButtonMessage(heroId,
						LocalStorage.getItem("characterName"),
						LocalStorage.getItem("bodyModel"),
						LocalStorage.getItem("bodyTexture"),
						LocalStorage.getItem("headModel"),
						LocalStorage.getItem("headTexture"),
						LocalStorage.getItem("walkstyle"),
						/* LocalStorage.getItem("height"), */
						LocalStorage.getItem("fatness")
					).serialize();
				playPacket.send(RELIABLE_ORDERED);
				stopMenuScene();
				showSelectClass();
			break;
			case menuGUI.character:
				menuCollection.setVisible(false);
				toggleCreator(true);
			break;
			case menuGUI.exit:
				exitGame();
			break;
		}
	}
});

function stopMenuScene(){
	launchMenuScene(false);
	menuGUI.logo.setVisible(false);

	setDayLength(6000 * 1000);

	setCursorVisible(false);
	setCursorPosition(4096, 4096);

	disableMusicSystem(false);
	Music.stop();
}