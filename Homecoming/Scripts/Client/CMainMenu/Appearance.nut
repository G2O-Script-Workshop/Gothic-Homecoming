creatorCollection <- GUI.Collection({
        positionPx = {x = 0, y = 0}
});

const TEXTURE_SLOTS_VISIBLE = 6;

function clampInteger(value, minimum, maximum){
        if(value < minimum){
                return minimum;
        }

        if(value > maximum){
                return maximum;
        }

        return value;
}

function coerceInteger(value, defaultValue = 0){
        if(value == null){
                return defaultValue;
        }

        switch(typeof value){
                case "integer":
                        return value;
                case "float":
                case "string":
                        return value.tointeger();
        }

        return defaultValue;
}

function clampWindowIndex(value, entries){
        local maximum = entries.len() - TEXTURE_SLOTS_VISIBLE;
        if(maximum < 0){
                maximum = 0;
        }

        return clampInteger(coerceInteger(value, 0), 0, maximum);
}

function computeWindowMaximum(entries){
        local maximum = entries.len() - TEXTURE_SLOTS_VISIBLE;
        if(maximum < 0){
                maximum = 0;
        }

        return maximum;
}

function getWorldSpawn(worldName){
        local defaultSpawn = {
                x = 29628.5,
                y = 5198.25,
                z = -15176.8,
                angle = 213.44
        };

        if(worldName == null){
                return defaultSpawn;
        }

        local spawns = {
                ["NEWWORLD\\NEWWORLD.ZEN"] = {x = 29912.9, y = 5185.68, z = -15710.0, angle = 213.44},
                ["ADDON\\ADDONWORLD.ZEN"] = {x = -22.63, y = -75.0, z = -11338.8, angle = 213.44},
                ["OLDWORLD\\OLDWORLD.ZEN"] = {x = 1001.82, y = 849.693, z = -2756.62, angle = 213.44},
                ["NEWWORLD\\DRAGONISLAND.ZEN"] = {x = -10029.1, y = 442.548, z = -16785.1, angle = 213.44},
                ["COLONY.ZEN"] = {x = 1001.82, y = 849.693, z = -2756.62, angle = 213.44}
        };

        if(worldName in spawns){
                return spawns[worldName];
        }

        return defaultSpawn;
}

