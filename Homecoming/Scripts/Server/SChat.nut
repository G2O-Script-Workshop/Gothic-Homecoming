addEventHandler("onPlayerMessage", function(pid, message){
	sendMessageToAll(255, 255, 255, format("%s: %s", Players[pid].getName(), message));
	print(format("%s: %s", Players[pid].getName(), message));

	local log = file("log_chat.txt", "ab+")
	local datas = format("%02d/%02d/%04d", date().day, date().month + 1, date().year) + " " + format("%02d:%02d:%02d", date().hour, date().min, date().sec) + " " + format("%02d:%02d", getTime().hour, getTime().min);
		log.write(format("(%s) %s: %s", datas, Players[pid].getName(), message) + "\n");
		log.close();
});