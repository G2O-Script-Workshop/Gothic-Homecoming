class ServerListPingMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1
}

class ServerJoinMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1

	</ type = BPacketInt32 />
	serverId = -1
}

class ServerLeaveMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1
}

class ServerListMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1

	</ type = BPacketInt32 />
	serverId = -1

	</ type = BPacketString />
	serverType = ""

	</ type = BPacketString />
	serverName = ""

	</ type = BPacketString />
	serverZen = ""

	</ type = BPacketInt32 />
	serverPlayers = -1

	</ type = BPacketInt32 />
	serverNPCs = -1
}

class ServerListClickMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1

	</ type = BPacketInt32 />
	serverId = -1

	</ type = BPacketString />
	charaName = ""

	</ type = BPacketString />
	visBodyM = ""

	</ type = BPacketInt32 />
	visBodyT = -1

	</ type = BPacketString />
	visHeadM = ""

	</ type = BPacketInt32 />
	visHeadT = -1

	</ type = BPacketString />
	walk = ""

	/* </ type = BPacketFloat />
	height = -1 */

	</ type = BPacketFloat />
	fatness = -1
}