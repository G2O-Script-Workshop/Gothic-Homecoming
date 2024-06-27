/////////////////////////////////////////
///	Defines
/////////////////////////////////////////

const CHAT_LINE_SIZE = 15;

const CHAT_HISTORY_SIZE = 50;
const CHAT_PLAYER_HISTORY_SIZE = 5;

const CHAT_VISIBLE = true;
const CHAT_ANIMATION_INTERVAL = 400;

/////////////////////////////////////////
///	Line types
/////////////////////////////////////////

class ChatLine
{
	constructor(r, g, b, text)
	{
		_line = Draw(0, 0, text);
		_line.setColor(r, g, b);
	}

	function show()
	{
		_line.visible = true;
	}

	function hide()
	{
		_line.visible = false;
	}

	function update(x, y)
	{
		_line.setPositionPx(x, y);
	}

	function setAlpha(alpha)
	{
		_line.setAlpha(alpha)
	}

	function offset()
	{
		return _line.heightPx;
	}

	_line = null;
	_animationBeginTime = -1;
}

//---------------------------------------

class ChatPlayerLine extends ChatLine
{
	constructor(pid, r, g, b, text)
	{
		base.constructor(r, g, b, text);

		local color = getPlayerColor(pid);
		_nickname = Draw(0, 0, getPlayerName(pid) + ": ");
		_nickname.setColor(color.r, color.g, color.b);
	}

	function show()
	{
		base.show();
		_nickname.visible = true;
	}

	function hide()
	{
		base.hide();
		_nickname.visible = false;
	}

	function update(x, y)
	{
		base.update(_nickname.widthPx + x, y);
		_nickname.setPositionPx(x, y);
	}

	function setAlpha(alpha)
	{
		base.setAlpha(alpha)
		_nickname.setAlpha(alpha)
	}

	function offset()
	{
		return _nickname.heightPx;
	}

	_nickname = null;
}

/////////////////////////////////////////
///	Chat
/////////////////////////////////////////

Chat <- {
	x = 5,
	y = 5,
	visible = CHAT_VISIBLE,

	_lines = queue(),
	_maxLines = CHAT_LINE_SIZE,

	_historySize = CHAT_HISTORY_SIZE,
	_location = 0,

	_playerHistory = queue(),
	_playerHistorySize = CHAT_PLAYER_HISTORY_SIZE,
	_playerHistoryLocation = 0,

	_animationInterval = CHAT_ANIMATION_INTERVAL.tofloat(),
	_animationBeginTime = -1
}

//---------------------------------------

function Chat::toggle()
{
	visible ? hide() : show();
}

//---------------------------------------

function Chat::show()
{
	visible = true;

	for (local i = firstVisibleLine(); i <= lastVisibleLine(); ++i)
		_lines[i].show();
}

//---------------------------------------

function Chat::hide()
{
	visible = false;

	for (local i = firstVisibleLine(); i <= lastVisibleLine(); ++i)
		_lines[i].hide();
}

//---------------------------------------

function Chat::printPlayer(pid, r, g, b, msg)
{
	_printLine(ChatPlayerLine(pid, r, g, b, msg));

	if (_playerHistorySize > 0)
	{
		_playerHistory.push(msg);

		if (_playerHistory.len() > _playerHistorySize)
			_playerHistory.pop();
	}
}

//---------------------------------------

function Chat::print(r, g, b, msg)
{
	_printLine(ChatLine(r, g, b, msg));
}

//---------------------------------------

function Chat::_printLine(line)
{
	_lines.push(line);
	if (visible) _lines[lastVisibleLine()].show();

	if (_animationInterval > 0)
	{
		_lines[lastVisibleLine()].setAlpha(0);
		_lines[lastVisibleLine()]._animationBeginTime = getTickCount();
	}

	if (_lines.len() > _maxLines)
	{
		_lines[firstVisibleLine() - 1].hide();

		if (_lines.len() > _historySize)
			_lines.pop();

		if (_animationInterval > 0)
			_animationBeginTime = getTickCount();
		else
			_calcPosition();
	}
	else
		_calcPosition();
}

//---------------------------------------

function Chat::_calcPosition()
{
	local offset = 0;

	for (local i = firstVisibleLine(); i <= lastVisibleLine(); ++i)
	{
		local line = _lines[i];

		if (visible) line.show();
		line.update(x, y + offset);

		offset += line.offset();
	}

	chatInputSetPosition(x, any(y + offset));
}

//---------------------------------------

function Chat::setHistorySize(size)
{
	if (size >= _maxLines && _historySize > size)
	{
		local end = _lines.len() - size;

		for (local i = 0; i < end; ++i)
			_lines.pop();
	}

	_historySize = size;
}

//---------------------------------------

function Chat::setMaxLines(maxLines)
{
	if (maxLines <= 0 || maxLines > 30)
		return;

	for (local i = firstVisibleLine(); i <= lastVisibleLine(); ++i)
		_lines[i].hide();

	_maxLines = maxLines;
	_calcPosition();

	if (_historySize < maxLines)
		setHistorySize(maxLines);
}

//---------------------------------------

function Chat::location()
{
	return _location;
}

//---------------------------------------

function Chat::topLocation()
{
	local idx = _lines.len() - _maxLines;

	if (idx < 0)
		idx = 0;

	return -idx;
}

//---------------------------------------

function Chat::firstVisibleLine()
{
	local idx = _lines.len() - _maxLines + _location;

	if (idx < 0)
		idx = 0;

	return idx;
}

