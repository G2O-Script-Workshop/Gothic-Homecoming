addEventHandler("onPlayerMessage", function(pid, message){
	local _prefix = (message.slice(0, 1) == "!");
	local _msg = message.slice(1);
	if(_prefix && _msg != ""){
		sendMessageToAll(255, 222, 222, format("%s: %s", Players[pid].getName(), _msg));
	} else {
		local nearPlayers = findNearbyPlayers(
			getPlayerPosition(pid),
			2000,
			Players[pid].getWorld(),
			Players[pid].getVirtualWorld()
			);
		foreach(player in nearPlayers){
			sendMessageToPlayer(player, 255, 255, 255, format("%s: %s", Players[pid].getName(), message));
		}
	}

	print(format("%s: %s", Players[pid].getName(), message));
	Log("log_chat.txt", format("%s: %s", Players[pid].getName(), message))
});

addEventHandler("onPlayerCommand", function(pid, cmd, params){
	cmd = cmd.tolower();
});