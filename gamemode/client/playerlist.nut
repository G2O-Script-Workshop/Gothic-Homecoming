/////////////////////////////////////////
///	Defines
/////////////////////////////////////////

local MAX_PLAYERS = 30;

/////////////////////////////////////////
///	Player list class
/////////////////////////////////////////

PlayerList <- {
	// Private
	_hostname = null,
	_items = array(getMaxSlots(), null),
	_headers = [],
	_backgrounds = [],
	_lineHeightPx = -1,
	_begin = 0,
	_size = 0,

	// Public
	visible = false,
	x = -1,
	y = 100,
	width = -1,
	height = -1,

	// Constans
	ID = -1,
	NICKNAME = -1,
	GUILD = -1,
}

//---------------------------------------

function PlayerList::constructor()
{
	// List draw
	_hostname = Draw(0, 0, getHostname());
	_hostname.font = "FONT_OLD_20_WHITE_HI.TGA";
	_hostname.setPositionPx(nax(4096 - _hostname.width / 2), y / 2);

	ID = registerColumn("ID", 200);
	NICKNAME = registerColumn("Nick", 2000);
	GUILD = registerColumn("Gildia", 1200);
	// Add more columns after this line...

	resize();

	// Create textures
	registerTexture("MENU_INGAME.TGA", function ()
	{
		tex.setPositionPx(PlayerList.x - 25,PlayerList.y - 15);
		tex.setSizePx(PlayerList.width + 50, PlayerList.height + 30);
	});

	// Add more textures after this line...

	// Top
	foreach (header in _headers)
		header.draw.top();
}

//---------------------------------------

function PlayerList::registerColumn(name, width)
{
	local draw = Draw(0, 0, name);
	draw.setColor(255, 255, 0);

	_headers.push({
		name = name,
		width = width,
		draw = draw,
	})

	return _headers.len() - 1;
}

//---------------------------------------

function PlayerList::registerTexture(name, resize)
{
	local tex = Texture(0, 0, 0, 0, name);
	local bg = {
		resize = resize,
		tex = tex,
	}

	bg.resize();
	_backgrounds.push(bg);
}

//---------------------------------------

function PlayerList::getItem(pid)
{
	return _items[pid];
}

//---------------------------------------

function PlayerList::toggle()
{
	visible ? hide() : show();
}

//---------------------------------------

function PlayerList::show()
{
	if (visible) return;
	visible = true;

	_hostname.visible = true;

	foreach (header in _headers)
		header.draw.visible = true;

	foreach (bg in _backgrounds)
		bg.tex.visible = true;

	_showActive();
}

//---------------------------------------

function PlayerList::hide()
{
	if (!visible) return;
	visible = false;

	_hostname.visible = false;

	foreach (header in _headers)
		header.draw.visible = false;

	foreach (bg in _backgrounds)
		bg.tex.visible = false;

	_hideActive();
}

//---------------------------------------

function PlayerList::scroll(value)
{
	_hideActive();

	// Calculate new begin
	local len = _size - MAX_PLAYERS + 1;
	if (len < 0) len = 0;

	_begin -= value;

	if (_begin < 0) _begin = 0;
	else if (_begin > len) _begin = len;

	_showActive();
}

//---------------------------------------

function PlayerList::insert(pid)
{
	if (pid >= _items.len()) return;

	local playerItem = heroId != pid ? PlayerListItem(pid, 255, 255, 255) : PlayerListItem(pid, 255, 150, 0);

	_items[pid] = playerItem;
	++_size;

	return playerItem;
}

//---------------------------------------

function PlayerList::remove(pid)
{
	if (pid >= _items.len()) return;

	_items[pid] = null;
	--_size;
}

//---------------------------------------

function PlayerList::resize()
{
	local res = getResolution();
	_lineHeightPx = _headers.top().draw.heightPx;

	width = 0;
	height = _lineHeightPx * MAX_PLAYERS;

	foreach (header in _headers)
		width += (nax(header.width) + header.draw.widthPx);

	local headerX = x = (res.x - width) / 2.0;
	local headerY = y;
	local offset = _lineHeightPx;
	local count = 0;

	width = 0;
	foreach (header in _headers)
	{
		header.draw.setPositionPx(headerX + width, headerY);
		width += (nax(header.width) + header.draw.widthPx);
	}

	for (local i = _begin; i < _items.len() && count < MAX_PLAYERS - 1; ++i)
	{
		local item = _items[i];
		if (!item) continue;

		item.update(x, y + offset);

		offset += item.offset();
		++count;
	}

	foreach (bg in _backgrounds)
		bg.resize();
}

