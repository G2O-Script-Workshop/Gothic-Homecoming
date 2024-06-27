local windowM = GUI.Window(2400, 2500, 3500, 3500, "LOG_BACK.TGA"); //bg
local logo = GUI.Draw(1650, 300, GUI_LOGO, windowM); //logo
  logo.setFont("FONT_OLD_20_WHITE_HI.TGA");
  logo.setColor(230,180,55);
GUI.Texture(1390, 800, 1950, 2300, "LETTERS.TGA", windowM); //bg2
GUI.Texture(50, 2300, 1210, 1100, "Map_DragonIsland.TGA", windowM); //map
local czasgra = GUI.Draw(225, 300, "Czas gry " + getTime().hour + ":" + getTime().min, windowM); //czasgra
local czasreal = GUI.Draw(225, 550, "Czas realny " + date().hour + ":" + date().min, windowM); //czasreal
  czasgra.setColor(200,180,140);
  czasreal.setColor(200,180,140);
local charaB = GUI.Button(420, 1050, 540, 300, "", GUI_CHARA, windowM); //login
local exit = GUI.Button(390, 1800, 535, 470, "", "Wyjœcie", windowM); //exit

packet <- null;
addEventHandler("onInit", function(){packet <- Packet();enableEvent_Render(true);});

function openMENU(){setFreeze(true);windowM.setVisible(true);setCursorVisible(true);Camera.enableMovement(false);}
function closeMENU(){setFreeze(false);windowM.setVisible(false);/*chara.setVisible(false);options.setVisible(false);*/setCursorVisible(false);Camera.enableMovement(true);}

addEventHandler("GUI.onClick", function(self){
  switch (self)
  {

    case exit:
      closeMENU();
      exitGame();
    break
    }
});

addEventHandler("GUI.onMouseIn", function(node){
  if(node instanceof GUI.Button){
    if(windowM.visible)
      node.draw.setColor(60, 60, 180);
    /*else if(options.visible || chara.visible)
      node.draw.setColor(60, 180, 60);*/
  }
});

addEventHandler("GUI.onMouseOut", function(node){
  if(node instanceof GUI.Button){
    if(windowM.visible)
      node.draw.setColor(255, 255, 255);
  }
});

addEventHandler("onKey", function(key){
  if(key == KEY_ESCAPE){
    if(windowM.visible){
      openMENU();
    }else{
      closeMENU();
    }
  }
});
