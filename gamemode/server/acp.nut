local Player = [];
for (local i = 0; i < getMaxSlots(); ++i)
	Player.push({rank = 0});

enum LEVEL {
	DOWO = 1,
	MOD = 2,
	ADMIN = 3,
}

local ADMIN_SERIAL = [
	"60c5ac7101bcb18ad14d6f90de0838814bd261a" // Arkhan
];

local MOD_SERIAL = [
	"62da690db19419764be78ac7e3414b00eeb7acd" // Sett
];

local DOWO_SERIAL = [
	//"d78bf213615ff3bd3bb1b4187593f1936d6d73f" // Arkhan
];

local function isPlayerLogged(pid){
	if(Players[pid].logged == 1)
		return true;
	else
		return false;
}

function checkPermission (pid, level){
	if (Player[pid].rank >= level)
		return true;
}

local function cmd_error(pid, id){
	if (!isPlayerLogged(id))
	{
		sendMessageToPlayer(pid, 255, 0, 0, ACP_ERROR);
		return;
	}
}

local cmd_acp = function(pid, params){
	if (!checkPermission(pid, LEVEL.MOD)) return;
		sendMessageToPlayer(pid, 0, 255, 0, ACP_HELP);
}

local cmd_color = function(pid, params){
	if (!checkPermission(pid, LEVEL.MOD)) return;

	local args = sscanf("dddd", params);
	if (!args)
	{
		sendMessageToPlayer(pid, 255, 0, 0, ACP_PARCOLOR);
		return;
	}

	local id = args[0];
	local r = args[1];
	local g = args[2];
	local b = args[3];

	cmd_error(pid, id);
	setPlayerColor(id, r, g, b);

	sendMessageToPlayer(pid, 0, 255, 0, ACP_MSGCOLOR + getPlayerName(id) + " (" + r + "," + g + "," + b + ")");
}

local cmd_name = function(pid, params){
	if (!checkPermission(pid, LEVEL.DOWO)) return;

	local args = sscanf("ds", params);
	if (!args)
	{
		sendMessageToPlayer(pid, 255, 0, 0, ACP_PARNAME);
		return;
	}

	local id = args[0];
	local name = args[1];

	cmd_error(pid, id);
	setPlayerName(id, name);

	sendMessageToPlayer(pid, 0, 255, 0, ACP_MSGNAME + getPlayerName(id) + " (" + name + ")");
}

local cmd_kick = function(pid, params){
	if (!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("ds", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARKICK);
			return;
		}

		local id = args[0];
		local reason = args[1];

		cmd_error(pid, id);
		kick(id, reason);

		sendMessageToAll(255, 0, 0, ACP_MSGKICK + getPlayerName(id) + " - " + reason);
}

local cmd_kickall = function(pid, params){
	if (!checkPermission(pid, LEVEL.ADMIN)) return;

		local args = sscanf("s", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARKICKALL);
			return;
		}

		local reason = args[0];

		for(local i = 0; i < getMaxSlots(); ++i){
			kick(i, reason);
		}
}

local cmd_ban = function(pid, params){
	if (!checkPermission(pid, LEVEL.ADMIN)) return;

		local args = sscanf("dds", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARBAN);
			return;
		}

		local id = args[0];
		local minutes = args[1];
		local reason = args[2];

		cmd_error(pid, id);
		ban(id, minutes, reason);

		sendMessageToAll(255, 0, 0, ACP_MSGBAN + getPlayerName(id) + " - " + reason);
}

local cmd_tp = function(pid, params){
  if (!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dd", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARTP);
			return;
		}

		local from_id = args[0];
		local to_id = args[1];

		if (!isPlayerLogged(from_id) || !isPlayerLogged(to_id))
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_ERROR);
			return;
		}

		if (from_id == to_id)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_ERRORTP);
			return;
		}

		local world = getPlayerWorld(to_id);
		if (world != getPlayerWorld(from_id))
			setPlayerWorld(from_id, world);

		local pos = getPlayerPosition(to_id);
		setPlayerPosition(from_id, pos.x + 10, pos.y + 2, pos.z + 10);

		sendMessageToPlayer(pid, 0, 255, 0, ACP_MSGTP + getPlayerName(from_id) + " > " + getPlayerName(to_id));
}

