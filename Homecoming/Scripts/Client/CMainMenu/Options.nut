optionsCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
optionsCollection.setVisible(false);

local STORAGE_KEYS = {
	chatLines = "options.chatLines",
	watchVisible = "options.watchVisible",
	discordVisible = "options.discordVisible"
};

local function clampInt(value, minimum, maximum){
	if(value < minimum) return minimum;
	if(value > maximum) return maximum;
	return value;
}

local function toInteger(value, defaultValue = 0){
	switch(typeof value){
		case "integer":
			return value;
		case "float":
			return value.tointeger();
		case "string":
			local parsed = value.tointeger();
			return parsed != null ? parsed : defaultValue;
	}

	return defaultValue;
}

local function toBool(value, defaultValue = false){
	switch(typeof value){
		case "bool":
			return value;
		case "integer":
			return value != 0;
		case "float":
			return value != 0.0;
		case "string":
			local lowered = value.tolower();
			if(lowered == "true" || lowered == "1") return true;
			if(lowered == "false" || lowered == "0") return false;
	}

	return defaultValue;
}

local optionsState = {
	chatLines = 10,
	watchVisible = true,
	discordVisible = true
};

// Language list (CZ is temporarily disabled)
local availableLanguages = ["en", "pl", "de", "ru"];
local currentLanguageIndex = 0;

// Get reference to i18n instance for direct use
local i18n = null;

local function getLanguageName(code){
	switch(code){
		case "en": return _t("language.english").tostring();
		case "pl": return _t("language.polish").tostring();
		case "de": return _t("language.german").tostring();
		case "ru": return _t("language.russian").tostring();
		case "cz": return _t("language.czech").tostring();
	}
	return code.toupper();
}

local function findLanguageIndex(code){
	for(local i = 0; i < availableLanguages.len(); i++){
		if(availableLanguages[i] == code){
			return i;
		}
	}
	return 0;
}

local optionsGUI = {
	background = GUI.Sprite({
		positionPx = {x = nax(300), y = nay(2085)},
		sizePx = {width = nax(3000), height = nay(4020)},
		file = "MENU_INGAME.TGA",
		scaling = true,
		collection = optionsCollection
	}),

	title = GUI.Label({
		positionPx = {x = nax(1800), y = nay(2300)},
		text = translate("options.title"),
		font = getFont("FONT_OLD_20_WHITE.TGA"),
		collection = optionsCollection
	}),

	chatLinesLabel = GUI.Label({
		positionPx = {x = nax(550), y = nay(2900)},
		text = translate("chat.lines"),
		font = getFont("FONT_OLD_10_WHITE.TGA"),
		collection = optionsCollection
	}),
	chatLinesValue = GUI.Label({
		positionPx = {x = nax(2550), y = nay(2900)},
		text = "10",
		font = getFont("FONT_OLD_10_WHITE.TGA"),
		align = Align.Right,
		collection = optionsCollection
	}),
	chatLinesScroll = GUI.ScrollBar({
		positionPx = {x = nax(550), y = nay(3075)},
		sizePx = {width = nax(2200), height = nay(115)},
		range = {
			file = "MENU_SLIDER_BACK.TGA",
			indicator = {file = "MENU_SLIDER_POS.TGA"},
			orientation = Orientation.Horizontal
		},
		increaseButton = {file = ""},
		decreaseButton = {file = ""},
		collection = optionsCollection
	}),

	watchLabel = GUI.Label({
		positionPx = {x = nax(550), y = nay(3600)},
		text = translate("watch.visibility") + ": " + translate("watch.on"),
		font = getFont("FONT_OLD_10_WHITE.TGA"),
		collection = optionsCollection
	}),

	discordLabel = GUI.Label({
		positionPx = {x = nax(550), y = nay(4000)},
		text = translate("discord.activity") + ": " + translate("discord.on"),
		font = getFont("FONT_OLD_10_WHITE.TGA"),
		collection = optionsCollection
	}),

	languageLabel = GUI.Label({
		positionPx = {x = nax(550), y = nay(4400)},
		text = translate("language.label") + ": " + getLanguageName(getCurrentLanguage()),
		font = getFont("FONT_OLD_10_WHITE.TGA"),
		collection = optionsCollection
	}),

	backButton = GUI.Button({
		positionPx = {x = nax(550), y = nay(4800)},
		sizePx = {width = nax(2200), height = nay(265)},
		file = "INV_SLOT_FOCUS.TGA",
		label = {text = translate("buttons.back")},
		collection = optionsCollection
	})
};