//---------------------------------------

function PlayerList::_hideActive()
{
	local count = 0;

	for (local i = _begin; i < _items.len() && count < MAX_PLAYERS - 1; ++i)
	{
		local item = _items[i];
		if (!item) continue;

		item.hide();
		++count;
	}
}

//---------------------------------------

function PlayerList::_showActive()
{
	local count = 0;
	local offset = _lineHeightPx;

	for (local i = _begin; i < _items.len() && count < MAX_PLAYERS - 1; ++i)
	{
		local item = _items[i];
		if (!item) continue;

		item.update(x, y + offset);
		item.show();

		offset += item.offset();
		++count;
	}
}

/////////////////////////////////////////
///	Player list item
/////////////////////////////////////////

class PlayerListItem
{
	constructor(pid, r, g, b)
	{
		columns = [];
		visible = false;

		foreach (header in PlayerList._headers)
		{
			local draw = Draw(0, 0, "");
			draw.setColor(r, g, b);

			columns.push(draw);
		}
	}

	function show()
	{
		if (visible) return;
		visible = true;

		foreach (column in columns)
			column.visible = true;
	}

	function hide()
	{
		if (!visible) return;
		visible = false;

		foreach (column in columns)
			column.visible = false;
	}

	function offset()
	{
		return columns.top().heightPx;
	}

	function update(x, y)
	{
		local headers = PlayerList._headers;
		local width = 0;

		foreach (id, column in columns)
		{
			column.setPositionPx(x + width, y);
			width += (nax(headers[id].width) + headers[id].draw.widthPx);
		}
	}

	columns = null;
	visible = false;
}

/////////////////////////////////////////
///	Events
/////////////////////////////////////////

local function playerCreate(pid)
{
	local playerItem = PlayerList.insert(pid);

	// Init item with default data
	local color = getPlayerColor(pid);

	playerItem.columns[PlayerList.ID].text = pid.tostring();
	playerItem.columns[PlayerList.NICKNAME].text = getPlayerName(pid);
	playerItem.columns[PlayerList.NICKNAME].setColor(color.r, color.g, color.b);
	playerItem.columns[PlayerList.GUILD].text = "";
}

addEventHandler("onPlayerCreate", playerCreate);

//---------------------------------------

local function playerDestroy(pid)
{
	PlayerList.remove(pid);
}

addEventHandler("onPlayerDestroy", playerDestroy);

//---------------------------------------

local function playerGuild(pid, class_id)
{
    local playerItem = PlayerList.getItem(pid);
    if (playerItem == null) return;

    playerItem.columns[PlayerList.GUILD].text = classes[class_id].guild;
}

addEventHandler("onChangeClass", playerGuild);

//---------------------------------------

local function playerNickname(pid, name)
{
	local playerItem = PlayerList.getItem(pid);
	if (playerItem == null) return;

	playerItem.columns[PlayerList.NICKNAME].text = name;
}

addEventHandler("onPlayerChangeNickname", playerNickname);

//---------------------------------------

local function playerColor(pid, r, g, b)
{
	local playerItem = PlayerList.getItem(pid);
	if (playerItem == null) return;

	playerItem.columns[PlayerList.NICKNAME].setColor(r, g, b);
}

addEventHandler("onPlayerChangeColor", playerColor);

//---------------------------------------

local function keyHandler(key)
{
	if (key == KEY_F5 && !chatInputIsOpen())
		PlayerList.toggle();
}

addEventHandler("onKey", keyHandler);

//---------------------------------------

local function mouseWheel(value)
{
	if (PlayerList.visible)
		PlayerList.scroll(value);
}

addEventHandler("onMouseWheel", mouseWheel);

//---------------------------------------

local function resChange()
{
	PlayerList.resize();
}

addEventHandler("onChangeResolution", resChange);

// Initialize PlayerList
PlayerList.constructor();