local cmd_tpall = function(pid, params){
  if (!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("d", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARTPALL);
			return;
		}

		local id = args[0];

		cmd_error(pid, id);

		for(local i = 0; i < getMaxSlots(); ++i){
			local world = getPlayerWorld(id);
			if (world != getPlayerWorld(i))
				setPlayerWorld(i, world);

			local pos = getPlayerPosition(id);
			setPlayerPosition(i, pos.x + 10, pos.y + 2, pos.z + 10);
		}
			sendMessageToAll(0, 255, 0, ACP_MSGTPALL + getPlayerName(id));
}

local cmd_giveitem = function(pid, params){
  if (!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dsd", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARGIVE);
			return;
		}

		local id = args[0];
		local instance = args[1].toupper();
		local amount = args[2];

		cmd_error(pid, id);
		if (amount < 1) amount = 1;
		giveItem(id, Items.id(instance), amount);

		sendMessageToPlayer(id, 0, 255, 0, ACP_MSGGIVE + getPlayerName(pid) + "(" + instance + " x" + amount + ")");
}

local cmd_time = function(pid, params){
  if (!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dd", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARTIME);
			return;
		}

		local hour = args[0];
		local min = args[1];

		if (hour > 23) hour = 23;
		else if (hour < 0) hour = 0;

		if (min > 59) min = 59;
		else if (min < 0) min = 0;

		setTime(hour, min);
		sendMessageToAll(0, 255, 0, ACP_MSGTIME + getPlayerName(pid) + " (" + hour + ":" + min + ")");
}

local cmd_scale = function(pid, params){
  if (!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dfff", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARSCALE);
			return;
		}

		local id = args[0];
		local x = args[1];
		local y = args[2];
		local z = args[3];

		cmd_error(pid, id);
		setPlayerScale(id, x, y, z);

		sendMessageToPlayer(pid, 0, 255, 0, ACP_MSGSCALE + getPlayerName(id) + " (" + x + " " + y + " " + z + ")");
}

local cmd_pos = function(pid, params){
  if (!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("s", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARPOS);
			return;
		}

		local nazwa = args[0];

		local vec = getPlayerPosition(pid);
		local angle = getPlayerAngle(pid);

		sendMessageToPlayer(pid, 0, 255, 0, ACP_MSGPOS + nazwa);
}

local cmd_promotion = function(pid, params){
  if (!checkPermission(pid, LEVEL.DOWO)) return;

		local args = sscanf("dd", params);
		if (!args)
		{
			sendMessageToPlayer(pid, 255, 0, 0, ACP_PARPROMO);
			return;
		}

		local id = args[0];
		local cid = args[1];

		cmd_error(pid, id);

		local cid_old = Players[id].klasa;
		local klasa_old = classes[cid_old].name;
		local klasa = classes[cid].name;

		classes[cid].func(id);
		Players[id].klasa = cid;

		sendMessageToPlayer(pid, 0, 255, 0, ACP_MSGPROMO + getPlayerName(pid) + "(" + klasa + ")");

		packet.reset();
    packet.writeUInt8(packets.change_class);
    packet.writeUInt8(id);
    packet.writeUInt8(cid);
      for(local i = 0; i < getMaxSlots(); ++i){
				if(isPlayerConnected(i))
          packet.send(i, UNRELIABLE);
			}
}

local cmd_classlist = function(pid){
	if (!checkPermission(pid, LEVEL.DOWO)) return;

	sendMessageToPlayer(pid, 0, 255, 0, "-=========== KLASY ===========-");
		foreach (id, klasa in classes){
			//for(local id = 0; id < classes.len(); ++id)
				sendMessageToPlayer(pid, 0, 255, 0, "(" + id + ") " + klasa.name);
		}
	sendMessageToPlayer(pid, 0, 255, 0, "-=========== KLASY ===========-");
}

