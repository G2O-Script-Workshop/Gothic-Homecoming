local window = GUI.Window(2400, 2500, 3500, 3500, "LOG_BACK.TGA"); //bg
local logo = GUI.Draw(1700, 300, GUI_LOGO, window); //logo
  logo.setFont("FONT_OLD_20_WHITE_HI.TGA");
  logo.setColor(230,180,55);
GUI.Texture(1390, 800, 1950, 2300, "LETTERS.TGA", window); //bg2
GUI.Texture(50, 2300, 1210, 1100, "MAP_NEWWORLD_SEAMAP.TGA", window); //map
local czasgra = GUI.Draw(225, 300, GUI_GTIME + getTime().hour + ":" + getTime().min, window); //czasgra
local czasreal = GUI.Draw(225, 550, GUI_RTIME + date().hour + ":" + date().min, window); //czasreal
  czasgra.setColor(200,180,140);
  czasreal.setColor(200,180,140);
local login = GUI.Button(410, 1050, 540, 300, "", GUI_LOGIN, window); //login
local exit = GUI.Button(390, 1800, 535, 470, "", GUI_EXIT, window); //exit

local textLog = GUI.Draw(2140,1100,GUI_TEXTLOG,window);
local textPas = GUI.Draw(2125,1900,GUI_TEXTPAS,window);
textLog.setFont("FONT_20_BOOK_HI.TGA");
textPas.setFont("FONT_20_BOOK_HI.TGA");
local inpLog = GUI.Input(1640,1400,1455,355,"INV_SLOT_FOCUS.TGA","FONT_DEFAULT.TGA", Input.Text, Align.Center, "...", 6, window);
local inpPas = GUI.Input(1640,2200,1455,355,"INV_SLOT_FOCUS.TGA","FONT_DEFAULT.TGA", Input.Password, Align.Center, "...", 2, window);
inpLog.maxLetters = 20;
inpPas.maxLetters = 20;

local loginbad = GUI.Draw(2140,1100,LOGIN_FAIL);

// ================================================================================================= //

addEventHandler("onInit", function(){
  enableEvent_Render(true);
  enableHud(HUD_HEALTH_BAR,false);
  Camera.enableMovement(false);
  Camera.setPosition(-14096.3,2758.05,-30978.6);
  Camera.setRotation(0, 64, 0);
  openLOGIN();

  inpPas.setDisabled(false);
  inpPas.setVisible(true);
});

function openLOGIN(){setFreeze(true);window.setVisible(true);setCursorVisible(true);}
function closeLOGIN(){setFreeze(false);window.setVisible(false);loginbad.setVisible(false);setCursorVisible(false);enableHud(HUD_HEALTH_BAR,true);Camera.enableMovement(true);}

// ================================================================================================= //

addEventHandler("GUI.onClick", function(self){
  switch (self)
  {
    case login:
      packet.reset();
      packet.writeUInt8(packets.checklog);
      packet.writeString(inpLog.getText());
      packet.writeString(md5(inpPas.getText()));
      packet.send(RELIABLE);
    break

    case exit:
      closeLOGIN();
      exitGame();
    break
  }
});

addEventHandler("GUI.onMouseIn", function(node){
if(node instanceof GUI.Button && window.visible)
  node.draw.setColor(240, 60, 60);
});

addEventHandler("GUI.onMouseOut", function(node){
if(node instanceof GUI.Button && window.visible)
  node.draw.setColor(255, 255, 255);
});

addEventHandler("onPacket", function(packet){
  local packetId = packet.readUInt8();
  if(packetId == packets.logfail) {
    loginbad.setVisible(true);
  }
});
