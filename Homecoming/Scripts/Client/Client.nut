addEventHandler("onInit", function(){
	clearMultiplayerMessages();
	enableEvent_Render(true);

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

	if(LocalStorage.len() > 0){
		setPlayerName(heroId, LocalStorage.getItem("characterName"));
		setPlayerVisual(heroId,
			LocalStorage.getItem("bodyModel"),
			LocalStorage.getItem("bodyTexture"),
			LocalStorage.getItem("headModel"),
			LocalStorage.getItem("headTexture")
		);
		/* LocalStorage.getItem("height"), */
		setPlayerFatness(heroId, LocalStorage.getItem("fatness"));
	}

	NetStats.init();
	PlayerList.init();
	Chat._calcPosition();

	initDiscordActivity();
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