local creatorInitializing = false;
local creatorReturnState = null;
local creatorGUI = {
	logo = GUI.Sprite({
		positionPx = {x = nax(4000), y = nay(200)}
		sizePx = {width = nax(5500), height = nay(2000)}
		file = "GMP_LOGO_MENU.TGA"
		scaling = true
		disabled = true
		collection = creatorCollection
	}),

	visBG = GUI.Sprite({
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

	bodyM = GUI.Label({
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
	headM = GUI.Label({
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
	bodyT = GUI.Label({
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
	fat = GUI.Label({
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
	height = GUI.Label({
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
	walk = GUI.Label({
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
		label = {text = "Save Character"}
		collection = creatorCollection
	}),
	btnBack = GUI.Button({
		positionPx = {x = nax(5290), y = nay(5880)}
		sizePx = {width = nax(2200), height = nay(265)}
		file = "INV_SLOT_FOCUS.TGA"
		label = {text = "Main Menu"}
		collection = creatorCollection
	}),
	fail = GUI.Label({
		positionPx = {x = nax(5450), y = nay(6245)}
		text = "Character Name can't be empty!"
		font = "FONT_OLD_10_WHITE.TGA"
		collection = creatorCollection
	})
};

local facesTex = [];
local facesTextureMeta = {};
for(local i = 0; i < TEXTURE_SLOTS_VISIBLE; i++){
        facesTex.push(GUI.Sprite({
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
local bodiesTextureMeta = {};
for(local i = 0; i < TEXTURE_SLOTS_VISIBLE; i++){
        bodiesTex.push(GUI.Sprite({
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

function toggleCreator(toggle){
        creatorCollection.setVisible(toggle);
        updateDiscordState(format("Creating a character..."));

        local worldName = Player[heroId].getWorld();
        local spawn = getWorldSpawn(worldName);

        if(toggle){
                creatorInitializing = true;

                local previousPos = getPlayerPosition(heroId);
                local previousAngle = getPlayerAngle(heroId);

                creatorReturnState = {
                        position = previousPos,
                        angle = previousAngle,
                        scale = Player[heroId].getScale(),
                        fatness = getPlayerFatness(heroId),
                        visual = Player[heroId].getVisual(),
                        walk = Player[heroId].getWalkstyle(),
                        restoreAppearance = true
                };

                setPlayerPosition(heroId, spawn.x, spawn.y, spawn.z);

                local playerAngle = spawn.angle;
                local playerPos = Vec3(spawn.x, spawn.y, spawn.z);

                local forwardVector = Vec3(
                        sin(playerAngle * PI / 180.0),
                        0,
                        cos(playerAngle * PI / 180.0)
                );

                local rightVector = Vec3(
                        cos(playerAngle * PI / 180.0),
                        0,
                        -sin(playerAngle * PI / 180.0)
                );

                local xOffset = 100.0;
                local zOffset = 100.0;

                local initialCameraPos = Vec3(
                        playerPos.x + (forwardVector.x * 180),
                        spawn.y,
                        playerPos.z + (forwardVector.z * 180)
                );

                local targetCameraPos = Vec3(
                        initialCameraPos.x + xOffset * rightVector.x,
                        initialCameraPos.y,
                        initialCameraPos.z + zOffset * rightVector.z
                );

                Camera.setRotation(0, playerAngle - 155, 0);
                Camera.setPosition(targetCameraPos.x, targetCameraPos.y + 80, targetCameraPos.z);

                setPlayerAngle(heroId, spawn.angle + 30);

                local defaultSex = creator_gender.MALE;
                local defaultRace = creator_race.PALE;

                local sex = defaultSex;
                local race = defaultRace;

                creatorGUI.charaName.setText("");
                creatorGUI.fail.setVisible(false);

                creatorGUI.fatScroll.range.setValue(1.00);
                creatorGUI.heightScroll.range.setValue(1.00);
                creatorGUI.walkScroll.range.setValue(0);
                creatorGUI.walk.setText(format("Walking Style: %s", walking[0].name));
                walkvs = walking[0].style;

                creatorGUI.bodyMScroll.range.setValue(sex);
                creatorGUI.bodyTScroll.range.setValue(race);
                creatorGUI.headMScroll.range.setValue(0);
                creatorGUI.bodiesScroll.range.setValue(0);
                creatorGUI.facesScroll.range.setValue(0);

                setPlayerFatness(heroId, creatorGUI.fatScroll.range.getValue());
                Player[heroId].setScale(1.00, 1.00, 1.00, creatorGUI.fatScroll.range.getValue());

                if(LocalStorage.len() > 0){
                        local storedVisValue = LocalStorage.getItem("visValue");
                        if(storedVisValue != null && storedVisValue.len() >= 5){
                                local storedSex = clampInteger(coerceInteger(storedVisValue[0], sex), creator_gender.MALE, creator_gender.FEMALE);
                                if(storedSex in visSetting){
                                        sex = storedSex;
                                }

                                local storedRace = clampInteger(coerceInteger(storedVisValue[1], race), creator_race.PALE, creator_race.BLACK);
                                if(sex in visSetting && storedRace in visSetting[sex]){
                                        race = storedRace;
                                }

                                if(sex in bodies && sex in faces && sex in heads && race in bodies[sex] && race in faces[sex]){
                                        local bodyEntries = bodies[sex][race];
                                        local faceEntries = faces[sex][race];
                                        local headEntries = heads[sex];

                                        visValue[sex][race][0] = clampWindowIndex(storedVisValue[2], bodyEntries);
                                        visValue[sex][race][1] = clampInteger(coerceInteger(storedVisValue[3], 0), 0, headEntries.len() - 1);
                                        visValue[sex][race][2] = clampWindowIndex(storedVisValue[4], faceEntries);
                                }
                        }

                        local storedFatness = LocalStorage.getItem("fatness");
                        if(storedFatness != null){
                                creatorGUI.fatScroll.range.setValue(storedFatness);
                                setPlayerFatness(heroId, creatorGUI.fatScroll.range.getValue());
                        }

                        local storedScale = LocalStorage.getItem("scale");
                        if(storedScale != null && "x" in storedScale && "y" in storedScale && "z" in storedScale && "f" in storedScale){
                                creatorGUI.heightScroll.range.setValue(storedScale.x);
                                creatorGUI.fatScroll.range.setValue(storedScale.f);
                                Player[heroId].setScale(storedScale.x, storedScale.y, storedScale.z, storedScale.f);
                                setPlayerFatness(heroId, creatorGUI.fatScroll.range.getValue());
                        }

                        local storedName = LocalStorage.getItem("characterName");
                        if(storedName != null && typeof storedName == "string"){
                                creatorGUI.charaName.setText(storedName);
                        }

                        local storedVisual = LocalStorage.getItem("visual");
                        if(storedVisual != null && "bm" in storedVisual && "bt" in storedVisual && "hm" in storedVisual && "ht" in storedVisual){
                                Player[heroId].setVisual(storedVisual.bm, storedVisual.bt, storedVisual.hm, storedVisual.ht);
                        }
                }

                creatorGUI.bodyMScroll.range.setValue(sex);
                creatorGUI.bodyTScroll.range.setValue(race);

                updateCreatorTextures(sex, race, 0, 2);

                creatorInitializing = false;
        } else {
                if(creatorReturnState != null){
                        if("position" in creatorReturnState && creatorReturnState.position != null){
                                local restorePos = creatorReturnState.position;
                                setPlayerPosition(heroId, restorePos.x, restorePos.y, restorePos.z);
                        }

                        if("angle" in creatorReturnState && creatorReturnState.angle != null){
                                setPlayerAngle(heroId, creatorReturnState.angle);
                        }

                        if("restoreAppearance" in creatorReturnState && creatorReturnState.restoreAppearance){
                                if("scale" in creatorReturnState && creatorReturnState.scale != null){
                                        local scale = creatorReturnState.scale;
                                        Player[heroId].setScale(scale.x, scale.y, scale.z, scale.f);
                                }

                                if("fatness" in creatorReturnState && creatorReturnState.fatness != null){
                                        setPlayerFatness(heroId, creatorReturnState.fatness);
                                }

                                if("visual" in creatorReturnState && creatorReturnState.visual != null){
                                        local visual = creatorReturnState.visual;
                                        Player[heroId].setVisual(visual.bm, visual.bt, visual.hm, visual.ht);
                                }

                                if("walk" in creatorReturnState && creatorReturnState.walk != null){
                                        Player[heroId].setWalkstyle(creatorReturnState.walk);
                                }
                        }

                        creatorReturnState = null;
                }

                creatorInitializing = false;
        }

        creatorGUI.fail.setVisible(false);
}

function updateCreatorTextures(sex, race, val, category){
        if(!(sex in visSetting) || !(race in visSetting[sex])){
                return;
        }

        if(!(sex in faces) || !(race in faces[sex]) || !(sex in bodies) || !(race in bodies[sex]) || !(sex in heads)){
                return;
        }

        local faceEntries = faces[sex][race];
        local bodyEntries = bodies[sex][race];
        local headEntries = heads[sex];

        local bodyStart = visValue[sex][race][0];
        local headIndex = visValue[sex][race][1];
        local faceStart = visValue[sex][race][2];

        switch(category){
                case 0:
                        faceStart = clampWindowIndex(val, faceEntries);
                break;
                case 1:
                        bodyStart = clampWindowIndex(val, bodyEntries);
                break;
                case 2:
                        bodyStart = clampWindowIndex(bodyStart, bodyEntries);
                        faceStart = clampWindowIndex(faceStart, faceEntries);
                break;
        }

        bodyStart = clampWindowIndex(bodyStart, bodyEntries);
        faceStart = clampWindowIndex(faceStart, faceEntries);

        local headMaximum = headEntries.len() - 1;
        if(headMaximum < 0){
                headMaximum = 0;
        }
        headIndex = clampInteger(coerceInteger(headIndex, 0), 0, headMaximum);

        visValue[sex][race][0] = bodyStart;
        visValue[sex][race][1] = headIndex;
        visValue[sex][race][2] = faceStart;

        for(local texture = 0; texture < TEXTURE_SLOTS_VISIBLE; ++texture){
                local faceIndex = faceStart + texture;
                if(faceIndex < faceEntries.len()){
                        facesTex[texture].setFile(faceEntries[faceIndex]);
                } else {
                        facesTex[texture].setFile("");
                }

                local bodyIndex = bodyStart + texture;
                if(bodyIndex < bodyEntries.len()){
                        bodiesTex[texture].setFile(bodyEntries[bodyIndex]);
                } else {
                        bodiesTex[texture].setFile("");
                }
        }

        local vis = visSetting[sex][race];
        vis[2] = heads[sex][headIndex];
        setPlayerVisual(heroId, vis[0], vis[1], vis[2], vis[3]);

        local previousInitializing = creatorInitializing;
        creatorInitializing = true;

        facesScroll.setMaximum(computeWindowMaximum(faceEntries));
        bodiesScroll.setMaximum(computeWindowMaximum(bodyEntries));
        headMScroll.setMaximum(headMaximum);

        bodiesScroll.setValue(bodyStart);
        headMScroll.setValue(headIndex);
        facesScroll.setValue(faceStart);

        creatorInitializing = previousInitializing;
}

addEventHandler("GUI.onChange", function(object){
        if(creatorInitializing){
                return;
        }

        if(isCursorVisible() && creatorCollection.getVisible()){
                local sex = clampInteger(coerceInteger(bodyMScroll.getValue(), MALE), MALE, FEMALE);
                if(!(sex in visSetting)){
                        return;
                }

                local race = clampInteger(coerceInteger(bodyTScroll.getValue(), PALE), PALE, BLACK);
                if(!(race in visSetting[sex])){
                        race = PALE;
                }

                if(!(sex in faces) || !(race in faces[sex]) || !(sex in bodies) || !(race in bodies[sex]) || !(sex in heads)){
                        return;
                }

                local vis = visSetting[sex][race];
                local faceEntries = faces[sex][race];
                local bodyEntries = bodies[sex][race];
                local headEntries = heads[sex];

                local faceval = clampWindowIndex(facesScroll.getValue(), faceEntries);
                local bodyval = clampWindowIndex(bodiesScroll.getValue(), bodyEntries);
                local headval = clampInteger(coerceInteger(headMScroll.getValue(), 0), 0, headEntries.len() - 1);
                local fatness = fatScroll.getValue();
                local height = heightScroll.getValue();
                local walk = clampInteger(coerceInteger(walkScroll.getValue(), 0), 0, walking.len() - 1);

                switch(object){
                        case facesScroll:
                                visValue[sex][race][2] = faceval;
                                updateCreatorTextures(sex, race, faceval, 0);
                        break;
                        case bodiesScroll:
                                visValue[sex][race][0] = bodyval;
                                updateCreatorTextures(sex, race, bodyval, 1);
                        break;
                        case bodyTScroll:
                                visValue[sex][race][0] = clampWindowIndex(visValue[sex][race][0], bodyEntries);
                                visValue[sex][race][1] = clampInteger(visValue[sex][race][1], 0, headEntries.len() - 1);
                                visValue[sex][race][2] = clampWindowIndex(visValue[sex][race][2], faceEntries);
                                updateCreatorTextures(sex, race, 0, 2);
                        break;
                        case headMScroll:
                                visValue[sex][race][1] = headval;
                                vis[2] = heads[sex][headval];
                                setPlayerVisual(heroId, vis[0], vis[1], vis[2], vis[3]);
                        break;
                        case bodyMScroll:
                                vis[0] = body[sex];
                                visValue[sex][race][0] = clampWindowIndex(visValue[sex][race][0], bodyEntries);
                                visValue[sex][race][2] = clampWindowIndex(visValue[sex][race][2], faceEntries);
                                updateCreatorTextures(sex, race, 0, 2);
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
        }
});

addEventHandler("GUI.onClick", function(self){
        if(creatorInitializing){
                return;
        }

        if(isCursorVisible() && creatorCollection.getVisible()){
                local sex = clampInteger(coerceInteger(bodyMScroll.getValue(), MALE), MALE, FEMALE);
                if(!(sex in visSetting)){
                        return;
                }

                local race = clampInteger(coerceInteger(bodyTScroll.getValue(), PALE), PALE, BLACK);
                if(!(race in visSetting[sex])){
                        race = PALE;
                }

                if(!(sex in faces) || !(race in faces[sex]) || !(sex in bodies) || !(race in bodies[sex]) || !(sex in heads)){
                        return;
                }

                local vis = visSetting[sex][race];
                local _vis = visValue[sex][race];

                local index = 999;
                local findHead = "HUM_HEAD_V";
                local findBody = "HUM_BODY_NAKED_V";

                foreach(id, tex in facesTex){
                        if(tex == self){
                                local name = facesTex[id].getFile();
                                if(name == ""){
                                        continue;
                                }
                                do {
                                        index = name.find(findHead);

                                        if(index != null){
                                                name = name.slice(index + findHead.len());
                                        }
                                } while(index != null);
                                local variant = coerceInteger(name, vis[3]);
                                setPlayerVisual(heroId, vis[0], vis[1], vis[2], variant);
                                vis[3] = variant;
                        }
                }
                foreach(id, tex in bodiesTex){
                        if(tex == self){
                                local name = bodiesTex[id].getFile();
                                if(name == ""){
                                        continue;
                                }
                                do {
                                        index = name.find(findBody);

                                        if(index != null){
                                                name = name.slice(index + findBody.len());
                                        }
                                } while(index != null);
                                local variant = coerceInteger(name, vis[1]);
                                setPlayerVisual(heroId, vis[0], variant, vis[2], vis[3]);
                                vis[1] = variant;
                        }
                }

                switch(self){
                        case creatorGUI.btnBack:
                                toggleCreator(false);
                                menuChangeVisibility(true);
                        break;
                        case creatorGUI.btnFinish:
                                local name = creatorGUI.charaName.getText();
                                if(name != ""){
                                        Player[heroId].setName(name);
                                        Player[heroId].setVisual(vis[0], vis[1], vis[2], vis[3]);
                                        Player[heroId].setWalkstyle(walkvs);
                                        Player[heroId].setScale(heightScroll.getValue(), heightScroll.getValue(), heightScroll.getValue(), fatScroll.getValue());
                                        LocalStorage.setItem("visValue", [sex, race, _vis[0], _vis[1], _vis[2]]);
                                        LocalStorage.setItem("characterName", name);
                                        LocalStorage.setItem("fatness", fatScroll.getValue());
                                        LocalStorage.setItem("scale", {
                                                x = heightScroll.getValue(),
                                                y = heightScroll.getValue(),
                                                z = heightScroll.getValue(),
                                                f = fatScroll.getValue()
                                        });
                                        LocalStorage.setItem("visual", {
                                                bm = vis[0],
                                                bt = vis[1],
                                                hm = vis[2],
                                                ht = vis[3]
                                        });
                                        if(creatorReturnState != null){
                                                creatorReturnState.restoreAppearance = false;
                                        }
                                        toggleCreator(false);
                                        menuChangeVisibility(true);
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