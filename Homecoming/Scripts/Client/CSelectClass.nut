selectClassCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local selectClassGUI = {
	controls = GUI.Draw({
		positionPx = {x = nax(0), y = nay(0)}
		text = "Controls: A/D/ENTER"
		font = "FONT_DEFAULT.TGA"
		color = {r = 200, g = 180, b = 140}
		collection = selectClassCollection
	}),
	class_name = GUI.Draw({
		positionPx = {x = nax(0), y = nay(150)}
		text = "Class Name: ---"
		font = "FONT_DEFAULT.TGA"
		collection = selectClassCollection
	}),
	class_desc = GUI.Draw({
		positionPx = {x = nax(0), y = nay(300)}
		text = "Class Description: ---"
		font = "FONT_DEFAULT.TGA"
		collection = selectClassCollection
	}),
	class_guild = GUI.Draw({
		positionPx = {x = nax(0), y = nay(450)}
		text = "Class Team: ---"
		font = "FONT_DEFAULT.TGA"
		collection = selectClassCollection
	})
}

local virtualServer;
local selectedClass = 0;

local function updateClassInfo(class_id){
	local _classWorld = classes[virtualServer];
	local _classLen = _classWorld.len();

	if(class_id < 0) class_id = _classLen - 1;
	if(class_id > _classLen - 1) class_id = 0;

	selectedClass = class_id;

	local ui = selectClassGUI;
	local info = _classWorld[selectedClass];

		ui.class_name.setText(format("Class Name: %s", info.name));
		ui.class_desc.setText(format("Description: %s",info.description));
		ui.class_guild.setText(format("Guild: %s",info.guild));

			setPlayerPosition(heroId, info.spawn[0], info.spawn[1], info.spawn[2]);
			setPlayerAngle(heroId, info.spawn[3]);

			setPlayerOnFloor(heroId);

			setPlayerHealth(heroId, 999999);
			setPlayerMaxHealth(heroId, 999999);
			setPlayerMana(heroId, 999);
			setPlayerMaxMana(heroId, 999);
			setPlayerStrength(heroId, 999);
			setPlayerDexterity(heroId, 999);

		clearInventory();
		info._func(heroId);

	local playerPos = getPlayerPosition(heroId);
		local x = info.spawn[0] + 250.0 * sin((PI / 180) * info.spawn[3]);
		local z = info.spawn[2] + 250.0 * cos((PI / 180) * info.spawn[3]);
		Camera.setPosition(x, playerPos.y + 70, z);
		Camera.setRotation(15, info.spawn[3] + 180, 0);
}

local function onServerWorldEnter(world){
	Camera.movementEnabled = false;
	Camera.modeChangeEnabled = false;

	updateClassInfo(0);
}

local function selectClassKeyDown(key){
	if(!selectClassCollection.getVisible()) return;

	switch(key){
		case KEY_A:
			updateClassInfo(selectedClass - 1);
		break;
		case KEY_D:
			updateClassInfo(selectedClass + 1);
		break;

		case KEY_RETURN:
			clearInventory();
			Player[heroId].setWorld(getWorld());
			Player[heroId].setVirtualWorld(virtualServer);
			Player[heroId].setClass(selectedClass);

			local selectClassPacket = SelectClassMessage(heroId,
				selectedClass
			).serialize();
			selectClassPacket.send(RELIABLE_ORDERED);

			selectClassCollection.setVisible(false);
			setHudMode(HUD_ALL, HUD_MODE_DEFAULT);

			updateDiscordState(format("%s (%s)", Player[heroId].getName(), classes[virtualServer][selectedClass].name));

			removeEventHandler("onWorldEnter", onServerWorldEnter);
			disableControls(false);
		break;
	}
}

ServerJoinMessage.bind(function(message){
	selectClassCollection.setVisible(true);

	Camera.movementEnabled = false;
	Camera.modeChangeEnabled = false;

	virtualServer = message.serverId;
	updateClassInfo(0);

	addEventHandler("onKeyDown", selectClassKeyDown);
	addEventHandler("onWorldEnter", onServerWorldEnter);
});

addEventHandler("onExit", function(){
	if(virtualServer == null) return;

	local disconnectFromVirtual = ServerLeaveMessage(heroId, virtualServer).serialize();
	disconnectFromVirtual.send(RELIABLE);
});