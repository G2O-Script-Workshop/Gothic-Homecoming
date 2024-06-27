local isOpen = false;
local visual = {
  body = {
    model = ["HUM_BODY_BABE0", "HUM_BODY_NAKED0"],
    tex = 10
  },
  head = {
    model = ["HUM_HEAD_BALD","HUM_HEAD_FATBALD","HUM_HEAD_FIGHTER","HUM_HEAD_PONY","HUM_HEAD_PSIONIC","HUM_HEAD_THIEF", "HUM_HEAD_BABE", "HUM_HEAD_BABE1", "HUM_HEAD_BABE2", "HUM_HEAD_BABE3", "HUM_HEAD_BABE4", "HUM_HEAD_BABE5", "HUM_HEAD_BABE6", "HUM_HEAD_BABE7", "HUM_HEAD_BABE8", "HUM_HEAD_BABEHAIR"],
    tex = 162
  }
};
local mySetting = [
  1, 8, 3, 18 //body model, texture, head model, texture
];

local GUI = {
  Header = Draw(6390, 4750, VIS_HEADER),
  Head_Model = {
    Left = Texture(5750, 5350, 150, 150, "L.tga"),
    Right = Texture(7550, 5350, 150, 150, "R.tga"),
    Text = Draw(6000, 5250, VIS_HMODEL)
  },
  Head_Texture = {
    Left = Texture(5750, 5600, 150, 150, "L.tga"),
    Right = Texture(7550, 5600, 150, 150, "R.tga"),
    Text = Draw(6000, 5500, VIS_HTEX)
  },
  Body_Model = {
    Left = Texture(5750, 5850, 150, 150, "L.tga"),
    Right = Texture(7550, 5850, 150, 150, "R.tga"),
    Text = Draw(6000, 5750, VIS_BMODEL)
  },
  Body_Texture = {
    Left = Texture(5750, 6100, 150, 150, "L.tga"),
    Right = Texture(7550, 6100, 150, 150, "R.tga"),
    Text = Draw(6000, 6000, VIS_BTEX)
  },
  Exit = {
    Button = Texture(6000, 3250, 1500, 1500, "MENU_MASKE.tga"),
    Text = Draw(6390, 6350, VIS_EXIT)
  }
};

GUI.Header.font = "FONT_OLD_20_WHITE_HI.tga";
GUI.Head_Model.Text.font = "FONT_OLD_20_WHITE_HI.tga";
GUI.Head_Texture.Text.font = "FONT_OLD_20_WHITE_HI.tga";
GUI.Body_Model.Text.font = "FONT_OLD_20_WHITE_HI.tga";
GUI.Body_Texture.Text.font = "FONT_OLD_20_WHITE_HI.tga";
GUI.Exit.Text.font = "FONT_OLD_20_WHITE_HI.tga";

addEventHandler("onKey", function(key){
if(getPlayerInstance(heroId) == "PC_HERO"){
  if(key == KEY_F8){
    if(!isOpen){
      openVisualMenu();
    } else {
      closeVisualMenu();

	  packet.reset();
	  local vis = getPlayerVisual(heroId);
		packet.writeUInt8(packets.visual);
		packet.writeString(vis.bodyModel);
		packet.writeUInt8(vis.bodyTxt);
		packet.writeString(vis.headModel);
		packet.writeUInt8(vis.headTxt);
	  packet.send(RELIABLE);
    }
    setCursorVisible(isOpen);
  }
}
});

function openVisualMenu(){
  Camera.enableMovement(false);
  local pos = getPlayerPosition(heroId);
  local angle = getPlayerAngle(heroId);
  pos.x = pos.x + (sin(angle * 3.14 / 180.0) * 160);
	pos.z = pos.z + (cos(angle * 3.14 / 180.0) * 170);
  Camera.setPosition(pos.x, pos.y, pos.z);
  Camera.setRotation(0, angle - 180, 0);
  enableKeys(false);
  setFreeze(true);
  //playAni(heroId, "S_THRONE_S1");

  isOpen = true;

  GUI.Header.visible = true;

  GUI.Head_Model.Left.visible = true;
  GUI.Head_Model.Right.visible = true;
  GUI.Head_Model.Text.visible = true;

  GUI.Head_Texture.Left.visible = true;
  GUI.Head_Texture.Right.visible = true;
  GUI.Head_Texture.Text.visible = true;

  GUI.Body_Model.Left.visible = true;
  GUI.Body_Model.Right.visible = true;
  GUI.Body_Model.Text.visible = true;

  GUI.Body_Texture.Left.visible = true;
  GUI.Body_Texture.Right.visible = true;
  GUI.Body_Texture.Text.visible = true;

  GUI.Exit.Button.visible = true;
  //GUI.Exit.Text.visible = true;
}
function closeVisualMenu(){
  Camera.enableMovement(true);
  Camera.setTargetPlayer(heroId);
  enableKeys(true);
  setFreeze(false);
  playAni(heroId, "S_RUN");

  isOpen = false;

  GUI.Header.visible = false;

  GUI.Head_Model.Left.visible = false;
  GUI.Head_Model.Right.visible = false;
  GUI.Head_Model.Text.visible = false;

  GUI.Head_Texture.Left.visible = false;
  GUI.Head_Texture.Right.visible = false;
  GUI.Head_Texture.Text.visible = false;

  GUI.Body_Model.Left.visible = false;
  GUI.Body_Model.Right.visible = false;
  GUI.Body_Model.Text.visible = false;

  GUI.Body_Texture.Left.visible = false;
  GUI.Body_Texture.Right.visible = false;
  GUI.Body_Texture.Text.visible = false;

  GUI.Exit.Button.visible = false;
  GUI.Exit.Text.visible = false;
}

