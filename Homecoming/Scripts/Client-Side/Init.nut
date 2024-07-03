addEventHandler("onInit", function(){
	clearMultiplayerMessages();
});

SynchronizeTimeMessage.bind(function(message){
	setTime(message._hour, message._min);
});