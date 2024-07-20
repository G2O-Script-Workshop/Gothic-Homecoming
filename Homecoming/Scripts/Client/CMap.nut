mapCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local mapGUI = {
	texture = GUI.Texture({
		positionPx = {x = nax(0), y = nay(0)}
		sizePx = {width = nax(8192), height = nay(8192)}
		file = "GMP_LOGO_MENU.TGA"
		scaling = true
		disabled = true
		collection = mapCollection
	})

	world = ""

	coordinates = {
		x = -1,
		y = -1,
		width = -1,
		height = -1
	}

	playerMarker = array(getMaxSlots())
}

local _texture = mapGUI.texture;
local _world = mapGUI.world;
local _coordinates = mapGUI.coordinates;
local _playerMarker = mapGUI.playerMarker;


	function setLevelCoords(world, x, y, width, height){
		_world = world

		_coordinates.x = x
		_coordinates.y = y
		_coordinates.width = width
		_coordinates.height = height
	}

	function isPlayerAt(pid){
		if (!isPlayerCreated(pid))
			return false

		if (getWorld() != _world)
			return false

		return true
	}

	function toggleMarkers(value){
		for (local pid = 0; pid < getMaxSlots(); ++pid) {

			if(!isPlayerAt(pid)) continue;

			_playerMarker[pid].setVisible(value)
		}
	}

	function updatePlayerMarkers(){
		for (local pid = 0; pid < getMaxSlots(); ++pid) {

			if (!isPlayerAt(pid)) continue;

				toggleMarkers(isPlayerAt(pid));

			local playerPosition = getPlayerPosition(pid)

			playerPosition.x -= _coordinates.x
			playerPosition.z -= _coordinates.y

			local maxX = _coordinates.width - _coordinates.x
			local maxY = _coordinates.height - _coordinates.y

			playerPosition.x = (playerPosition.x / maxX.tofloat()) * 8192
			playerPosition.z = (playerPosition.z / maxY.tofloat()) * 8192

			_playerMarker[pid].update(playerPosition.x, playerPosition.z)
		}
	}


class PlayerMarker extends GUI.Draw{
	pid = -1

	constructor(pid){
		base.constructor({
			positionPx = {x = 0, y = 0},
			text = ""
		})
		this.pid = pid
	}

	function update(x, y){
		setPosition(x, y);

		setText(format("+ %s", getPlayerName(pid)));

		if (!getVisible())
			setVisible(true);
	}
}

function toggleMap(toggle){
	mapCollection.setVisible(toggle);
	local world = getWorld();
	local position = getPlayerPosition(heroId)

	switch(world){
		case "NEWWORLD\\NEWWORLD.ZEN":
			if (position.x > -6900 && position.x < 21600 && position.z < 11800 && position.z > -9400) {
				_texture.setFile("MAP_NWCITY.TGA");
				setLevelCoords(world, -6900, 11800, 21600, -9400);
			} else {
				_texture.setFile("MAP_NEWWORLD.TGA");
				setLevelCoords(world, -28000, 50500, 95500, -42500);
			}
		break;
		case "OLDWORLD\\OLDWORLD.ZEN":
			_texture.setFile("MAP_OLDWORLD.TGA");
			setLevelCoords(world, -78500, 47500, 54000, -53000);
		break;
		case "ADDON\\ADDONWORLD.ZEN":
			_texture.setFile("MAP_ADDONWORLD.TGA");
			setLevelCoords(world, -47783, 36300, 43949, -32300);
		break;
		case "COLONY.ZEN":
			if (position.x > -11975 && position.x < 11775 && position.z < 8400 && position.z > -9675) {
				_texture.setFile("MAP_OLDCAMP.TGA");
				setLevelCoords(world, -11975, 8400, 11775, -9675);
			} else if (position.x > -64875 && position.x < -41125 && position.z < 15775 && position.z > -1775) {
				_texture.setFile("MAP_NEWCAMP.TGA");
				setLevelCoords(world, -64875, 15775, -41125, -1775);
			} else if (position.x > 33750 && position.x < 67050 && position.z < 2600 && position.z > -21500) {
				_texture.setFile("MAP_PSICAMP.TGA");
				setLevelCoords(world, 33750, 2600, 67050, -21500);
			} else {
				_texture.setFile("MAP_COLONY.TGA");
				setLevelCoords(world, -75642, 55012, 74528, -54472);
			}
		break;
	}

	if(toggle) {
		for (local pid = 0; pid < getMaxSlots(); ++pid)
		_playerMarker[pid] = PlayerMarker(pid)

		addEventHandler("onRender", updatePlayerMarkers);
	} else {
		removeEventHandler("onRender", updatePlayerMarkers);
		toggleMarkers(false);
	}
}

addEventHandler("onPlayerDestroy", function(pid){
	_playerMarker[pid].visible = false;
})