local isInside = function(x1, y1, x2, y2, w, h){
  if(x1 <= x2 + w && x1 >= x2 && y1 <= y2 + h && y1 >= y2)
    return true;
  else
    return false;
}
local changeValue = function(id, val){
  local value = mySetting[id];
  value += val;

  if(id == 0) {
    if(value > visual.body.model.len()) value = 0;
    else if(value < 0) value = visual.body.model.len() - 1;
  }
  else if(id == 1) {
    if(value > visual.body.tex) value = 0;
    else if(value < 0) value = visual.body.tex - 1;
  }
  else if(id == 2) {
    if(value > visual.head.model.len()) value = 0;
    else if(value < 0) value = visual.head.model.len() - 1;
  }
  else if(id == 3) {
    if(value > visual.head.tex) value = 0;
    else if(value < 0) value = visual.head.tex - 1;
  }

  mySetting[id] = value;
  setPlayerVisual(heroId, visual.body.model[mySetting[0]], mySetting[1], visual.head.model[mySetting[2]], mySetting[3]);
}

local checkBodyModel = function(x, y){
  local gui = GUI.Body_Model;

  local left_pos = gui.Left.getPosition();
  local left_size = gui.Left.getSize();
  if(isInside(x, y, left_pos.x, left_pos.y, left_size.width, left_size.height)){
    changeValue(0, -1);
    return;
  }
  local right_pos = gui.Right.getPosition();
  local right_size = gui.Right.getSize();
  if(isInside(x, y, right_pos.x, right_pos.y, right_size.width, right_size.height)){
    changeValue(0, 1);
    return;
  }
}
local checkBodyTex = function(x, y){
  local gui = GUI.Body_Texture;

  local left_pos = gui.Left.getPosition();
  local left_size = gui.Left.getSize();
  if(isInside(x, y, left_pos.x, left_pos.y, left_size.width, left_size.height)){
    changeValue(1, -1);
    return;
  }
  local right_pos = gui.Right.getPosition();
  local right_size = gui.Right.getSize();
  if(isInside(x, y, right_pos.x, right_pos.y, right_size.width, right_size.height)){
    changeValue(1, 1);
    return;
  }
}
local checkHeadModel = function(x, y){
  local gui = GUI.Head_Model;

  local left_pos = gui.Left.getPosition();
  local left_size = gui.Left.getSize();
  if(isInside(x, y, left_pos.x, left_pos.y, left_size.width, left_size.height)){
    changeValue(2, -1);
    return;
  }
  local right_pos = gui.Right.getPosition();
  local right_size = gui.Right.getSize();
  if(isInside(x, y, right_pos.x, right_pos.y, right_size.width, right_size.height)){
    changeValue(2, 1);
    return;
  }
}
local checkHeadTex = function(x, y){
  local gui = GUI.Head_Texture;

  local left_pos = gui.Left.getPosition();
  local left_size = gui.Left.getSize();
  if(isInside(x, y, left_pos.x, left_pos.y, left_size.width, left_size.height)){
    changeValue(3, -1);
    return;
  }
  local right_pos = gui.Right.getPosition();
  local right_size = gui.Right.getSize();
  if(isInside(x, y, right_pos.x, right_pos.y, right_size.width, right_size.height)){
    changeValue(3, 1);
    return;
  }
}

addEventHandler("onMouseClick", function(btn){
  if(isOpen){
    if(btn == MOUSE_LMB){
      local mouse = getCursorPosition();

      checkBodyModel(mouse.x, mouse.y);
      checkBodyTex(mouse.x, mouse.y);
      checkHeadModel(mouse.x, mouse.y);
      checkHeadTex(mouse.x, mouse.y);
    }
  }
});
