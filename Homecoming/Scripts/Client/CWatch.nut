timeCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local timeGUI = {
	gameTime = GUI.Draw({
		positionPx = {x = nax(7000), y = nay(2500)}
		text = "Game Time:"
		font = "FONT_DEFAULT.TGA"
		collection = timeCollection
	}),
	gameTimeClock = GUI.Draw({
		positionPx = {x = nax(7000), y = nay(2700)}
		text = format("%02d:%02d", getTime().hour, getTime().min)
		font = "FONT_DEFAULT.TGA"
		collection = timeCollection
	}),
	realTime = GUI.Draw({
		positionPx = {x = nax(7000), y = nay(2900)}
		text = "Real Time:"
		font = "FONT_DEFAULT.TGA"
		collection = timeCollection
	}),
	realTimeClock = GUI.Draw({
		positionPx = {x = nax(7000), y = nay(3100)}
		text = format("%02d:%02d", date().hour, date().min)
		font = "FONT_DEFAULT.TGA"
		collection = timeCollection
	})
}

setTimer(function(){
	timeGUI.gameTimeClock.setText(format("%02d:%02d", getTime().hour, getTime().min));
	timeGUI.realTimeClock.setText(format("%02d:%02d", date().hour, date().min));
}, 4000, 0);