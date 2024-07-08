SelectClassMessage.bind(function(pid, message){
	Player(pid, {
		name = message.charaName,

		visual = [
			message.visBodyM,
			message.visBodyT,
			message.visHeadM,
			message.visHeadT
		],
		walk = message.walk,
		/* scale = message.height, */
		fatness = message.fatness,

		vworld = 1
	});

	Players[pid].setClass(message.classId);

		local updateClassPacket = UpdateClassMessage(pid, message.classId).serialize();
		foreach(player in Players){
			updateClassPacket.send(player.id, RELIABLE);

			local updateOtherClassPacket = UpdateClassMessage(player.id, player.getClass()).serialize();
			updateOtherClassPacket.send(pid, RELIABLE);
		}

	local synchronizeTimePacket = SynchronizeTimeMessage(pid,
		getTime().hour,
		getTime().min
		).serialize();
	synchronizeTimePacket.send(pid, RELIABLE);

	sendMessageToPlayer(pid, 140, 140, 120, "Gothic Multiplayer #SKEJT23 COMPILATION#");
	sendMessageToAll(0, 255, 0, format("%s joined to the game.", message.charaName));
});