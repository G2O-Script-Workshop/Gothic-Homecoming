timeCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});

// Get reference to i18n instance for direct use
local i18n = getLanguageManagerI18n();

local watchVisibilityState = {
        userEnabled = true,
        gameVisible = false
};

local timeGUI = {
	realTime = GUI.Label({
		positionPx = {x = nax(7000), y = nay(2500)}
		text = translate("watch.realTime")
		font = getFont("FONT_DEFAULT.TGA")
		collection = timeCollection
	}),
	realTimeClock = GUI.Label({
		positionPx = {x = nax(7000), y = nay(2700)}
		text = "00:00:00"
		font = getFont("FONT_DEFAULT.TGA")
		collection = timeCollection
	}),
	gameTime = GUI.Label({
		positionPx = {x = nax(7000), y = nay(2900)}
		text = translate("watch.gameTime")
		font = getFont("FONT_DEFAULT.TGA")
		collection = timeCollection
	}),
	gameTimeClock = GUI.Label({
		positionPx = {x = nax(7000), y = nay(3100)}
		text = "00:00"
		font = getFont("FONT_DEFAULT.TGA")
		collection = timeCollection
	})
}

local function applyWatchVisibility(){
        timeCollection.setVisible(watchVisibilityState.userEnabled && watchVisibilityState.gameVisible);
}

function setWatchUserEnabled(enabled){
        watchVisibilityState.userEnabled = enabled;
        applyWatchVisibility();
}

function setWatchGameVisibility(visible){
        watchVisibilityState.gameVisible = visible;
        applyWatchVisibility();
}

function isWatchUserEnabled(){
        return watchVisibilityState.userEnabled;
}

local function refreshAllLabels(){
	// Get current locale directly from i18n
	local currentLocale = i18n ? i18n.getLocale() : "en";
	local fontPrefix = currentLocale.toupper();

	// Refresh all text labels with current language
	timeGUI.realTime.setText(_t("watch.realTime").tostring());
	timeGUI.realTime.setFont(fontPrefix + "_FONT_DEFAULT.TGA");

	timeGUI.gameTime.setText(_t("watch.gameTime").tostring());
	timeGUI.gameTime.setFont(fontPrefix + "_FONT_DEFAULT.TGA");

	// Update clock fonts (text is dynamic, so only update fonts)
	timeGUI.realTimeClock.setFont(fontPrefix + "_FONT_DEFAULT.TGA");
	timeGUI.gameTimeClock.setFont(fontPrefix + "_FONT_DEFAULT.TGA");

	print("[Watch] Updated fonts to prefix: " + fontPrefix);
}

setTimer(function(){
	timeGUI.realTimeClock.setText(format("%02d:%02d:%02d", date().hour, date().min, date().sec));
	timeGUI.gameTimeClock.setText(format("%02d:%02d", getTime().hour, getTime().min));
}, 1000, 0);

applyWatchVisibility();

// Bi18n event handler: automatically refresh all labels when locale changes
addEventHandler("Bi18n:onLocaleChanged", function(locale){
	print("[Watch] Locale changed to: " + locale + ", refreshing UI");
	refreshAllLabels();
});