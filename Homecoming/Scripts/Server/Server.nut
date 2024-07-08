addEventHandler("onPlayerJoin", function(pid){
	local commitId = "";

	local myfile = doesFileExist(".git/HEAD", "r");

	if(myfile){
		commitId = format("v0.2b Build %s", file(".git/refs/heads/main", "r").read(7));
	} else {
		commitId = buildVersion;
	}

	local menuPacket = JoinMenuMessage(pid,
		commitId
		).serialize();
	menuPacket.send(pid, RELIABLE_ORDERED);

	local log = file("log_players.txt", "ab+")
	local datas = format("%02d/%02d/%04d", date().day, date().month + 1, date().year) + " " + format("%02d:%02d:%02d", date().hour, date().min, date().sec) + " " + format("%02d:%02d", getTime().hour, getTime().min);
		log.write(format("(%s) %s %s %s %s", datas, getPlayerName(pid), getPlayerSerial(pid), getPlayerIP(pid), getPlayerMacAddr(pid)) + "\n");
		log.close();
})