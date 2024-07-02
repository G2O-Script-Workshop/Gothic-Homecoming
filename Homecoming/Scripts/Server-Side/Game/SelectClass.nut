SelectClassMessage.bind(function(pid, message){
	Players[pid].setVirtualWorld(1);
	Players[pid].class_id = message.classId;

	classes[message.classId].func(pid);

		local updateClassPacket = UpdateClassMessage(pid,
			message.classId
		).serialize();
	foreach(Player in Players){
		updateClassPacket.send(Player.id, RELIABLE_ORDERED);
	}

	local synchronizeTimePacket = SynchronizeTimeMessage(pid,
		getTime().hour,
		getTime().min
		).serialize();
	synchronizeTimePacket.send(pid, RELIABLE_ORDERED);
});