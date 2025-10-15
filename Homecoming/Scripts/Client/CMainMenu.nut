local Music = BASSMusic("GMPMenu.mp3");
local Sword = Vob("ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS");
local CameraVob = Vob("");

menuCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local menuGUI = {
	logo = GUI.Sprite({
		positionPx = {x = nax(4000), y = nay(200)}
		sizePx = {width = nax(5500), height = nay(2000)}
		file = "GMP_LOGO_MENU.TGA"
		/* file = "GMP_LOGO.TGA" */
		scaling = true
		/* disabled = true */
		collection = menuCollection
	}),

	play = GUI.Label({
		positionPx = {x = nax(200), y = nay(3200)}
		text = "Play"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),
	character = GUI.Label({
		positionPx = {x = nax(200), y = nay(3600)}
		text = "Character"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),
	settings = GUI.Label({
		positionPx = {x = nax(200), y = nay(4000)}
		text = "Settings"
		font = "FONT_OLD_20_WHITE.TGA"
		color = {r = 180, g = 128, b = 128, a = 64}
		collection = menuCollection
	}),
	options = GUI.Label({
		positionPx = {x = nax(200), y = nay(4400)}
		text = "Options"
		font = "FONT_OLD_20_WHITE.TGA"
		color = {r = 180, g = 128, b = 128, a = 64}
		collection = menuCollection
	}),
	exit = GUI.Label({
		positionPx = {x = nax(200), y = nay(4800)}
		text = "Exit"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),

	version = GUI.Label({
		positionPx = {x = 0, y = 0}
		text = "v0.2b Build 3336"
		font = "FONT_DEFAULT.TGA"
		disabled = true
		collection = menuCollection
	})
}

local vob_rotation_per_second = 60;
local function menuSwordScene(){
	if(Sword){
		local dt = WorldTimer.frameTimeSecs;

		local rotation = Sword.getRotation()
		Sword.setRotation(rotation.x + (vob_rotation_per_second * dt), rotation.y, rotation.z);
	}
}

local _lastScene = 0;
local _scene;
local currScene;
local function updateScene(){
	do {
		currScene = (rand() % scenes[getWorld()].len());
		_scene = scenes[getWorld()][currScene];
	} while (_scene == _lastScene);

	Camera.setPosition(_scene[0].x, _scene[0].y, _scene[0].z)
	Camera.setRotation(_scene[1].x, _scene[1].y, _scene[1].z)

	CameraVob.setPosition(_scene[0].x, _scene[0].y, _scene[0].z)
	CameraVob.setRotation(_scene[1].x, _scene[1].y, _scene[1].z)

	local rotation = Sword.getRotation()
	Sword.setRotation(rotation.x, _scene[1].y - 210, rotation.z)

	_lastScene = _scene;
}

local function calculateSwordOffset(){
	CameraVob.setPosition(13354.502930, 2040.0, -1141.678467);
	CameraVob.setRotation(0, 210, 0);
		CameraVob.addToWorld();

	Sword.setPosition(13346.502930, 2006.0, -1240.678467);
	CameraVob.attachChild(Sword);
		Sword.addToWorld();
}

function launchMenuScene(toggle){
	setCursorVisible(toggle);
	setCursorPosition(4096, 4096);

	menuCollection.setVisible(toggle);

	if(toggle){
		Chat.setVisible(false);
		Chat.clear();
		timeCollection.setVisible(false);

		if(getPlayerPosition(heroId) != getWaypoint("TOT")) Player[heroId].setWaypoint("TOT");

		setHudMode(HUD_ALL, HUD_MODE_HIDDEN);
		setDayLength(10000);

		disableControls(true);
		disableMusicSystem(true);

		Camera.movementEnabled = false;
		Camera.modeChangeEnabled = false;

		Music.setVolume(75);
		Music.looping = true;
		Music.play();

			calculateSwordOffset();
			updateScene();

		addEventHandler("onRender", menuSwordScene);

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
		removeEventHandler("onRender", menuSwordScene);
			CameraVob.detachChild(Sword);
		Sword.removeFromWorld();
		CameraVob.removeFromWorld();

		setDayLength(6000 * 1000);

		disableMusicSystem(false);
		Music.stop();
	}
}

function menuChangeVisibility(toggle){
	menuCollection.setVisible(toggle);

	if(LocalStorage.len() <= 0){
		menuGUI.play.setDisabled(true);
		menuGUI.play.setFont("FONT_OLD_20_WHITE_HI.TGA");
		menuGUI.play.setColor({r = 180, g = 128, b = 128, a = 128});
	} else {
		menuGUI.play.setDisabled(false);
		menuGUI.play.setFont("FONT_OLD_20_WHITE.TGA");
		menuGUI.play.setColor({r = 255, g = 255, b = 255, a = 255});
	}

	if(toggle) {
		updateDiscordState(format("In Main Menu"));
		updateScene();
	}
}

JoinMenuMessage.bind(function(message){
	launchMenuScene(true);

	menuGUI.settings.setDisabled(true);
	menuGUI.options.setDisabled(true);

	menuGUI.version.setText(message.versionDraw);

	local versionDrawSize = menuGUI.version.getSizePx();
	menuGUI.version.setPositionPx(nax(8192 - anx(versionDrawSize.height + versionDrawSize.width)), nay(8192 - versionDrawSize.width));
	menuGUI.version.setDisabled(true);
});

addEventHandler("GUI.onClick", function(self){
	if(!isCursorVisible()) return;

	if(self instanceof GUI.Label && menuCollection.getVisible() && !self.getDisabled()){
		switch(self){
			case menuGUI.play:
				menuChangeVisibility(false);
				showServerList(true);
			break;
			case menuGUI.character:
				menuChangeVisibility(false);
				toggleCreator(true);
			break;
			case menuGUI.exit:
				exitGame();
			break;
		}
	}
	if(self == menuGUI.logo){
		updateScene();
	}
});