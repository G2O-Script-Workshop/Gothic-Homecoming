mapCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local mapGUI = {
	map = GUI.Texture({
		positionPx = {x = nax(500), y = nay(400)}
		sizePx = {width = nax(7400), height = nay(7000)}
		file = "GMP_LOGO_MENU.TGA"
		scaling = true
		disabled = true
		collection = mapCollection
	}),
	playerNames = array(getMaxSlots())
}

local _map = mapGUI.map;
local _pnames = mapGUI.playerNames

local function checkMap(){
	for(local i = 0, end = _pnames.len() - 1; i < end; i++){
		if(!isPlayerCreated(i)) continue;
		//if(isPlayerDead(i)) continue;

		_pnames.push(GUI.Draw({
			positionPx = {x = nax(4096), y = nay(4096)},
			text = format("+ %s", getPlayerName(i)),
			font = "FONT_DEFAULT.TGA"
		}))
		_pnames[i].setVisible(true);

		local mapPos = ""
		local playPos = getPlayerPosition(i);

		switch(_map.file){
			case "MAP_NEWWORLD.TGA":
				_pnames[i].setPositionPx(
					nax((playPos.x / 15) + 1850),
					nay(4415 - (playPos.z / 12))
				);
			break;
			case "MAP_OLDWORLD.TGA":
				_pnames[i].setPositionPx(
					nax((playPos.x / 16) + 4830),
					nay(3855 - (playPos.z / 12))
				);
			break;
			case "MAP_ADDONWORLD.TGA":
				_pnames[i].setPositionPx(
					nax((playPos.x / 11) + 4290),
					nay(4420 - (playPos.z / 10))
				);
			break;
			case "MAP_COLONY.TGA":
				_pnames[i].setPositionPx(
					nax((playPos.x / 24) + 4045),
					nay(4105 - (playPos.z / 16))
				);
			break;
		}
	}
}

function toggleMap(toggle){
	mapCollection.setVisible(toggle);
	_pnames.clear()

	switch(getWorld()){
		case "NEWWORLD\\NEWWORLD.ZEN":
			_map.setFile("MAP_NEWWORLD.TGA");
		break;
		case "OLDWORLD\\OLDWORLD.ZEN":
			_map.setFile("MAP_OLDWORLD.TGA");
		break;
		case "ADDON\\ADDONWORLD.ZEN":
			_map.setFile("MAP_ADDONWORLD.TGA");
		break;
		case "COLONY.ZEN":
			_map.setFile("MAP_COLONY.TGA");
		break;
	}

	if(toggle){
		addEventHandler("onRender", checkMap);
	} else {
		removeEventHandler("onRender", checkMap);
	}
}
