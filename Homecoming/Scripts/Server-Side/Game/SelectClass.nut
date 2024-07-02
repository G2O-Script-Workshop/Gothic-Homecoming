SelectClassMessage.bind(function(pid, message){
	Players[pid].setVirtualWorld(1);

	classes[message.classId].func(pid);
});