Players <- {};
for(local i = 0; i < getMaxSlots(); ++i){
  Players[i] <- {};
  Players[i].klasa <- 0;
  Players[i].logged <- 0;
}

addEventHandler("onPacket", function(player, packet){
  local packet_id = packet.readUInt8();
  if(packet_id == packets.select_class){
    local cid = packet.readUInt8();
    classes[cid].func(player);
    Players[player].klasa = cid;

    packet.reset();
    packet.writeUInt8(packets.change_class);
    packet.writeUInt8(player);
    packet.writeUInt8(cid);
      for(local i = 0; i < getMaxSlots(); ++i)
        if(isPlayerConnected(i))
          packet.send(i, UNRELIABLE);
  }else if(packet_id == packets.visual){
    local vis1 = packet.readString();
    local vis2 = packet.readUInt8();
    local vis3 = packet.readString();
    local vis4 = packet.readUInt8();
    setPlayerVisual(player, vis1, vis2, vis3, vis4);
  }else if(packet_id == packets.selected_class){
    sendMessageToPlayer(player, 200, 200, 200, LOGIN_MESSAGE);
        spawnPlayer(player);
        Players[player].logged = 1;
  }
});

addEventHandler("onInit", function(){
  local myfile = io.file("database/time.log", "r");
  if(myfile.isOpen){
   local _hour = myfile.read(io_type.LINE).tointeger();
   local _min = myfile.read(io_type.LINE).tointeger();
   setTime(_hour, _min);

   myfile.close();
  }

  setTimer(function(){
    setTime(0, 0);
  }, 5000, 0);
});

addEventHandler("onPlayerJoin", function(player){
  packet.reset();
  packet.writeUInt8(packets.player_info);
  packet.writeString(getPlayerSerial(player));
  packet.writeString(getPlayerIP(player));
  packet.writeString(getPlayerMacAddr(player));
  packet.send(player, RELIABLE);
});

addEventHandler("onPlayerRespawn", function(player){
  if(Players[player].logged == 1){
    spawnPlayer(player);
    local cid = Players[player].klasa;
    local spawnclass = classes[cid].spawn;
      classes[cid].func(player);
      setPlayerPosition(player, spawnclass.x, spawnclass.y, spawnclass.z);
  }
});

addEventHandler("onExit", function(){
	local myfile = io.file("database/time.log", "w");
	if(myfile.isOpen){
	 myfile.write(getTime().hour + "\n");
	 myfile.write(getTime().min + "\n");

	 myfile.close();
	}
});
