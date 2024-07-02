creatorCollection <- GUI.Collection({
	positionPx = {x = 0, y = 0}
});
local creatorGUI = {
	visBG = GUI.Texture({
		positionPx = {x = nax(300), y = nay(2085)}
		sizePx = {width = nax(3000), height = nay(4020)}
		file = "MENU_INGAME.TGA"
		scaling = true
		collection = creatorCollection
	}),

	facesScroll = GUI.ScrollBar({
		positionPx = {x = nax(1000), y = nay(2580)}
		sizePx = {width = nax(85), height = nay(3185)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Vertical
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),
	bodiesScroll = GUI.ScrollBar({
		positionPx = {x = nax(1600), y = nay(2580)}
		sizePx = {width = nax(85), height = nay(3185)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Vertical
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),

	bodyM = GUI.Draw({
		positionPx = {x = nax(2350), y = nay(2805)}
		text = "Gender"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	}),
	bodyMScroll = GUI.ScrollBar({
		positionPx = {x = nax(2110), y = nay(2960)}
		sizePx = {width = nax(810), height = nay(115)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Horizontal
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),
	headM = GUI.Draw({
		positionPx = {x = nax(2220), y = nay(3185)}
		text = "Head Model"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	}),
	headMScroll = GUI.ScrollBar({
		positionPx = {x = nax(2110), y = nay(3415)}
		sizePx = {width = nax(810), height = nay(115)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Horizontal
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),
	bodyT = GUI.Draw({
		positionPx = {x = nax(2390), y = nay(3565)}
		text = "Race"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	}),
	bodyTScroll = GUI.ScrollBar({
		positionPx = {x = nax(2110), y = nay(3755)}
		sizePx = {width = nax(810), height = nay(115)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Horizontal
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),
	fat = GUI.Draw({
		positionPx = {x = nax(2305), y = nay(3945)}
		text = "Fatness"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	}),
	fatScroll = GUI.ScrollBar({
		positionPx = {x = nax(2110), y = nay(4135)}
		sizePx = {width = nax(810), height = nay(115)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Horizontal
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),
	height = GUI.Draw({
		positionPx = {x = nax(2350), y = nay(4325)}
		text = "Height"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	}),
	heightScroll = GUI.ScrollBar({
		positionPx = {x = nax(2110), y = nay(4550)}
		sizePx = {width = nax(810), height = nay(115)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Horizontal
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),
	walk = GUI.Draw({
		positionPx = {x = nax(1960), y = nay(4700)}
		text = "Walking Style: Default"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	}),
	walkScroll = GUI.ScrollBar({
		positionPx = {x = nax(2110), y = nay(4930)}
		sizePx = {width = nax(810), height = nay(115)}
		range = {
			file = "MENU_SLIDER_BACK.TGA"
			indicator = {file = "MENU_SLIDER_POS.TGA"}
			orientation = Orientation.Horizontal
		}
		increaseButton = {file = ""}
		decreaseButton = {file = ""}
		collection = creatorCollection
	}),

	charaName = GUI.Input({
		positionPx = {x = nax(5290), y = nay(4855)}
		sizePx = {width = nax(2200), height = nay(265)}
		file = "DLG_CONVERSATION.TGA"
		font = "FONT_OLD_10_WHITE.TGA"
		align = Align.Center
		maxLetters = 32
		placeholder = "Character's Name"
		paddingPx = 4
		collection = creatorCollection
	}),

	btnFinish = GUI.Button({
		positionPx = {x = nax(5290), y = nay(5615)}
		sizePx = {width = nax(2200), height = nay(265)}
		file = "INV_SLOT_FOCUS.TGA"
		draw = {text = "Save Character"}
		collection = creatorCollection
	}),
	btnBack = GUI.Button({
		positionPx = {x = nax(5290), y = nay(5880)}
		sizePx = {width = nax(2200), height = nay(265)}
		file = "INV_SLOT_FOCUS.TGA"
		draw = {text = "Main Menu"}
		collection = creatorCollection
	}),
	fail = GUI.Draw({
		positionPx = {x = nax(5450), y = nay(6245)}
		text = "Character Name can't be empty!"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	})
};

function toggleCreator(toggle){
	creatorCollection.setVisible(toggle);

	local xardasWaypoint = {
		x = 29628.5
		y = 5198.25
		z = -15176.8
		a = 213.44
	}

	if(toggle == true){
			local playerPos = getPlayerPosition(heroId);
			local playerAngle = getPlayerAngle(heroId);

			local forwardVector = Vec3(
				sin(playerAngle * 3.14 / 180.0),
				0,
				cos(playerAngle * 3.14 / 180.0)
			);

			local rightVector = Vec3(
				cos(playerAngle * 3.14 / 180.0),
				0,
				-sin(playerAngle * 3.14 / 180.0)
			);

			local xOffset = 100.0;
			local zOffset = 100.0;

			local initialCameraPos = Vec3(
				playerPos.x + (forwardVector.x * 180),
				xardasWaypoint.y,
				playerPos.z + (forwardVector.z * 180)
			);

			local targetCameraPos = Vec3(
				initialCameraPos.x + xOffset * rightVector.x,
				initialCameraPos.y,
				initialCameraPos.z + zOffset * rightVector.z
			);

			Camera.setRotation(0, playerAngle - 155, 0);
			Camera.setPosition(targetCameraPos.x, targetCameraPos.y + 80, targetCameraPos.z);

			setPlayerAngle(heroId, xardasWaypoint.a + 30);

				if(LocalStorage.len() <= 0){
					updateCreatorTextures(0, 0, 0, 2);
				} else {
					local localVisVal = LocalStorage.getItem("visValue"); //[sex, race, bodyval, headval, faceval]
					if(localVisVal != null){
						updateCreatorTextures(localVisVal[0], localVisVal[1], 0, 2);

						creatorGUI.bodiesScroll.range.setValue(localVisVal[2]);
						creatorGUI.headMScroll.range.setValue(localVisVal[3]);
						creatorGUI.facesScroll.range.setValue(localVisVal[4]);
					}

					setPlayerVisual(heroId,
						LocalStorage.getItem("bodyModel"),
						LocalStorage.getItem("bodyTexture"),
						LocalStorage.getItem("headModel"),
						LocalStorage.getItem("headTexture")
						);

						local _fatness = LocalStorage.getItem("fatness")
					setPlayerFatness(heroId, _fatness);
					creatorGUI.fatScroll.range.setValue(_fatness);

						local _height = LocalStorage.getItem("height");
					setPlayerScale(heroId, _height, _height, _height);

					creatorGUI.charaName.setText(LocalStorage.getItem("characterName"));
				}
		//updateDiscordState("Creating a Character...");
	} else {
		setPlayerAngle(heroId, xardasWaypoint.a);
	}

	creatorGUI.fail.setVisible(false);
}

local facesTex = [];
for(local i = 0; i <= 5; i++){
	facesTex.push(GUI.Texture({
		positionPx = {x = nax(500), y = nay(2400+(i*600))}
		sizePx = {width = nax(500), height = nay(500)}
		file = ""
		scaling = true
		collection = creatorCollection
	}));
}
local facesScroll = creatorGUI.facesScroll.range;
facesScroll.setMinimum(0);
facesScroll.setMaximum(faces.len() - 1);

local bodiesTex = [];
for(local i = 0; i <= 5; i++){
	bodiesTex.push(GUI.Texture({
		positionPx = {x = nax(1100), y = nay(2400+(i*600))}
		sizePx = {width = nax(500), height = nay(500)}
		file = ""
		scaling = true
		collection = creatorCollection
	}));
}
local bodiesScroll = creatorGUI.bodiesScroll.range;
bodiesScroll.setMinimum(0);
bodiesScroll.setMaximum(bodies.len() - 1);

local bodyMScroll = creatorGUI.bodyMScroll.range;
bodyMScroll.setMinimum(0);
bodyMScroll.setMaximum(1);

local bodyTScroll = creatorGUI.bodyTScroll.range;
bodyTScroll.setMinimum(0);
bodyTScroll.setMaximum(3);

local headMScroll = creatorGUI.headMScroll.range;
headMScroll.setMinimum(0);
headMScroll.setMaximum(heads.len() - 1);

local fatScroll = creatorGUI.fatScroll.range;
fatScroll.setMinimum(-0.90);
fatScroll.setMaximum(2.00);
fatScroll.setValue(1.00);
fatScroll.setStep(0.10);

local heightScroll = creatorGUI.heightScroll.range;
heightScroll.setMinimum(0.75);
heightScroll.setMaximum(1.15);
heightScroll.setValue(1.00);
heightScroll.setStep(0.01);

local walkScroll = creatorGUI.walkScroll.range;
walkScroll.setMinimum(0);
walkScroll.setMaximum(walking.len() - 1);

local MALE = creator_gender.MALE;
local FEMALE = creator_gender.FEMALE;

local PALE = creator_race.PALE;
local WHITE = creator_race.WHITE;
local LATINO = creator_race.LATINO;
local BLACK = creator_race.BLACK;

local visSetting = {
	[MALE] = {
		[PALE] = ["HUM_BODY_NAKED0", 0, "HUM_HEAD_BALD", 19],
		[WHITE] = ["HUM_BODY_NAKED0", 1, "HUM_HEAD_BALD", 0],
		[LATINO] = ["HUM_BODY_NAKED0", 2, "HUM_HEAD_BALD", 8],
		[BLACK] = ["HUM_BODY_NAKED0", 3, "HUM_HEAD_BALD", 4]
	},
	[FEMALE] = {
		[PALE] = ["HUM_BODY_BABE0", 4, "HUM_HEAD_BABE", 151],
		[WHITE] = ["HUM_BODY_BABE0", 5, "HUM_HEAD_BABE", 137],
		[LATINO] = ["HUM_BODY_BABE0", 6, "HUM_HEAD_BABE", 141],
		[BLACK] = ["HUM_BODY_BABE0", 7, "HUM_HEAD_BABE", 142]
	}
};

local visValue = {
	[MALE] = {
		[PALE] = [0, 0, 0],
		[WHITE] = [0, 0, 0],
		[LATINO] = [0, 0, 0],
		[BLACK] = [0, 0, 0]
	},
	[FEMALE] = {
		[PALE] = [0, 0, 0],
		[WHITE] = [0, 0, 0],
		[LATINO] = [0, 0, 0],
		[BLACK] = [0, 0, 0]
	}
};

local walkvs = "HUMANS.MDS";

function updateCreatorTextures(sex, race, val, category){
	switch(category){
		case 0:
			for(local i = val, texture = 0; i < val + 6; ++i, ++texture){
				if(i in faces[sex][race]){
					facesTex[texture].setFile(faces[sex][race][i]);
				} else {
					facesTex[texture].setFile("");
				}
			}
		break;

		case 1:
			for(local i = val, texture = 0; i < val + 6; ++i, ++texture){
				if(i in bodies[sex][race]){
					bodiesTex[texture].setFile(bodies[sex][race][i]);
				} else {
					bodiesTex[texture].setFile("");
				}
			}
		break;

		case 2:
			for(local i = val, texture = 0; i < val + 6; ++i, ++texture){
				if(i in faces[sex][race]){
					facesTex[texture].setFile(faces[sex][race][i]);
				} else {
					facesTex[texture].setFile("");
				}
				if(i in bodies[sex][race]){
					bodiesTex[texture].setFile(bodies[sex][race][i]);
				} else {
					bodiesTex[texture].setFile("");
				}
			}
		break;
	}

	local vis = visSetting[sex][race];
		setPlayerVisual(heroId, vis[0], vis[1], vis[2], vis[3]);

	facesScroll.setMaximum(faces[sex][race].len()-6 < 0 ? 0 : faces[sex][race].len()-6);
	bodiesScroll.setMaximum(bodies[sex][race].len()-6 < 0 ? 0 : bodies[sex][race].len()-6);
	headMScroll.setMaximum(heads[sex].len() - 1);

	bodiesScroll.setValue(visValue[sex][race][0]);
	headMScroll.setValue(visValue[sex][race][1]);
	facesScroll.setValue(visValue[sex][race][2]);
}

addEventHandler("GUI.onChange", function(object){
	if(isCursorVisible() && creatorCollection.getVisible()){
		local sex = bodyMScroll.getValue().tointeger();
		local race = bodyTScroll.getValue().tointeger();
		local vis = visSetting[sex][race];
		local faceval = facesScroll.getValue();
		local bodyval = bodiesScroll.getValue();
		local headval = headMScroll.getValue();
		local fatness = fatScroll.getValue();
		local height = heightScroll.getValue();
		local walk = walkScroll.getValue();

		//visValue[sex][race] = [bodyval, headval, faceval];

		switch(object){
			case facesScroll:
				updateCreatorTextures(sex, race, faceval, 0);
				visValue[sex][race][2] = faceval;
			break;
			case bodiesScroll:
				vis[2] = heads[sex][headval];

				updateCreatorTextures(sex, race, bodyval, 1);
				visValue[sex][race][0] = bodyval;
			break;
			case bodyTScroll:
				updateCreatorTextures(sex, race, bodyval, 2);
				visValue[sex][race][1] = bodyval;
			break;
			case headMScroll:
				vis[2] = heads[sex][headval];
				setPlayerVisual(heroId, vis[0], vis[1], vis[2], vis[3]);

				visValue[sex][race][1] = headval;
			break;
			case bodyMScroll:
				vis[0] = body[sex];

				updateCreatorTextures(sex, race, bodyval, 2);
				visValue[sex][race][1] = bodyval;
			break;
			case fatScroll:
				setPlayerFatness(heroId, fatness);
			break;
			case heightScroll:
				setPlayerScale(heroId, height, height, height);
			break;
			case walkScroll:
				creatorGUI.walk.setText(format("Walking Style: %s", walking[walk].name));
				walkvs = walking[walk].style;
			break;
		}
		print(format("[visValue] \n sex: %d \n race: %d \n bodyval: %d \n headval: %d \n faceval: %d \n %s \n", sex, race, bodyval, headval, faceval, heads[sex][headval]));
	}
});

addEventHandler("GUI.onClick", function(self){
	if(isCursorVisible() && creatorCollection.getVisible()){
		local sex = bodyMScroll.getValue().tointeger();
		local race = bodyTScroll.getValue().tointeger();
		local vis = visSetting[sex][race];
		local _vis = visValue[sex][race];

		local index = 999;
		local findHead = "HUM_HEAD_V";
		local findBody = "HUM_BODY_NAKED_V";

		foreach(id, tex in facesTex){
			if(tex == self){
				local name = facesTex[id].getFile();
				do {
					index = name.find(findHead);

					if(index != null){
						name = name.slice(index + findHead.len());
					}
				} while(index != null);
				setPlayerVisual(heroId, vis[0], vis[1], vis[2], name.tointeger());
				vis[3] = name.tointeger();
			}
		}
		foreach(id, tex in bodiesTex){
			if(tex == self){
				local name = bodiesTex[id].getFile();
				do {
					index = name.find(findBody);

					if(index != null){
						name = name.slice(index + findBody.len());
					}
				} while(index != null);
				setPlayerVisual(heroId, vis[0], name.tointeger(), vis[2], vis[3]);
				vis[1] = name.tointeger();
			}
		}

		switch(self){
			case creatorGUI.btnBack:
				toggleCreator(false);
				launchMenuScene(true);
			break;
			case creatorGUI.btnFinish:
				if(creatorGUI.charaName.getText() != ""){
					/* local creatorFinish = PlayerCreatorMessage(heroId,
						creatorGUI.charaName.getText(),
						vis[0],
						vis[1],
						vis[2],
						vis[3],
						walkvs,
						heightScroll.getValue(),
						fatScroll.getValue()
						).serialize();
					creatorFinish.send(RELIABLE_ORDERED); */
						LocalStorage.setItem("characterName", creatorGUI.charaName.getText());
						LocalStorage.setItem("bodyModel", vis[0]);
						LocalStorage.setItem("bodyTexture", vis[1]);
						LocalStorage.setItem("headModel", vis[2]);
						LocalStorage.setItem("headTexture", vis[3]);
						LocalStorage.setItem("walkstyle", walkvs);
						LocalStorage.setItem("height", heightScroll.getValue());
						LocalStorage.setItem("fatness", fatScroll.getValue());
						LocalStorage.setItem("visValue", [sex, race, _vis[0], _vis[1], _vis[2]]);
					toggleCreator(false);
					launchMenuScene(true);
				} else {
					creatorGUI.fail.setVisible(true);
					setTimer(function(){
						creatorGUI.fail.setVisible(false);
					}, 5000, 1);
				}
			break;
		}
	}
});