local cmd_glob = function(pid, params){
	if (!checkPermission(pid, LEVEL.DOWO)) return;

	sendMessageToAll(0, 200, 225, "(" + getPlayerName(pid) + ": " + params + ")");
}

local cmd_post = function(pid, params){
	if (!checkPermission(pid, LEVEL.DOWO)) return;

	sendMessageToAll(205, 133, 63, "#" + params + "#");
}

local cmd_gpw = function(pid, params){
	if (!checkPermission(pid, LEVEL.DOWO)) return;

	local gildia = classes[pid].guild;

	for(local i = 0; i < getPlayersCount(); ++i){
		if(classes[i].guild == gildia){
			sendMessageToPlayer(i, 144, 86, 255, "(GILDIA) (" + getPlayerName(pid) + ": " + params + ")");
		}
	}
}

local cmd_apw = function(pid, params){
	for(local i = 0; i < getMaxSlots(); ++i){
		if(checkPermission(i, LEVEL.MOD)){
			sendMessageToPlayer(i, 255, 86, 144, "(APW) (" + getPlayerName(pid) + "|"+pid+"): " + params);
		}
	}
}

local playerJoin = function(pid){
	local playerSerial = getPlayerSerial(pid);

	foreach (serial in ADMIN_SERIAL)
	{
		if (serial == playerSerial)
		{
			Player[pid].rank = LEVEL.ADMIN;
			setPlayerColor(pid, 255, 0, 0);
			return;
		}
	}
	foreach (serial in MOD_SERIAL)
	{
		if (serial == playerSerial)
		{
			Player[pid].rank = LEVEL.MOD;
			setPlayerColor(pid, 0, 255, 0);
			return;
		}
	}
	foreach (serial in DOWO_SERIAL)
	{
		if (serial == playerSerial)
		{
			Player[pid].rank = LEVEL.DOWO;
			setPlayerColor(pid, 0, 0, 255);
			return;
		}
	}
}addEventHandler("onPlayerJoin", playerJoin);

local playerDisconnect = function(pid, reason){
	Player[pid].rank = 0;
}addEventHandler("onPlayerDisconnect", playerDisconnect);

addEventHandler("onPlayerCommand", function(pid, cmd, params){
  cmd = cmd.tolower();
  if(cmd == "acp"){
    cmd_acp(pid, params);
  }
  else if(cmd == "color"){
    cmd_color(pid, params)
  }
  else if(cmd == "name" || cmd == "nick"){
    cmd_name(pid, params)
  }
  else if(cmd == "kick"){
    cmd_kick(pid, params)
  }
	else if(cmd == "kickall"){
    cmd_kickall(pid, params)
  }
  else if(cmd == "ban"){
    cmd_ban(pid, params)
  }
  else if(cmd == "tp"){
    cmd_tp(pid, params)
  }
	else if(cmd == "tpall"){
    cmd_tpall(pid, params)
  }
  else if(cmd == "giveitem" || cmd == "give" || cmd == "item"){
    cmd_giveitem(pid, params)
  }
  else if(cmd == "time"){
    cmd_time(pid, params)
  }
  else if(cmd == "scale"){
    cmd_scale(pid, params)
  }
  else if(cmd == "pos"){
    cmd_pos(pid, params)
  }
	else if(cmd == "awans" || cmd == "promote" || cmd == "promo" || cmd == "awansuj"){
    cmd_promotion(pid, params)
  }
	else if(cmd == "klasy" || cmd == "listaklas"){
    cmd_classlist(pid)
  }
  else if(cmd == "g" || cmd == "global" || cmd == "gooc"){
    cmd_glob(pid, params)
  }
  else if(cmd == "p" || cmd == "post" || cmd == "gdo"){
    cmd_post(pid, params)
  }
	else if(cmd == "apw" || cmd == "apm" || cmd == "report"){
		cmd_apw(pid, params)
	}
	else if(cmd == "gpw" || cmd == "gmsg" || cmd == "gildia"){
		cmd_gpw(pid, params)
	}
	else if(cmd == "exit" || cmd == "q" || cmd == "quit"){
		kick(pid, EXIT_KICK);
	}
});
