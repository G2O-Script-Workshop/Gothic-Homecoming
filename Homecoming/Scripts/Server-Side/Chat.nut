addEventHandler("onPlayerMessage", function(pid, message){
	sendMessageToAll(255, 255, 255, format("%s: %s", Players[pid].getName(), message));
});