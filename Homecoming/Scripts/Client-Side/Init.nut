addEventHandler("onInit", function(){
	clearMultiplayerMessages();

	setPlayerHealth(id, 9999);
	setPlayerMaxHealth(id, 9999);
	setPlayerStrength(id, 999);
	setPlayerDexterity(id, 999);
});

SynchronizeTimeMessage.bind(function(message){
	setTime(message._hour, message._min);
});