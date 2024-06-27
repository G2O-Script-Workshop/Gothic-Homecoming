local CZAT_OOC = function(pid, params){
  local send = getPlayerPosition(pid);
  for(local i = 0; i < getMaxSlots(); ++i){
    if(isPlayerConnected(i)){
      local pos = getPlayerPosition(i);
      if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
        sendMessageToPlayer(i, 64, 178, 225, "(" + getPlayerName(pid) + " || " + pid + ") " + params);
      }
    }
  }
}

local CZAT_ME = function(pid, params){
  local send = getPlayerPosition(pid);
  for(local i = 0; i < getMaxSlots(); ++i){
    if(isPlayerConnected(i)){
      local pos = getPlayerPosition(i);
      if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
        sendMessageToPlayer(i, 232, 116, 8, "#" + getPlayerName(pid) + " " + params + "#");
      }
    }
  }
}

local CZAT_DO = function(pid, params){
  local send = getPlayerPosition(pid);
  for(local i = 0; i < getMaxSlots(); ++i){
    if(isPlayerConnected(i)){
      local pos = getPlayerPosition(i);
      if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
        sendMessageToPlayer(i, 32, 225, 127, "(" + getPlayerName(pid) + ") #" + params + "#");
      }
    }
  }
}

local CZAT_K = function(pid, params){
  local send = getPlayerPosition(pid);
  for(local i = 0; i < getMaxSlots(); ++i){
    if(isPlayerConnected(i)){
      local pos = getPlayerPosition(i);
      if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 2300){
        sendMessageToPlayer(i, 200, 32, 32, getPlayerName(pid) + CHAT_SCREAM + params);
      }else if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) >= 2301 && getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 3000){
        sendMessageToPlayer(i, 200, 32, 32, CHAT_DISTANCESCREAM + params);
      }
    }
  }
}

local CZAT_SZ = function(pid, params){
  local send = getPlayerPosition(pid);
  for(local i = 0; i < getMaxSlots(); ++i){
    if(isPlayerConnected(i)){
      local pos = getPlayerPosition(i);
      if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 500){
        sendMessageToPlayer(i, 200, 200, 200, getPlayerName(pid) + CHAT_WHISPER + params);
      }else if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) >= 501 && getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 700){
        sendMessageToPlayer(i, 200, 200, 200, CHAT_DISTANCEWHISPER + params);
      }
    }
  }
}

local CZAT_PW = function(pid, params){
  local par = sscanf("ds", params);
  if(par){
    if(isPlayerConnected(par[0])){
      sendMessageToPlayer(par[0], 244, 144, 24, "(PW) (" + getPlayerName(pid) + "|"+pid+") << " + par[1]);
      sendMessageToPlayer(pid, 224, 144, 64, "(PW) (" + getPlayerName(par[0]) + "|"+par[0]+") >> " + par[1]);
    }
  }
}

local CZAT_IC = function(pid, text){
  local send = getPlayerPosition(pid);
  for(local i = 0; i < getMaxSlots(); ++i){
    if(isPlayerConnected(i)){
      local pos = getPlayerPosition(i);
      if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1300){
        sendMessageToPlayer(i, 255, 255, 255, getPlayerName(pid) + CHAT_SPEAK + text);
      }else if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) >= 1301 && getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
        sendMessageToPlayer(i, 127, 127, 127, CHAT_DISTANCESPEAK + text);
      }
    }
  }
}

addEventHandler("onPlayerMessage", function(pid, text){
  strip(text);
    local msgType = text.slice(0, 1);
    local params = text.slice(1);
  if(msgType == "@"){
    CZAT_OOC(pid, params);
  }
  else if(msgType == "#"){
    CZAT_ME(pid, params);
  }
  else if(msgType == "."){
    CZAT_DO(pid, params);
  }
  else if(msgType == ","){
    CZAT_SZ(pid, params);
  }
  else if(msgType == "!"){
    CZAT_K(pid, params);
  }
  else if(msgType == "/"){
    sendMessageToPlayer(pid, 255, 0, 0, ACP_ERROR2);
  }
  else
    CZAT_IC(pid, text);
});

addEventHandler("onPlayerCommand", function(pid, cmd, params){
  cmd = cmd.tolower();
  if(cmd == "pw" || cmd == "pm"){
    CZAT_PW(pid, params);
  }
  else if(cmd == "ooc" || cmd == "b"){
    CZAT_OOC(pid, params);
  }
  else if(cmd == "me" || cmd == "ja"){
    CZAT_ME(pid, params);
  }
  else if(cmd == "do"){
    CZAT_DO(pid, params);
  }
  else if(cmd == "sz"){
    CZAT_SZ(pid, params);
  }
  else if(cmd == "k"){
    CZAT_K(pid, params);
  }
});
