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
				characterName = message.charaName,

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


	function connectNPC(id){
		if(!isNpc(id)) return;

		this.npcs++;
	}

	function disconnectNPC(id){
		if(!isNpc(id)) return;
			NPCs[id].setVirtualWorld(101);

		this.npcs--;
	}
}


addEventHandler("onInit", function(){
	foreach(vServ in VirtualServersTable){
		VirtualServer(vServ);
	}

	foreach(npc in NPCs){
		local serverId = npc.getVirtualWorld();
		_virtualServers[serverId].connectNPC(npc.id);
	}
});

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

/* addEventHandler("onCreateNPC", function(id){
	local serverId = NPCs[id].getVirtualWorld();
	_virtualServers[serverId].connectNPC(id);
});

addEventHandler("onDestroyNPC", function(id){
	local serverId = NPCs[id].getVirtualWorld();
	_virtualServers[serverId].disconnectNPC(id);
}); */