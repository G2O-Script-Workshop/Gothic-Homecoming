addEventHandler("onInit", function(){
	clearMultiplayerMessages();

	setHudMode(HUD_ALL, HUD_MODE_HIDDEN);
	setDayLength(10000);

	disableControls(true);
	disableMusicSystem(true);

    Camera.movementEnabled = false;
	Camera.modeChangeEnabled = false;

	disableKey(KEY_F1, true);
	disableKey(KEY_F2, true);
	disableKey(KEY_F3, true);
	disableKey(KEY_F4, true);

	NetStats.init();
	PlayerList.init();
	Chat._calcPosition();

	initDiscordActivity();

	LocalPlayer(heroId);
	Player[heroId].loadData();
});

function isMenuOpened(){
	return menuCollection.getVisible() || creatorCollection.getVisible() || selectClassCollection.getVisible() || serverCollection.getVisible()
}

SynchronizeTimeMessage.bind(function(message){
	timeCollection.setVisible(true);

	setTime(message._hour, message._min);
	Chat.setVisible(true);

    Camera.movementEnabled = true;
	Camera.modeChangeEnabled = true;
});

addEventHandler("onWorldChange", function(world, waypoint){
	cancelEvent();
})

addEventHandler("onCommand", function(cmd, params)
{
	if (cmd == "freecam")
		enableFreeCam(!isFreeCamEnabled())
	if (cmd == "pos"){
		local _camPos = Camera.getPosition()
		local _posForScene = format("x = %f z = %f", _camPos.x, _camPos.z)
		setClipboardText(_posForScene);
		print(_posForScene);
	}
	if (cmd == "speed"){
		giveItem(heroId, "ITPO_SPEED", 10)
		setPlayerScale(heroId, 1.0, 1.0, 2.5);
	}
})