local chatLinesScrollRange = optionsGUI.chatLinesScroll.range;
chatLinesScrollRange.setMinimum(5);
chatLinesScrollRange.setMaximum(30);
chatLinesScrollRange.setStep(1);

local function storeChatLines(value){
	LocalStorage.setItem(STORAGE_KEYS.chatLines, value);
}

local function storeWatchVisible(value){
	LocalStorage.setItem(STORAGE_KEYS.watchVisible, value ? 1 : 0);
}

local function storeDiscordVisible(value){
	LocalStorage.setItem(STORAGE_KEYS.discordVisible, value ? 1 : 0);
}

local function updateChatLinesDisplay(){
	optionsGUI.chatLinesValue.setText(format("%d", optionsState.chatLines));
}

local function updateWatchDisplay(){
	local onOffText = optionsState.watchVisible ? _t("watch.on").tostring() : _t("watch.off").tostring();
	optionsGUI.watchLabel.setText(_t("watch.visibility").tostring() + ": " + onOffText);
	optionsGUI.watchLabel.setColor(optionsState.watchVisible ? {r = 255, g = 255, b = 255, a = 255} : {r = 180, g = 128, b = 128, a = 255});
}

local function updateDiscordDisplay(){
	local onOffText = optionsState.discordVisible ? _t("discord.on").tostring() : _t("discord.off").tostring();
	optionsGUI.discordLabel.setText(_t("discord.activity").tostring() + ": " + onOffText);
	optionsGUI.discordLabel.setColor(optionsState.discordVisible ? {r = 255, g = 255, b = 255, a = 255} : {r = 180, g = 128, b = 128, a = 255});
}

local function updateLanguageDisplay(){
	optionsGUI.languageLabel.setText(_t("language.label").tostring() + ": " + getLanguageName(i18n ? i18n.getLocale() : getCurrentLanguage()));
}

local function refreshAllLabels(){
	// Get current locale directly from i18n
	local currentLocale = i18n ? i18n.getLocale() : "en";
	local fontPrefix = currentLocale.toupper();

	// Refresh all text labels with current language
	optionsGUI.title.setText(_t("options.title").tostring());
	optionsGUI.title.setFont(fontPrefix + "_FONT_OLD_20_WHITE.TGA");

	optionsGUI.chatLinesLabel.setText(_t("chat.lines").tostring());
	optionsGUI.chatLinesLabel.setFont(fontPrefix + "_FONT_OLD_10_WHITE.TGA");
	optionsGUI.chatLinesValue.setFont(fontPrefix + "_FONT_OLD_10_WHITE.TGA");

	optionsGUI.watchLabel.setFont(fontPrefix + "_FONT_OLD_10_WHITE.TGA");
	updateWatchDisplay();

	optionsGUI.discordLabel.setFont(fontPrefix + "_FONT_OLD_10_WHITE.TGA");
	updateDiscordDisplay();

	optionsGUI.languageLabel.setFont(fontPrefix + "_FONT_OLD_10_WHITE.TGA");
	updateLanguageDisplay();

	optionsGUI.backButton.setFont(fontPrefix + "_FONT_OLD_10_WHITE.TGA");
	optionsGUI.backButton.label.setText(_t("buttons.back").tostring());

	print("[Options] Updated fonts to prefix: " + fontPrefix);
}

local function cycleLanguage(){
	currentLanguageIndex++;
	if(currentLanguageIndex >= availableLanguages.len()){
		currentLanguageIndex = 0;
	}

	local newLanguage = availableLanguages[currentLanguageIndex];

	// Initialize i18n reference if not done yet
	if(!i18n){
		i18n = getLanguageManagerI18n();
	}

	// Use i18n directly instead of going through LanguageManager
	if(i18n){
		i18n.setLocale(newLanguage);
		LocalStorage.setItem("options.language", newLanguage);
	} else {
		// Fallback to old method
		setCurrentLanguage(newLanguage);
	}
}

