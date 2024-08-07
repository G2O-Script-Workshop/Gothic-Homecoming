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

	local log = file("log_chat.txt", "ab+")
	local datas = format("%02d/%02d/%04d", date().day, date().month + 1, date().year) + " " + format("%02d:%02d:%02d", date().hour, date().min, date().sec) + " " + format("%02d:%02d", getTime().hour, getTime().min);
		log.write(format("(%s) %s: %s", datas, Players[pid].getName(), message) + "\n");
		log.close();
});