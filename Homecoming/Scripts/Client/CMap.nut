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
	playerNames = {}
}

local _map = mapGUI.map;

local function checkMap(){
	switch(getWorld()){
		case "NEWWORLD\\NEWWORLD.ZEN":
			_map.setFile("MAP_NEWWORLD.TGA");
			/* _map.setPositionPx()
			_map.setSizePx() */
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
}

function toggleMap(toggle){
	mapCollection.setVisible(toggle);

	disableControls(toggle);

	if(toggle) checkMap();
}