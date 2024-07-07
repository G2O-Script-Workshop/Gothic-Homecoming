addEventHandler("onInit", function(){
	clearMultiplayerMessages();
	enableEvent_Render(true)

	setHudMode(HUD_ALL, HUD_MODE_HIDDEN);
	setDayLength(10000);

	disableControls(true);
	disableMusicSystem(true);

	disableKey(KEY_F1, true);
	disableKey(KEY_F2, true);
	disableKey(KEY_F3, true);
	disableKey(KEY_F4, true);

	NetStats.init();
	PlayerList.init();
	Chat._calcPosition();

	setPlayerName(heroId, LocalStorage.getItem("characterName"));
	setPlayerVisual(heroId,
		LocalStorage.getItem("bodyModel"),
		LocalStorage.getItem("bodyTexture"),
		LocalStorage.getItem("headModel"),
		LocalStorage.getItem("headTexture")
	);
	/* LocalStorage.getItem("height"), */
	setPlayerFatness(heroId, LocalStorage.getItem("fatness"));
});

function isGUIOpened(){
	return menuCollection.getVisible() || creatorCollection.getVisible() || selectClassCollection.getVisible()
}

SynchronizeTimeMessage.bind(function(message){
	timeCollection.setVisible(true);

	setTime(message._hour, message._min);
});


function cameraPatch(){
	Camera.setPosition(13354.502930, 2040.0, -1141.678467);
	Camera.setRotation(0, -150, 0);
}

addEventHandler("onRender", cameraPatch);