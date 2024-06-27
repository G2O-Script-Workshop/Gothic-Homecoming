addEventHandler("onPlayerJoin", function(pid){
  if(getPlayerName(pid) == "Nickname"){
    kick(pid, LOGIN_KICK);
  } else
    sendMessageToAll(128, 128, 128, getPlayerName(pid) + LOGIN_JOIN);
});

addEventHandler("onPlayerDisconnect", function(pid, reason){
  if(Players[pid].logged == 1){
    sendMessageToAll(128, 128, 128, getPlayerName(pid) + LOGIN_LEAVE);
    SavePlayer(pid, login, password);
    SavePlayerLogg(pid);
  }
});

function LoadPlayer(pid, login, password)
{
    local myfile = io.file("database/players/" + login + "_data.txt", "r");
    if (myfile.isOpen)
    {
      local password = myfile.read(io_type.LINE);
      local pclass = myfile.read(io_type.LINE).tointeger();
      if(pclass){
        classes[pclass].func(pid);
        Players[pid].klasa = pclass;
          packet.reset();
          packet.writeUInt8(packets.change_class);
          packet.writeUInt8(pid);
          packet.writeUInt8(pclass);
            for(local i = 0; i < getMaxSlots(); ++i)
            if(isPlayerConnected(i))
              packet.send(i, UNRELIABLE);
      }
      local vis = sscanf("sdsd", myfile.read(io_type.LINE));
      if(vis){
        setPlayerVisual(pid, vis[0], vis[1], vis[2], vis[3]);
      }
      local pscale = sscanf("ffff", myfile.read(io_type.LINE));
      if(pscale){
        setPlayerScale(pid, pscale[0], pscale[1], pscale[2]);
        setPlayerFatness(pid, pscale[3]);
      }
      local pos = sscanf("ffff", myfile.read(io_type.LINE));
      if(pos){
        setPlayerPosition(pid, pos[0], pos[1], pos[2]);
        setPlayerAngle(pid, pos[3]);
      }
      myfile.close();
      return true;
    }
    else
			print(myfile.errorMsg);
      return false;
};

function SavePlayer(pid, login, password)
{
    local myfile = io.file("database/players/" + login + "_data.txt", "w");
    if (myfile.isOpen)
    {
        myfile.write(password + "\n");
      local pclass = Players[pid].klasa;
        myfile.write(pclass + "\n");
      local vis = getPlayerVisual(pid);
        myfile.write(vis.bodyModel + " " + vis.bodyTxt + " " + vis.headModel + " " + vis.headTxt + "\n");
      local pscale = getPlayerScale(pid);
      local pfat = getPlayerFatness(pid);
        myfile.write(pscale.x + " " + pscale.y + " " + pscale.z + " " + pfat + "\n");
      local pos = getPlayerPosition(pid);
      local posa = getPlayerAngle(pid)
        myfile.write(pos.x + " " + pos.y + " " + pos.z + " " + posa + "\n");
      myfile.close();
    }
    else
			print(myfile.errorMsg);
};

function SavePlayerLogg(pid)
{
    local myfile = io.file("database/players/" + getPlayerName(pid) + "_logg.txt", "a+");
    if (myfile.isOpen)
    {
	  local datas = date().day + "/" + date().month + " " + date().hour + ":" + date().min;
      myfile.write(datas + " || " + getPlayerSerial(pid) + " | " + getPlayerIP(pid) + " | " + getPlayerMacAddr(pid) + "\n");
      myfile.close();
    }
    else
			print(myfile.errorMsg);
};

addEventHandler("onPacket", function(player, packet){
  local packet_id = packet.readUInt8();
  if(packet_id == packets.checklog) {
    local _login = packet.readString(), _password = packet.readString();
    if(!LoadPlayer(player, _login, _password)) {
      packet.reset();
      packet.writeUInt8(packets.first_join);
      packet.send(player, RELIABLE);
        setPlayerName(player, _login);
    }
    else {
      local checkpass = io.file("database/players/" + login + "_data.txt", "r");
      if (checkpass.isOpen)
      {
        local password = checkpass.read(io_type.LINE);
        if(_login == getPlayerName(player) && _password == password) {
          sendMessageToPlayer(player, 200, 200, 200, LOGIN_MESSAGE);
            spawnPlayer(player);
            LoadPlayer(player, _login, _password);
            Players[player].logged = 1;
          packet.reset();
          packet.writeUInt8(packets.next_join);
          packet.send(player, RELIABLE);
        }
        else {
          packet.reset();
          packet.writeUInt8(packets.logfail);
          packet.send(player, RELIABLE);
      checkpass.close();
        }
      }
    }
  }
});
