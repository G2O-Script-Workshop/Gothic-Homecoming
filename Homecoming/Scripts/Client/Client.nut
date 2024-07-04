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

	NetStats.init()
	PlayerList.init()
	Chat._calcPosition()
});

function isGUIOpened(){
	return menuCollection.getVisible() || creatorCollection.getVisible() || selectClassCollection.getVisible()
}

SynchronizeTimeMessage.bind(function(message){
	timeCollection.setVisible(true);

	setTime(message._hour, message._min);
});