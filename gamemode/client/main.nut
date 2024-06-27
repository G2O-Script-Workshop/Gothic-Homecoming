addEvent("onChangeClass");

mySerial <- "";
myMac <- "";
myIp <- "";

local ui = {
  name = Draw(150, 150, "..."),
  guild = Draw(150, 325, "..."),
  description = Draw(150, 500, "..."),
  cselect = Draw(3000, 7600, MAIN_CSELECT)
};
ui.cselect.font = "FONT_OLD_20_WHITE_HI.tga";

local toggleUi = function(flag) {
  ui.name.visible = flag;
  ui.guild.visible = flag;
  ui.description.visible = flag;
  ui.cselect.visible = flag;

  setFreeze(flag);
  Camera.enableMovement(!flag);
}

local isSelectingClass = false;
local selectedClass = 0;
local updateClassInfo = function() {
  local info = classes[selectedClass];

  ui.name.text = info.name;
  ui.guild.text = info.guild;
  ui.description.text = info.description;

  clearInventory();
  setPlayerPosition(heroId, info.spawn[0], info.spawn[1], info.spawn[2]);
  setPlayerAngle(heroId, info.spawn[3]);

  local x = info.spawn[0] + 200.0 * sin((3.14 / 180) * info.spawn[3]);
  local z = info.spawn[2] + 200.0 * cos((3.14 / 180) * info.spawn[3]);
  Camera.setPosition(x, info.spawn[1] + 20, z);
  Camera.setRotation(0, info.spawn[3] + 180, 0);

  packet.reset();
  packet.writeUInt8(packets.select_class);
  packet.writeUInt8(selectedClass);
  packet.send(RELIABLE);
}

addEventHandler("onKey", function(key){
  if(isSelectingClass) {
    if(key == KEY_RETURN) {
      clearInventory();
      packet.reset();
      packet.writeUInt8(packets.select_class);
      packet.writeUInt8(selectedClass);
      packet.writeUInt8(packets.selected_class);
      packet.send(RELIABLE);

      // show chat
      toggleUi(false);
      isSelectingClass = false;
    }
    else if(key == KEY_A) {
      selectedClass -= 1;
      if(selectedClass < 0)
        selectedClass = classes.len() - 1;

      while("serial" in classes[selectedClass]) {
        if(classes[selectedClass].serial.find(mySerial) == null) {
          selectedClass -= 1;
          if(selectedClass < 0)
            selectedClass = classes.len() - 1;
        } else break;
      }

      updateClassInfo();
    }
    else if(key == KEY_D) {
      selectedClass += 1;
      if(selectedClass >= classes.len())
        selectedClass = 0;

      while("serial" in classes[selectedClass]) {
        if(classes[selectedClass].serial.find(mySerial) == null) {
          selectedClass += 1;
          if(selectedClass >= classes.len())
            selectedClass = 0;
        } else break;
      }

      updateClassInfo();
    }
  }
});

local sjoin = Sound("DIA_1013_BANDIT_AMBUSH_01_01.WAV");
local sjoin_human = Sound("DIA_ANDRE_JOIN_08_18.WAV");
local sjoin_orc = Sound("DIA_URSHAK_HALLO_18_00.WAV");

addEventHandler("onInit", function(){
  clearMultiplayerMessages();
  setKeyLayout(1);
  enableEvent_Render(true);

  disableKey(KEY_N, true);
  disableKey(KEY_L, true);
  disableKey(KEY_C, true);
  disableKey(KEY_ESCAPE, true);
});

addEventHandler("onPacket", function(packet){
  local packetId = packet.readUInt8();
  if(packetId == packets.player_info) {
    mySerial = packet.readString();
    myIp = packet.readString();
    myMac = packet.readString();
  }
  else if(packetId == packets.change_class) {
    callEvent("onChangeClass", packet.readUInt8(), packet.readUInt8());
  }
  else if(packetId == packets.first_join) {
    closeLOGIN();
    isSelectingClass = true;
    toggleUi(true);
    updateClassInfo();
    sjoin.play();
  }
  else if(packetId == packets.next_join) {
    if(getPlayerInstance(heroId) == "PC_HERO"){
      sjoin_human.play();
    }
    else if(getPlayerInstance(heroId) != "PC_HERO"){
      sjoin_orc.play();
    }
    closeLOGIN();
  }
});
