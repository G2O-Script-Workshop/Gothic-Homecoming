addEventHandler("onPlayerJoin", function(pid){
	Player(pid, {
		name = getPlayerName(pid)
	});
});