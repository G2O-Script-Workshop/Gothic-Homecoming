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
                label = {text = "PUBLIC"}
                collection = serverCollection
        })

        button_fav = GUI.Button({
                positionPx = {x = nax(1000), y = 0}
                sizePx = {width = nax(1000), height = nay(400)}
                file = "INV_BACK_PLUNDER.TGA"
                label = {text = "FAVORITE"}
                collection = serverCollection
        })
}

local columnDefinitions = [
        { key = "srvType", width = nax(900), label = "Server Type" },
        { key = "srvName", width = nax(3000), label = "Server Name" },
        { key = "srvMap", width = nax(3000), label = "World Map" },
        { key = "srvPlayers", width = nax(800), label = "Players" },
        { key = "srvBots", width = nax(800), label = "NPCs" }
];

local columns = {};
foreach (definition in columnDefinitions) {
        columns[definition.key] <- serverGUI.list.addColumn({
                widthPx = definition.width
                align = Align.Left
                file = "INV_BACK_PLUNDER.TGA"
                label = {text = definition.label}
        });
}

local srvType = columns.srvType;
local srvName = columns.srvName;
local srvMap = columns.srvMap;
local srvPlayers = columns.srvPlayers;
local srvBots = columns.srvBots;

local _srvList = serverGUI.list;
local serverListScroll = serverGUI.list.scrollbar.range;

local favoriteServers = {};

local _activeServerTab;
local curColumn = srvPlayers;
local curDirection = -1;

local function updateScrollBounds(){
        local maximum = _srvList.getMaxScrollbarValue();

        serverListScroll.setMaximum(maximum);

        local currentValue = serverListScroll.getValue();
        if(currentValue > maximum) {
                serverListScroll.setValue(maximum);
        } else if(currentValue < 0) {
                serverListScroll.setValue(0);
        }
}

local function loadFavoriteServers(){
        favoriteServers = {};

        local storedFavorites = LocalStorage.getItem("favoriteServers");
        if(!storedFavorites) return;

        foreach (_, serverId in storedFavorites) {
                if(serverId != null) favoriteServers[serverId] <- true;
        }
}

local function serializeFavoriteServers(){
        if(favoriteServers.len() == 0) return array(0);

        local serialized = array(0);
        foreach (serverId, _ in favoriteServers) {
                serialized.append(serverId);
        }

        serialized.sort(@(a, b) a <=> b);

        return serialized;
}

local function saveFavoriteServers(){
        LocalStorage.setItem("favoriteServers", serializeFavoriteServers());
}

local function isFavoriteServer(serverId){
        return serverId in favoriteServers;
}

local function toggleFavoriteServer(serverId){
        local becameFavorite = !isFavoriteServer(serverId);

        if(becameFavorite) {
                favoriteServers[serverId] <- true;
        } else {
                delete favoriteServers[serverId];
        }

        saveFavoriteServers();
        return becameFavorite;
}

loadFavoriteServers();

local function requestServerList(){
        local askForServersPacket = ServerListPingMessage(heroId).serialize();
        askForServersPacket.send(RELIABLE);
}

local function updateServerListHeaderState(){
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

local function clearServerList(){
        _srvList.clear();
        updateScrollBounds();
}

local function appendServerRow(message){
        local rowIndex = _srvList.rows.len();
        _srvList.insertRow(rowIndex, {});

        local newRow = _srvList.rows[rowIndex];
        newRow.metadata.id <- message.serverId;

        newRow.insertCell(srvType, {text = message.serverType});
        newRow.insertCell(srvName, {text = message.serverName});
        newRow.insertCell(srvMap, {text = message.serverZen});
        newRow.insertCell(srvPlayers, {text = message.serverPlayers});
        newRow.insertCell(srvBots, {text = message.serverNPCs});

        updateScrollBounds();
}

function showServerList(toggle){
	serverCollection.setVisible(toggle);
	updateDiscordState(format("Choosing a server..."));

        if(toggle){
                addEventHandler("GUI.onMouseIn", srvListMouseIn);
                addEventHandler("GUI.onMouseOut", srvListMouseOut);
                addEventHandler("onKeyDown", srvListKeyDown);
                addEventHandler("GUI.onMouseDown", srvListMouseClick);

                loadFavoriteServers();
                clearServerList();
                _activeServerTab = serverGUI.button_all;
                updateServerListHeaderState();
                requestServerList();
        } else {
                removeEventHandler("GUI.onMouseIn", srvListMouseIn);
                removeEventHandler("GUI.onMouseOut", srvListMouseOut);
                removeEventHandler("onKeyDown", srvListKeyDown);
                removeEventHandler("GUI.onMouseDown", srvListMouseClick);

                clearServerList();
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
        if(_activeServerTab == serverGUI.button_fav && !isFavoriteServer(message.serverId)) return;

        appendServerRow(message);
        _srvList.sort(sortFunc);
});

function srvListMouseClick(self, buttn){
	if(!serverCollection.getVisible()) return;

	switch(self){
                case serverGUI.button_all:
                case serverGUI.button_fav:
                        clearServerList();
                        _activeServerTab = self;
                        updateServerListHeaderState();
                        requestServerList();
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
                                local nowFavorite = toggleFavoriteServer(_serverId);

                                if(_activeServerTab == serverGUI.button_fav && !nowFavorite){
                                        _srvList.removeRow(self.getDataCell().parent.id);
                                        updateScrollBounds();
                                        _srvList.sort(sortFunc);
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
			self.label.setColor({r = 0, g = 255, b = 0});
		break;

		case srvType:
		case srvName:
		case srvMap:
		case srvPlayers:
		case srvBots:
			self.label.setColor({r = 255, g = 255, b = 0});
		break;
	}

	if(self instanceof GUI.GridListVisibleCell){
		local visibleRow = self.parent
		if (visibleRow.parent != _srvList) return;

		foreach (cell in visibleRow.cells)
			cell.label.setColor({r = 0, g = 255, b = 0})
	}
}

function srvListMouseOut(self){
	if(!serverCollection.getVisible()) return;

	switch(self){
		case serverGUI.button_all:
		case serverGUI.button_fav:
			self.label.setColor({r = 255, g = 255, b = 255});
		break;

		case srvType:
		case srvName:
		case srvMap:
		case srvPlayers:
		case srvBots:
			self.label.setColor({r = 255, g = 255, b = 255});
		break;
	}

	if(self instanceof GUI.GridListVisibleCell){
		local visibleRow = self.parent
		if (visibleRow.parent != _srvList) return;

		foreach (cell in visibleRow.cells)
			cell.label.setColor({r = 255, g = 255, b = 255})
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