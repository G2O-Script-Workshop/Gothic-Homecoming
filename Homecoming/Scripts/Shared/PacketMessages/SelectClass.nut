class SelectClassMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1

	</ type = BPacketInt32 />
	classId = -1
}

class UpdateClassMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1

	</ type = BPacketInt32 />
	classId = -1
}

class SynchronizeTimeMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1

	</ type = BPacketInt32 />
	_hour = -1

	</ type = BPacketInt32 />
	_min = -1
}