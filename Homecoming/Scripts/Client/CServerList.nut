serverCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local serverGUI = {
	list = GUI.Table({
		positionPx = {x = 0, y = nay(400)}
		sizePx = {width = nax(8192), height = nay(7792)}
		/* marginPx = {top = 10, left = 10}
		rowHeightPx = 28
		rowSpacingPx = 5 */
		file = "INV_BACK_PLUNDER.TGA"
		scrollbar = {
			range = {
				file = "MENU_INGAME.TGA"
				indicator = {file = "BAR_MISC.TGA"}
			}
		}
		collection = serverCollection
	})


	button_all = GUI.Button({
		positionPx = {x = 0, y = 0}
		sizePx = {width = nax(1000), height = nay(400)}
		file = "INV_BACK_PLUNDER.TGA"
		draw = {text = "PUBLIC"}
		collection = serverCollection
	})

	button_fav = GUI.Button({
		positionPx = {x = nax(1000), y = 0}
		sizePx = {width = nax(1000), height = nay(400)}
		file = "INV_BACK_PLUNDER.TGA"
		draw = {text = "FAVORITE"}
		collection = serverCollection
	})
}

local srvType = serverGUI.list.addColumn({
	widthPx = nax(900)
	align = Align.Left
	file = "INV_BACK_PLUNDER.TGA"
	draw = {text = "Server Type"}
})
local srvName = serverGUI.list.addColumn({
	widthPx = nax(3000)
	align = Align.Left
	file = "INV_BACK_PLUNDER.TGA"
	draw = {text = "Server Name"}
})
local srvMap = serverGUI.list.addColumn({
	widthPx = nax(3000)
	align = Align.Left
	file = "INV_BACK_PLUNDER.TGA"
	draw = {text = "World Map"}
})
local srvPlayers = serverGUI.list.addColumn({
	widthPx = nax(800)
	align = Align.Left
	file = "INV_BACK_PLUNDER.TGA"
	draw = {text = "Players"}
})
local srvBots = serverGUI.list.addColumn({
	widthPx = nax(800)
	align = Align.Left
	file = "INV_BACK_PLUNDER.TGA"
	draw = {text = "NPCs"}
})

local _srvList = serverGUI.list
local _srvListRows = _srvList.rows.len()
local serverListScroll = serverGUI.list.scrollbar.range;

function showServerList(toggle){
	serverCollection.setVisible(toggle);

	if(toggle){
		addEventHandler("GUI.onMouseIn", srvListMouseIn);
		addEventHandler("GUI.onMouseOut", srvListMouseOut);
		addEventHandler("onKeyDown", srvListKeyDown);
		addEventHandler("GUI.onClick", srvListMouseClick)

		local askForServersPacket = ServerListPingMessage(heroId).serialize();
		askForServersPacket.send(RELIABLE);
	} else {
		removeEventHandler("GUI.onMouseIn", srvListMouseIn);
		removeEventHandler("GUI.onMouseOut", srvListMouseOut);
		removeEventHandler("onKeyDown", srvListKeyDown);
		removeEventHandler("GUI.onClick", srvListMouseClick)

		_srvList.clear();
	}
}

local curColumn = srvPlayers;
local curDirection = 1;

local sortStart = function(first, second){
	local firstValue = first.cells[srvPlayers].getText()
	local secondValue = second.cells[srvPlayers].getText()

	return (firstValue <=> secondValue) * -curDirection
}

local sortFunc = function(first, second){
	local firstValue = first.cells[curColumn].getText()
	local secondValue = second.cells[curColumn].getText()

	return (firstValue <=> secondValue) * curDirection
}

ServerListMessage.bind(function(message){
	_srvList.insertRow(message.serverId, {});
	_srvList.rows[message.serverId].metadata.id <- message.serverId;

	_srvList.rows[message.serverId].insertCell(srvType, {text = message.serverType});
	_srvList.rows[message.serverId].insertCell(srvName, {text = message.serverName});
	_srvList.rows[message.serverId].insertCell(srvMap, {text = message.serverZen});
	_srvList.rows[message.serverId].insertCell(srvPlayers, {text = message.serverPlayers});
	_srvList.rows[message.serverId].insertCell(srvBots, {text = message.serverNPCs});

	serverListScroll.setMaximum(_srvListRows);
	_srvList.sort(sortStart);
});

function srvListMouseClick(self){
	if(self instanceof GUI.GridListVisibleCell){
		local _player = Player[heroId];
		local joinVirtualServerPacket = ServerListClickMessage(heroId, self.getDataCell().parent.metadata.id,
			_player.getName(), //LocalStorage.getItem("characterName"),
			_player.getVisual().bm, //LocalStorage.getItem("bodyModel"),
			_player.getVisual().bt, //LocalStorage.getItem("bodyTexture"),
			_player.getVisual().hm, //LocalStorage.getItem("headModel"),
			_player.getVisual().ht, //LocalStorage.getItem("headTexture"),
			_player.getWalkstyle(), //LocalStorage.getItem("walkstyle"),
			/* LocalStorage.getItem("height"), */
			_player.getScale().f //LocalStorage.getItem("fatness")
			).serialize();
		joinVirtualServerPacket.send(RELIABLE);

		launchMenuScene(false);
		showServerList(false);
	}

	if(self == srvType || self == srvName || self == srvMap || self == srvPlayers || self == srvBots){
		if(curColumn != self){
			curColumn = self
			curDirection = 1
		} else curDirection = -curDirection

		_srvList.sort(sortFunc);
	}
}

function srvListMouseIn(self){
	if(!serverCollection.getVisible()) return;

	if(self == serverGUI.button_all || self == serverGUI.button_fav){
			self.draw.setColor({r = 0, g = 255, b = 0});
			self.setFile("LOG_PAPER.TGA");
		return;
	}

	if(self == srvType || self == srvName || self == srvMap || self == srvPlayers || self == srvBots){
			self.draw.setColor({r = 255, g = 255, b = 0});
		return;
	}

	if(self instanceof GUI.GridListVisibleCell){
		local visibleRow = self.parent
		if (visibleRow.parent != _srvList) return;

		foreach (cell in visibleRow.cells)
			cell.draw.setColor({r = 0, g = 255, b = 0})

		return;
	}
}

function srvListMouseOut(self){
	if(!serverCollection.getVisible()) return;

	if(self == serverGUI.button_all || self == serverGUI.button_fav){
			self.draw.setColor({r = 255, g = 255, b = 255});
			self.setFile("INV_BACK_PLUNDER.TGA");
		return;
	}

	if(self == srvType || self == srvName || self == srvMap || self == srvPlayers || self == srvBots){
		self.draw.setColor({r = 255, g = 255, b = 255});
		return;
	}

	if(self instanceof GUI.GridListVisibleCell){
		local visibleRow = self.parent
		if (visibleRow.parent != _srvList) return;

		foreach (cell in visibleRow.cells)
			cell.draw.setColor({r = 255, g = 255, b = 255})

		return;
	}
}

function srvListKeyDown(key){
	if(!serverCollection.getVisible()) return;

		switch(key){
			case KEY_ESCAPE:
				showServerList(false);
				menuChangeVisibility(true);
			break;
		}
}