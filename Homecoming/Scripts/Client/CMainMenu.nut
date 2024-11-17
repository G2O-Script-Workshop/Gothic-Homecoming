local Music = BASSMusic("GMPMenu.mp3");
local Sword = Vob("ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS");

menuCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local menuGUI = {
	logo = GUI.Texture({
		positionPx = {x = nax(4000), y = nay(200)}
		sizePx = {width = nax(5500), height = nay(2000)}
		file = "GMP_LOGO_MENU.TGA"
		/* file = "GMP_LOGO.TGA" */
		scaling = true
		/* disabled = true */
		collection = menuCollection
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

local vob_rotation_per_second = 60;
local function menuSwordScene(){
	if(Sword){
		local dt = WorldTimer.frameTimeSecs;

		local rotation = Sword.getRotation()
		Sword.setRotation(rotation.x + (vob_rotation_per_second * dt), rotation.y, rotation.z);
	}
}

local function rotateVectorAroundAxisAngle(axis, angle, vec){
	angle *= PI / 180.0
	return vec * cos(angle) + (axis * Vec3.dot(vec, axis) * (1 - cos(angle))) + (Vec3.cross(axis, vec) * sin(angle))
}

local _lastScene = 0;
local _scene;
local function calculateSwordOffset(){
	do {
		_scene = scenes[getWorld()][rand() % scenes[getWorld()].len()]
	} while (_scene == _lastScene);

	Camera.setPosition(_scene[0].x, _scene[0].y, _scene[0].z)
	Camera.setRotation(_scene[1].x, _scene[1].y, _scene[1].z)

	local vobDistance = 104.981
	local vobYOffset = -34
	local angleOffset = -25
	local originalYRotation = 210

	local atVector = Camera.vobMatrix.getAtVector()
	local rotatedVec = rotateVectorAroundAxisAngle(Vec3(0, 1, 0), angleOffset, atVector) * vobDistance

	Sword.setPosition(_scene[0].x + rotatedVec.x, _scene[0].y + vobYOffset, _scene[0].z + rotatedVec.z)
	Sword.setRotation(0, _scene[1].y - originalYRotation, 0)

	_lastScene = _scene;
}
/*
local Skull = Vob("SKULL.3DS");
	Skull.addToWorld();

local function calculateSwordOffset(){
	if(_lastScene > scenes.len() - 1) _lastScene = 0;
	_scene = scenes[_lastScene];


	Skull.matrix.setRightVector(Vec3(_scene[0][0], _scene[0][1], _scene[0][2]))
	Skull.matrix.setAtVector(Vec3(_scene[1][0], _scene[1][1], _scene[1][2]))
	Skull.matrix.setUpVector(Vec3(_scene[2][0], _scene[2][1], _scene[2][2]))
	Skull.matrix.setTranslation(Vec3(_scene[3][0], _scene[3][1], _scene[3][2]))
	Skull.matrix.makeOrthonormal();

	local skullPos = Skull.getPosition();
	local skullRot = Skull.getRotation();
	Camera.setPosition(skullPos.x, skullPos.y, skullPos.z);
	Camera.setRotation(skullRot.x, skullRot.y, skullRot.z);

	local _camPos = Camera.getPosition()
	local _camRot = Camera.getRotation()

	local _posForScene = format("scene %d \n[\n {x = %f, y = %f, z = %f},\n {x = %f, y = %f, z = %f}\n],", _lastScene, _camPos.x, _camPos.y, _camPos.z, _camRot.x, _camRot.y, _camRot.z)
	setClipboardText(_posForScene);
	print(_posForScene);

	local vobDistance = 104.981
	local vobYOffset = -34
	local angleOffset = -25
	local originalYRotation = 210

	local atVector = Camera.vobMatrix.getAtVector()
	local rotatedVec = rotateVectorAroundAxisAngle(Vec3(0, 1, 0), angleOffset, atVector) * vobDistance

	Sword.setPosition(_camPos.x + rotatedVec.x, _camPos.y + vobYOffset, _camPos.z + rotatedVec.z)
	Sword.setRotation(0, _camRot.y - originalYRotation, 0)

	_lastScene++
} */

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

		Sword.addToWorld();
		calculateSwordOffset();
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
		Sword.removeFromWorld();

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
		calculateSwordOffset();
	}
}

JoinMenuMessage.bind(function(message){
	launchMenuScene(true);

	Music.setVolume(100);
	Music.looping = true;
	Music.play();

	menuGUI.settings.setDisabled(true);
	menuGUI.options.setDisabled(true);

	menuGUI.version.setText(message.versionDraw);

	local versionDrawSize = menuGUI.version.getSizePx();
	menuGUI.version.setPositionPx(nax(8192 - anx(versionDrawSize.height + versionDrawSize.width)), nay(8192 - versionDrawSize.width));
	menuGUI.version.setDisabled(true);
});

addEventHandler("GUI.onClick", function(self){
	if(!isCursorVisible()) return;

	if(self instanceof GUI.Draw && menuCollection.getVisible() && !self.getDisabled()){
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
		calculateSwordOffset()
	}
});