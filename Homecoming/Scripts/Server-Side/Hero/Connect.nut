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
})

function doesFileExist(filename, mode){
	try {
		return file(filename, mode);
	} catch(e) {
		print("Error opening file: " + e);
		return null;
	}
}