local function loadOptionsFromStorage(){
	if(LocalStorage.len() > 0){
		local storedChatLines = LocalStorage.getItem(STORAGE_KEYS.chatLines);
		if(storedChatLines != null){
			optionsState.chatLines = clampInt(toInteger(storedChatLines, optionsState.chatLines), 5, 30);
		}

		local storedWatchVisible = LocalStorage.getItem(STORAGE_KEYS.watchVisible);
		if(storedWatchVisible != null){
			optionsState.watchVisible = toBool(storedWatchVisible, optionsState.watchVisible);
		}

		local storedDiscordVisible = LocalStorage.getItem(STORAGE_KEYS.discordVisible);
		if(storedDiscordVisible != null){
			optionsState.discordVisible = toBool(storedDiscordVisible, optionsState.discordVisible);
		}
	}

	// Initialize i18n reference
	i18n = getLanguageManagerI18n();

	// Set current language index based on stored language
	currentLanguageIndex = findLanguageIndex(i18n ? i18n.getLocale() : getCurrentLanguage());

	chatLinesScrollRange.setValue(optionsState.chatLines);
	updateChatLinesDisplay();
	updateWatchDisplay();
	updateDiscordDisplay();
	updateLanguageDisplay();
}

local function applyChatLinesSetting(){
	if("Chat" in getroottable()){
		Chat.setMaxLines(optionsState.chatLines);
	}
}

local function applyWatchSetting(){
	if("setWatchUserEnabled" in getroottable()){
		setWatchUserEnabled(optionsState.watchVisible);
	} else if("timeCollection" in getroottable()){
		timeCollection.setVisible(optionsState.watchVisible);
	}
}

local function applyDiscordSetting(){
	if("setDiscordActivityEnabled" in getroottable()){
		setDiscordActivityEnabled(optionsState.discordVisible);
	}
}

local function applyStoredSettings(){
	applyChatLinesSetting();
	applyWatchSetting();
	applyDiscordSetting();
}

function toggleOptionsMenu(toggle){
	optionsCollection.setVisible(toggle);

	if(toggle){
		chatLinesScrollRange.setValue(optionsState.chatLines);
		updateChatLinesDisplay();
		updateWatchDisplay();
		updateDiscordDisplay();
		updateLanguageDisplay();
		menuChangeVisibility(false);
	} else {
		menuChangeVisibility(true);
	}
}

function getChatLinesOption(){
	return optionsState.chatLines;
}

function isWatchOptionEnabled(){
	return optionsState.watchVisible;
}

function isDiscordActivityOptionEnabled(){
	return optionsState.discordVisible;
}

// Bi18n event handler: automatically refresh all labels when locale changes
addEventHandler("Bi18n:onLocaleChanged", function(locale){
	print("[Options] Locale changed to: " + locale + ", refreshing UI");
	refreshAllLabels();
});

addEventHandler("GUI.onChange", function(object){
	if(!optionsCollection.getVisible()) return;

	switch(object){
		case chatLinesScrollRange:
			local newValue = clampInt(toInteger(chatLinesScrollRange.getValue(), optionsState.chatLines), 5, 30);
			if(newValue != optionsState.chatLines){
				optionsState.chatLines = newValue;
				updateChatLinesDisplay();
				storeChatLines(newValue);
				applyChatLinesSetting();
			}
		break;
	}
});

addEventHandler("GUI.onClick", function(self){
	if(!optionsCollection.getVisible()) return;

	switch(self){
		case optionsGUI.watchLabel:
			optionsState.watchVisible = !optionsState.watchVisible;
			updateWatchDisplay();
			storeWatchVisible(optionsState.watchVisible);
			applyWatchSetting();
		break;
		case optionsGUI.discordLabel:
			optionsState.discordVisible = !optionsState.discordVisible;
			updateDiscordDisplay();
			storeDiscordVisible(optionsState.discordVisible);
			applyDiscordSetting();
		break;
		case optionsGUI.languageLabel:
			cycleLanguage();
		break;
		case optionsGUI.backButton:
			toggleOptionsMenu(false);
		break;
	}
});

addEventHandler("onInit", function(){
	applyStoredSettings();
});

loadOptionsFromStorage();