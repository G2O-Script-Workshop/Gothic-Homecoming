local _virtualServers = {};

class VirtualServer {
	id = -1

	_type = ""

	name = ""
	zen = ""

	players = 0
	npcs = 0

	constructor(args){
		this.id = args.vworld;

		this._type = args._type;

		this.name = args.name;
		this.zen = args.zen;

		_virtualServers[this.id] <- this;
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

		this.players++;
		local joinServerPacket = ServerJoinMessage(pid, this.id).serialize();
		joinServerPacket.send(pid, RELIABLE);
	}

	function disconnect(pid){
		Players[pid].setVirtualWorld(101);

		this.players--;
	}
}

foreach(vServ in VirtualServersTable){
	VirtualServer(vServ);
}

ServerListPingMessage.bind(function(pid, message){
	foreach(vServer in _virtualServers){
		local sendServersPacket = ServerListMessage(pid,
			vServer.id,
			vServer._type,
			vServer.name,
			vServer.zen,
			vServer.players,
			vServer.npcs
			).serialize();
		sendServersPacket.send(pid, RELIABLE);
	}
});

ServerListClickMessage.bind(function(pid, message){
	_virtualServers[message.serverId].connect(pid, message);
});

ServerLeaveMessage.bind(function(pid, message){
	_virtualServers[message.serverId].disconnect(pid);
});
