class SelectClassMessage extends BPacketMessage {
	</ type = BPacketInt32 />
	playerId = -1

	</ type = BPacketInt32 />
	classId = -1

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