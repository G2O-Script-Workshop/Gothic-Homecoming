local updateClassPacket;
local updateOtherClassPacket;

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

			updateClassPacket = UpdateClassMessage(pid, message.classId).serialize();
		foreach(player in Players){
			updateClassPacket.send(player.id, RELIABLE_ORDERED);

			updateOtherClassPacket = UpdateClassMessage(player.id, player.getClass()).serialize();
			updateOtherClassPacket.send(pid, RELIABLE_ORDERED);
		}

	local synchronizeTimePacket = SynchronizeTimeMessage(pid,
		getTime().hour,
		getTime().min
		).serialize();
	synchronizeTimePacket.send(pid, RELIABLE_ORDERED);
});