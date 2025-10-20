timeCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});

local watchVisibilityState = {
        userEnabled = true,
        gameVisible = false
};

local timeGUI = {
	realTime = GUI.Label({
		positionPx = {x = nax(7000), y = nay(2500)}
		text = "Real Time:"
		font = "FONT_DEFAULT.TGA"
		collection = timeCollection
	}),
	realTimeClock = GUI.Label({
		positionPx = {x = nax(7000), y = nay(2700)}
		text = "00:00:00"
		font = "FONT_DEFAULT.TGA"
		collection = timeCollection
	}),
	gameTime = GUI.Label({
		positionPx = {x = nax(7000), y = nay(2900)}
		text = "Game Time:"
		font = "FONT_DEFAULT.TGA"
		collection = timeCollection
	}),
	gameTimeClock = GUI.Label({
		positionPx = {x = nax(7000), y = nay(3100)}
		text = "00:00"
		font = "FONT_DEFAULT.TGA"
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

setTimer(function(){
	timeGUI.realTimeClock.setText(format("%02d:%02d:%02d", date().hour, date().min, date().sec));
	timeGUI.gameTimeClock.setText(format("%02d:%02d", getTime().hour, getTime().min));
}, 1000, 0);

applyWatchVisibility();