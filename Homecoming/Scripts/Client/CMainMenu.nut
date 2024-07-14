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
		disabled = true
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

local function rotateVectorAroundAxisAngle(axis, angle, vec)
{
    angle *= PI / 180.0
    return vec * cos(angle) + (axis * Vec3.dot(vec, axis) * (1 - cos(angle))) + (Vec3.cross(axis, vec) * sin(angle))
}

local _lastScene;
local _scene;
local function calculateSwordOffset(){
	do {
		_scene = scenes[rand() % scenes.len()]
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

function launchMenuScene(toggle){
	setCursorVisible(toggle);
	setCursorPosition(4096, 4096);

	menuCollection.setVisible(toggle);

	if(toggle){
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

	if(toggle) calculateSwordOffset();
}

JoinMenuMessage.bind(function(message){
	launchMenuScene(true);

	menuGUI.settings.setDisabled(true);
	menuGUI.options.setDisabled(true);

	menuGUI.version.setText(message.versionDraw);

	local versionDrawSize = menuGUI.version.getSizePx();
	menuGUI.version.setPositionPx(nax(8192 - anx(versionDrawSize.height + versionDrawSize.width)), nay(8192 - versionDrawSize.width));
	menuGUI.version.setDisabled(true);

	Music.setVolume(100);
	Music.looping = true;
	Music.play();
});

addEventHandler("GUI.onClick", function(self){
	if(!isCursorVisible()) return;

	if(self instanceof GUI.Draw && menuCollection.getVisible() && !self.getDisabled()){
		switch(self){
			case menuGUI.play:
				//launchMenuScene(false);
				//showSelectClass();
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
});