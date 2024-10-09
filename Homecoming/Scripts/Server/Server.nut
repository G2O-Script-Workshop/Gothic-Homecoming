addEventHandler("onPlayerJoin", function(pid){
	local commitId = "";
	local myfile = tryOpenFile(".git/HEAD", "r");
		if(myfile){
			commitId = format("v0.2b Build %s", file(".git/refs/heads/main", "r").read(7));
		} else {
			commitId = buildVersion;
		}

	local menuPacket = JoinMenuMessage(pid,
		commitId
		).serialize();
	menuPacket.send(pid, RELIABLE_ORDERED);

	Log("log_players.txt", format("%s %s %s %s", getPlayerName(pid), getPlayerSerial(pid), getPlayerIP(pid), getPlayerMacAddr(pid)));
})

addEventHandler("onPlayerDisconnect", function(pid, reason){
	sendMessageToAll(0, 255, 0, format("%s left the game.", getPlayerName(pid)));
})