local Music = Sound("GMPMENU.wav");
local Sword = Vob("ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS");

menuCollection <- GUI.Collection({
	position = {x = 0, y = 0}
});
local menuGUI = {
	logo = GUI.Texture({
		positionPx = {x = nax(4000), y = nay(200)}
		sizePx = {width = nax(5500), height = nay(2000)}
		file = "GMP_LOGO_MENU.TGA"
		scaling = true
		disabled = true
	}),

	play = GUI.Draw({
		positionPx = {x = nax(200), y = nay(3200)}
		text = "Play"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),
	character = GUI.Draw({
		positionPx = {x = nax(200), y = nay(3600)}
		text = "Character"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),
	settings = GUI.Draw({
		positionPx = {x = nax(200), y = nay(4000)}
		text = "Settings"
		font = "FONT_OLD_20_WHITE.TGA"
		color = {r = 180, g = 128, b = 128, a = 64}
		collection = menuCollection
	}),
	options = GUI.Draw({
		positionPx = {x = nax(200), y = nay(4400)}
		text = "Options"
		font = "FONT_OLD_20_WHITE.TGA"
		color = {r = 180, g = 128, b = 128, a = 64}
		collection = menuCollection
	}),
	exit = GUI.Draw({
		positionPx = {x = nax(200), y = nay(4800)}
		text = "Exit"
		font = "FONT_OLD_20_WHITE.TGA"
		collection = menuCollection
	}),

	version = GUI.Draw({
		positionPx = {x = 0, y = 0}
		text = "v0.2b Build 3336"
		font = "FONT_DEFAULT.TGA"
		disabled = true
		collection = menuCollection
	})
}