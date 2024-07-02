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
	local ui = selectClassGUI;
	local info = classes[class_id];

		ui.class_name.setText(format("Class Name: %s", info.name));
		ui.class_desc.setText(format("Description: %s",info.description));
		ui.class_guild.setText(format("Guild: %s",info.guild));

		setPlayerPosition(heroId, info.spawn[0], info.spawn[1], info.spawn[2]);
		setPlayerAngle(heroId, info.spawn[3]);

		setPlayerOnFloor(heroId);

		clearInventory();
		info._func(heroId);

	local playerPos = getPlayerPosition(heroId);
		/* Camera.setPosition(playerPos.x - 78, playerPos.y + 50, playerPos.z - 119);
		Camera.setRotation(0, 30, 0); */
		local x = info.spawn[0] + 250.0 * sin((3.14 / 180) * info.spawn[3]);
		local z = info.spawn[2] + 250.0 * cos((3.14 / 180) * info.spawn[3]);
		Camera.setPosition(x, playerPos.y + 70, z);
		Camera.setRotation(15, info.spawn[3] + 180, 0);
}

addEventHandler("onKeyDown", function(key){
	if(selectClassCollection.getVisible()){
		switch(key){
			case KEY_A:
				selectedClass -= 1;
					if(selectedClass < 0) selectedClass = classes.len() - 1;
				updateClassInfo(selectedClass);
			break;
			case KEY_D:
				selectedClass += 1;
					if(selectedClass > classes.len() - 1) selectedClass = 0;
				updateClassInfo(selectedClass);
			break;

			case KEY_RETURN:
				clearInventory();

				local selectClassPacket = SelectClassMessage(heroId,
					selectedClass
				).serialize();
				selectClassPacket.send(RELIABLE_ORDERED);

				selectClassCollection.setVisible(false);
				setHudMode(HUD_ALL, HUD_MODE_DEFAULT);

				timeCollection.setVisible(true);

				Camera.movementEnabled = true;
				disableControls(false);
			break;
		}
	}
});