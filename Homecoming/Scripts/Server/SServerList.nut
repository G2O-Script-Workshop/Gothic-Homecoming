virtualServers <- {};

class VirtualServer {
	id = -1

	name = ""
	zen = ""

	players = 0
	npcs = 0

	constructor(args){
		this.id = args.vworld;

		this.name = args.name
		this.zen = args.zen

		virtualServers[this.id] <- this;
	}

	function connect(pid, message){
		if(!Players.rawin(pid)) {
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

				world = this.zen,
				vworld = this.id
			});
		} else {
			Players[pid].setWorld(this.zen);
			Players[pid].setVirtualWorld(this.id);
		}

	}

	function disconnect(pid){

	}
}

foreach(vServ in VirtualServersTable){
	VirtualServer(vServ);
}

ServerListPingMessage.bind(function(pid, message){
	foreach(vServer in virtualServers){
		local sendServersPacket = ServerListMessage(pid,
			vServer.id,
			vServer.name,
			vServer.zen,
			vServer.players,
			vServer.npcs
			).serialize();
		sendServersPacket.send(pid, RELIABLE);
	}
});

ServerListClickMessage.bind(function(pid, message){
	virtualServers[message.serverId].connect(pid, message);
});