//---------------------------------------

function Chat::lastVisibleLine()
{
	local idx = _lines.len() - 1 + _location;

	if (idx < 0)
		idx = 0;

	return idx;
}

//---------------------------------------

function Chat::move(newLocation)
{
	if (_lines.len() < _maxLines)
		return;

	if ((_lines.len() - _maxLines + newLocation < 0) || (newLocation > 0))
		return;

	if (_location == newLocation)
		return;

	for (local i = firstVisibleLine(); i <= lastVisibleLine(); ++i)
		_lines[i].hide();

	_location = newLocation;
	_calcPosition();
}

//---------------------------------------

function Chat::setPlayerHistorySize(size)
{
	if (_playerHistorySize > size)
		loadPlayerMessage(0);

	_playerHistorySize = size;
}

//---------------------------------------

function Chat::playerHistoryLocation()
{
	return _playerHistoryLocation;
}

//---------------------------------------

function Chat::loadPlayerMessage(newLocation)
{
	if (!_playerHistory.len())
		return;

	if ((_playerHistory.len() + newLocation < 0) || (newLocation > 0))
		return;

	if (_playerHistoryLocation == newLocation)
		return;

	_playerHistoryLocation = newLocation;

	if (newLocation != 0)
		chatInputSetText(_playerHistory[_playerHistory.len() + newLocation]);
	else
		chatInputSetText("");
}

/////////////////////////////////////////
///	Events
/////////////////////////////////////////

local function renderHandler()
{
	local now = getTickCount();

	if (Chat._animationInterval <= 0)
		return;

	local deltaTime = (now - Chat._animationBeginTime) / Chat._animationInterval;
	local firstVisibleLine = Chat.firstVisibleLine();

	for (local i = 0; i < Chat._lines.len() - firstVisibleLine; ++i)
	{
		local line = Chat._lines[i + firstVisibleLine];

		if (Chat._animationBeginTime != -1)
		{
			if (deltaTime < 1.0)
				line.update(Chat.x, Chat.y + line.offset() * (i + 1) - line.offset() * deltaTime);
			else
			{
				Chat._calcPosition();
				Chat._animationBeginTime = -1;
			}
		}

		if (line._animationBeginTime != -1)
		{
			local deltaTime = (now - line._animationBeginTime) / Chat._animationInterval;

			if (deltaTime < 1.0)
				line.setAlpha(255 * deltaTime);
			else
			{
				line.setAlpha(255);
				line._animationBeginTime = -1;
			}
		}
	}
}

enableEvent_Render(true);
addEventHandler("onRender", renderHandler);

//---------------------------------------

local function keyHandler(key)
{
	if (chatInputIsOpen())
	{
		switch (key)
		{
		case KEY_UP:
			if (isKeyPressed(KEY_LCONTROL) || isKeyPressed(KEY_RCONTROL))
				Chat.loadPlayerMessage(Chat.playerHistoryLocation() - 1);
			else
				Chat.move(Chat.location() - 1);
			break;

		case KEY_DOWN:
			if (isKeyPressed(KEY_LCONTROL) || isKeyPressed(KEY_RCONTROL))
				Chat.loadPlayerMessage(Chat.playerHistoryLocation() + 1);
			else
				Chat.move(Chat.location() + 1);
			break;

		case KEY_PRIOR:
			Chat.move(Chat.topLocation());
			break;

		case KEY_NEXT:
			Chat.move(0);
			break;

		case KEY_RETURN:
			Chat.move(0);
			chatInputSend();
			Chat.loadPlayerMessage(0);

			setFreeze(false);
			Camera.enableMovement(true);
			break;

		case KEY_ESCAPE:
		case KEY_TILDE:
			chatInputClose();

			setFreeze(false);
			Camera.enableMovement(true);
			break;

		default:
			playGesticulation(heroId);
			break;
		}
	}
	else
	{
		switch (key)
		{
		case KEY_T:
			if (!isConsoleOpen() && Chat.visible)
			{
				chatInputOpen();

				setFreeze(true);
				Camera.enableMovement(false);
			}
			break;

		case KEY_F9:
			Chat.toggle();
			break;
		}
	}
}

addEventHandler("onKey", keyHandler);

//---------------------------------------

local function commandHandler(cmd, param)
{
	try
		param = param.tointeger()
	catch (msg)
		return;

	switch (cmd)
	{
		case "chatlines":
			Chat.setMaxLines(param);
			break;

		case "chatlimit":
			Chat.setHistorySize(param);
			break;

		case "chatplayerlimit":
			Chat.setPlayerHistorySize(param);
			break
	}
}

addEventHandler("onCommand", commandHandler)

//---------------------------------------

local function mouseWheelHandler(direction)
{
	if (!Chat.visible)
		return;

	if (!chatInputIsOpen())
		return;

	if (isKeyPressed(KEY_LCONTROL) || isKeyPressed(KEY_RCONTROL))
		Chat.loadPlayerMessage(Chat.playerHistoryLocation() - direction);
	else
		Chat.move(Chat.location() - direction);
}

addEventHandler("onMouseWheel", mouseWheelHandler);

//---------------------------------------

local function messageHandler(pid, r, g, b, message)
{
	if (pid != -1)
		Chat.printPlayer(pid, r, g, b, message);
	else
		Chat.print(r, g, b, message);
}

addEventHandler("onPlayerMessage", messageHandler);

// Loaded
print("chat.nut loaded...")
