addEventHandler("onPlayerMessage", function(pid, message){
	sendMessageToAll(255, 255, 255, format("%s: %s", Players[pid].getName(), message));
	print(format("%s: %s", Players[pid].getName(), message));

	local log = file("chat.log", "w+")
	local _time = date();
	log.write(format("(%02d:%02d) %s: %s", _time.hour, _time.min, Players[pid].getName(), message));
});