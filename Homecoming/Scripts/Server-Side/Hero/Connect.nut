addEventHandler("onPlayerJoin", function(pid){
	local commitId = "";

	if(file(".git/HEAD", "r")){
		commitId = file(".git/refs/heads/main", "r").read(7);
	} else {
		commitId = buildVersion;
	}

	local menuPacket = JoinMenuMessage(pid,
		format("v0.2b Build %s", commitId)
		).serialize();
	menuPacket.send(pid, RELIABLE_ORDERED);
})