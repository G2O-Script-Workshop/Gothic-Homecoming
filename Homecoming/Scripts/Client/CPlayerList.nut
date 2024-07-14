local function clamp(value, min, max)
{
	if (value < min)
		return min

	if (value > max)
		return max

	return value
}

local PlayerListDataRow = class
{
	constructor(...)
	{
		color = {r = 255, g = 255, b = 255}
		columns = []

		foreach (value in vargv)
			columns.push(value)
	}

	function setColor(r, g, b)
	{
		color.r = r
		color.g = g
		color.b = b
	}

	color = null
	columns = null
}

local PlayerListVisibleRow = class
{
	constructor()
	{
		columns = []

		foreach (header in PlayerList._headers)
			columns.push(GUI.Draw({
				position = {x = 0, y = 0},
				text = ""
			}))
	}

	function update(dataRow)
	{
		if (dataRow)
		{
			foreach (idx, value in dataRow.columns)
			{
				columns[idx].setText(value)
				columns[idx].setColor({r = dataRow.color.r, g = dataRow.color.g, b = dataRow.color.b})
			}
		}
		else
		{
			foreach (column in columns)
				column.setText("")
		}
	}

	function setVisible(visible)
	{
		this.visible = visible

		foreach (column in columns)
			column.setVisible(visible)
	}

	function setPositionPx(x, y)
	{
		local headers = PlayerList._headers
		local width = 0

		foreach (id, column in columns)
		{
			column.setPositionPx(x + width, y)
			width += (nax(headers[id].width) + headers[id].draw.getSizePx().width)
		}
	}

	function setColor(r, g, b)
	{
		foreach (column in columns)
			column.setColor({r = r, g = g, b = b})
	}

	columns = null
	visible = false
}

PlayerList <- {
	_headers = [],
	_backgrounds = [],
	_rowHeightPx = -1,

	visible = false,
	x = -1,
	y = 100,
	width = -1,
	height = -1,

	begin = 0,
	playerDataRows = array(getMaxSlots()),
	dataRows = [],
	visibleRows = [],

	MAX_VISIBLE_ROWS = 30,

	COLUMN_ID = -1,
	COLUMN_NICKNAME = -1
}

function PlayerList::init()
{
	COLUMN_ID = registerColumn("ID", 120)
	COLUMN_NICKNAME = registerColumn("Player", 3000)

	registerTexture("MENU_INGAME.TGA", function()
	{
		tex.setPositionPx(PlayerList.x - 25, PlayerList.y - 15)
		tex.setSizePx(PlayerList.width + 50, PlayerList.height + 30)
	})

	for (local i = 0; i < MAX_VISIBLE_ROWS; ++i)
		visibleRows.push(PlayerListVisibleRow())

	local oldFont = textGetFont()
	textSetFont("FONT_OLD_10_WHITE_HI.TGA")
		_rowHeightPx = letterHeightPx()
	textSetFont(oldFont)

	resize()
}

function PlayerList::registerColumn(name, width)
{
	local draw = GUI.Draw({
		position = {x = 0, y = 0},
		text = name
	})
	draw.setColor({r = 255, g = 255, b = 0})

	_headers.push({
		name = name,
		width = width,
		draw = draw,
	})

	return _headers.len() - 1
}

function PlayerList::registerTexture(name, resize)
{
	local tex = GUI.Texture({
		position = {x = 0, y = 0}
		size = {width = 0, height = 0}
		file = name
		scaling = true
	})

	local bg = {
		resize = resize,
		tex = tex,
	}

	_backgrounds.push(bg)
}

function PlayerList::setVisible(visible)
{
	this.visible = visible

	Chat.setVisible(!Chat.visible);

	foreach (bg in _backgrounds)
		bg.tex.setVisible(visible)

	foreach (header in _headers)
		header.draw.setVisible(visible)

	foreach (visibleRow in visibleRows)
		visibleRow.setVisible(visible)
}

function PlayerList::refresh(value)
{
	_updateBegin(value)
	_updateVisibleRows()
}

function PlayerList::insert(pid, classId)
{
	if(dataRows.find(playerDataRows[pid]) != null) return;

	local dataRow = PlayerListDataRow(pid, format("%s (%s)", getPlayerName(pid), classes[getWorld()][classId].name))

	local playerColor = heroId != pid ? getPlayerColor(pid) : {r = 255, g = 150, b = 0}
	dataRow.setColor(playerColor.r, playerColor.g, playerColor.b)

	dataRows.push(dataRow)
	dataRows.sort(@(a, b) a.columns[PlayerList.COLUMN_ID] <=> b.columns[PlayerList.COLUMN_ID])
	playerDataRows[pid] = dataRow

	local dataRowIdx = dataRows.find(dataRow)

	if (isInView(dataRowIdx))
		_updateVisibleRows()
}

function PlayerList::remove(pid)
{
	local dataRowIdx = dataRows.find(playerDataRows[pid])
	local isInView = isInView(dataRowIdx)

	dataRows.remove(dataRowIdx)
	playerDataRows[pid] = null

	if (dataRowIdx == dataRows.len() - 1)
		_updateBegin(begin - 1)

	if (isInView)
		_updateVisibleRows()
}

function PlayerList::resize()
{
	width = 0
	height = _headers.top().draw.getSizePx().height + _rowHeightPx * MAX_VISIBLE_ROWS

	foreach (header in _headers)
		width += (nax(header.width) + header.draw.getSizePx().width)

	local headerX = x = (getResolution().x - width) / 2
	local headerY = y

	width = 0
	foreach (header in _headers)
	{
		header.draw.setPositionPx(headerX + width, headerY)
		width += (nax(header.width) + header.draw.getSizePx().width)
	}

	local offset = _rowHeightPx
	foreach (visibleRow in visibleRows)
	{
		visibleRow.setPositionPx(x, y + offset)
		offset += _rowHeightPx
	}

	foreach (bg in _backgrounds)
		bg.resize()
}

function PlayerList::_updateBegin(value)
{
	local maxScrollIdx = dataRows.len() - MAX_VISIBLE_ROWS

	if (maxScrollIdx < 0)
		maxScrollIdx = 0

	begin = clamp(value, 0, maxScrollIdx)
}

function PlayerList::isInView(dataRowIdx)
{
	return dataRowIdx >= begin && dataRowIdx <= begin + MAX_VISIBLE_ROWS - 1
}

function PlayerList::_updateVisibleRows()
{
	local dataRowIdx = begin
	local dataRowsLen = dataRows.len()

	foreach (visibleRow in visibleRows)
		visibleRow.update(dataRowIdx < dataRowsLen ? dataRows[dataRowIdx++] : null)
}

addEventHandler("onPlayerDestroy", function(pid)
{
	PlayerList.remove(pid)
})

UpdateClassMessage.bind(function(message){
	PlayerList.insert(message.playerId, message.classId);
});

addEventHandler("onKeyDown", function(key)
{
	if(!PlayerList.visible) return;

	switch (key)
	{
		case KEY_UP:
				PlayerList.refresh(PlayerList.begin - 1)
			break

		case KEY_DOWN:
				PlayerList.refresh(PlayerList.begin + 1)
			break

		case KEY_PRIOR:
				PlayerList.refresh(0)
			break

		case KEY_NEXT:
				PlayerList.refresh(PlayerList.dataRows.len() - PlayerList.MAX_VISIBLE_ROWS)
			break
	}
})

addEventHandler("onMouseWheel", function(value)
{
	if (PlayerList.visible)
		PlayerList.refresh(PlayerList.begin - value)
})

addEventHandler("onChangeResolution", function()
{
	PlayerList.resize()
})
