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

local _favoriteServers = LocalStorage.getItem("favoriteServers");
local tempFavoriteServers = array(100);

local _activeServerTab;
local curColumn = srvPlayers;
local curDirection = -1;

local checkActiveServerTab = function(){
	switch(_activeServerTab){
		case serverGUI.button_all:
			serverGUI.button_all.setFile("LOG_PAPER.TGA");
			serverGUI.button_fav.setFile("INV_BACK_PLUNDER.TGA");
		break;
		case serverGUI.button_fav:
			serverGUI.button_all.setFile("INV_BACK_PLUNDER.TGA");
			serverGUI.button_fav.setFile("LOG_PAPER.TGA");
		break;
	}
}

function showServerList(toggle){
	serverCollection.setVisible(toggle);
	updateDiscordState(format("Choosing a server..."));

	if(toggle){
		addEventHandler("GUI.onMouseIn", srvListMouseIn);
		addEventHandler("GUI.onMouseOut", srvListMouseOut);
		addEventHandler("onKeyDown", srvListKeyDown);
		addEventHandler("GUI.onMouseDown", srvListMouseClick);

		local askForServersPacket = ServerListPingMessage(heroId).serialize();
		askForServersPacket.send(RELIABLE);

		_activeServerTab = serverGUI.button_all;
		checkActiveServerTab();
	} else {
		removeEventHandler("GUI.onMouseIn", srvListMouseIn);
		removeEventHandler("GUI.onMouseOut", srvListMouseOut);
		removeEventHandler("onKeyDown", srvListKeyDown);
		removeEventHandler("GUI.onMouseDown", srvListMouseClick);

		_srvList.clear();
	}
}

local sortFunc = function(first, second){
	local firstValue = first.cells[curColumn].getText()
	local secondValue = second.cells[curColumn].getText()

	if(curColumn == srvPlayers || curColumn == srvBots){
		firstValue = firstValue.tointeger();
		secondValue = secondValue.tointeger();
	}

	return (firstValue <=> secondValue) * curDirection
}

ServerListMessage.bind(function(message){
	if(_activeServerTab == serverGUI.button_fav && _favoriteServers.find(message.serverId) == null) return;

		_srvList.insertRow(_srvListRows, {});
		_srvList.rows[_srvListRows].metadata.id <- message.serverId;

		_srvList.rows[_srvListRows].insertCell(srvType, {text = message.serverType});
		_srvList.rows[_srvListRows].insertCell(srvName, {text = message.serverName});
		_srvList.rows[_srvListRows].insertCell(srvMap, {text = message.serverZen});
		_srvList.rows[_srvListRows].insertCell(srvPlayers, {text = message.serverPlayers});
		_srvList.rows[_srvListRows].insertCell(srvBots, {text = message.serverNPCs});

	serverListScroll.setMaximum(_srvListRows);
	_srvList.sort(sortFunc);
});

function srvListMouseClick(self, buttn){
	if(!serverCollection.getVisible()) return;

	switch(self){
		case serverGUI.button_all:
		case serverGUI.button_fav:
			_srvList.clear();
			_activeServerTab = self;

			local askForServersPacket = ServerListPingMessage(heroId).serialize();
			askForServersPacket.send(RELIABLE);

			checkActiveServerTab();
		break;

		case srvType:
		case srvName:
		case srvMap:
		case srvPlayers:
		case srvBots:
			if(curColumn != self){
				curColumn = self
				curDirection = 1
			} else curDirection = -curDirection

			_srvList.sort(sortFunc);
		break;

		default:
			if(!(self instanceof GUI.GridListVisibleCell)){
				print("element: " + getElementPointedByCursor() + "\n" +
					"visible: " + self.getVisible() + "\n" +
					"disabled: " + self.getDisabled() + "\n" +
					"collection: " + self.collection);

				//self.setVisible(!self.getVisible());
				self.setColor({r = 255, g = 255, b = 0})
			}
		break;
	}

	if(self instanceof GUI.GridListVisibleCell){
		local _serverId = self.getDataCell().parent.metadata.id;
		switch(buttn){
			case MOUSE_BUTTONLEFT:
				local _player = Player[heroId];
				local joinVirtualServerPacket = ServerListClickMessage(heroId, _serverId,
					_player.getName(),
					_player.getVisual().bm,
					_player.getVisual().bt,
					_player.getVisual().hm,
					_player.getVisual().ht,
					_player.getWalkstyle(),
					/* LocalStorage.getItem("height"), */
					_player.getScale().f
					).serialize();
				joinVirtualServerPacket.send(RELIABLE);

				launchMenuScene(false);
				showServerList(false);
			break;

			case MOUSE_BUTTONRIGHT:
					foreach(id, entry in _favoriteServers){
						if(entry != null) tempFavoriteServers[id] = entry;
					}

				if(!_favoriteServers){
					tempFavoriteServers[_serverId] = _serverId;
					LocalStorage.setItem("favoriteServers", tempFavoriteServers)
				} else {

					if(_favoriteServers.find(_serverId) != null){
						tempFavoriteServers.remove(_serverId);
							if(_activeServerTab == serverGUI.button_fav){
								_srvList.removeRow(self.getDataCell().parent.id);
								_srvList.sort(sortFunc);
							}
					} else {
						tempFavoriteServers[_serverId] = _serverId;
					}

					LocalStorage.setItem("favoriteServers", tempFavoriteServers);
						_favoriteServers = LocalStorage.getItem("favoriteServers");
						tempFavoriteServers = array(100);
				}
			break;
		}
	}
}

function srvListMouseIn(self){
	if(!serverCollection.getVisible()) return;

	switch(self){
		case serverGUI.button_all:
		case serverGUI.button_fav:
			self.draw.setColor({r = 0, g = 255, b = 0});
		break;

		case srvType:
		case srvName:
		case srvMap:
		case srvPlayers:
		case srvBots:
			self.draw.setColor({r = 255, g = 255, b = 0});
		break;
	}

	if(self instanceof GUI.GridListVisibleCell){
		local visibleRow = self.parent
		if (visibleRow.parent != _srvList) return;

		foreach (cell in visibleRow.cells)
			cell.draw.setColor({r = 0, g = 255, b = 0})
	}
}

function srvListMouseOut(self){
	if(!serverCollection.getVisible()) return;

	switch(self){
		case serverGUI.button_all:
		case serverGUI.button_fav:
			self.draw.setColor({r = 255, g = 255, b = 255});
		break;

		case srvType:
		case srvName:
		case srvMap:
		case srvPlayers:
		case srvBots:
			self.draw.setColor({r = 255, g = 255, b = 255});
		break;
	}

	if(self instanceof GUI.GridListVisibleCell){
		local visibleRow = self.parent
		if (visibleRow.parent != _srvList) return;

		foreach (cell in visibleRow.cells)
			cell.draw.setColor({r = 255, g = 255, b = 255})
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