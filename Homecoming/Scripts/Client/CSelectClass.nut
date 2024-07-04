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

selectedClass <- 0;

function showSelectClass(){
	selectClassCollection.setVisible(true);

	updateClassInfo(0);
}

function updateClassInfo(class_id){
	if(class_id < 0) class_id = classes.len() - 1;
	if(class_id > classes.len() - 1) class_id = 0;

	selectedClass = class_id;

	local ui = selectClassGUI;
	local info = classes[selectedClass];

		ui.class_name.setText(format("Class Name: %s", info.name));
		ui.class_desc.setText(format("Description: %s",info.description));
		ui.class_guild.setText(format("Guild: %s",info.guild));

			setPlayerPosition(heroId, info.spawn[0], info.spawn[1], info.spawn[2]);
			setPlayerAngle(heroId, info.spawn[3]);

			setPlayerOnFloor(heroId);

			setPlayerHealth(heroId, 9999);
			setPlayerMaxHealth(heroId, 9999);
			setPlayerStrength(heroId, 999);
			setPlayerDexterity(heroId, 999);

		clearInventory();
		info._func(heroId);

	local playerPos = getPlayerPosition(heroId);
		local x = info.spawn[0] + 250.0 * sin((3.14 / 180) * info.spawn[3]);
		local z = info.spawn[2] + 250.0 * cos((3.14 / 180) * info.spawn[3]);
		Camera.setPosition(x, playerPos.y + 70, z);
		Camera.setRotation(15, info.spawn[3] + 180, 0);
}

addEventHandler("onKeyDown", function(key){
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

				local selectClassPacket = SelectClassMessage(heroId,
					selectedClass
				).serialize();
				selectClassPacket.send(RELIABLE_ORDERED);

				selectClassCollection.setVisible(false);
				setHudMode(HUD_ALL, HUD_MODE_DEFAULT);

				Camera.movementEnabled = true;
				disableControls(false);
			break;
		}
});