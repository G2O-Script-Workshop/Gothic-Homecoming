// English (EN) - Options strings
// Default language

// Using nested structure for bi18n
local optionsTranslations_EN = {
	options = {
		title = "Options"
	},
	chat = {
		lines = "Chat lines"
	},
	watch = {
		visibility = "Watch visibility",
		on = "On",
		off = "Off"
	},
	discord = {
		activity = "Discord activity",
		on = "On",
		off = "Off"
	},
	language = {
		label = "Language",
		english = "English",
		polish = "Polish",
		german = "German",
		russian = "Russian",
		czech = "Czech"
	},
	buttons = {
		back = "Back"
	}
};

local appearanceTranslations_EN = {
	appearance = {
		gender = "Gender",
		headModel = "Head Model",
		race = "Race",
		fatness = "Fatness",
		height = "Height",
		walkingStyle = "Walking Style",
		characterName = "Character's Name",
		saveCharacter = "Save Character",
		mainMenu = "Main Menu",
		errorEmptyName = "Character Name can't be empty!"
	}
	walkingStyles = {
		standard = "Default",
		female = "Female",
		militia = "Militia",
		mage = "Mage",
		relaxed = "Relaxed",
		arrogant = "Arrogant"
	}
};

local mainMenuTranslations_EN = {
	mainMenu = {
		play = "Play",
		character = "Character",
		settings = "Settings",
		options = "Options",
		exit = "Exit"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.EN, optionsTranslations_EN);
registerTranslations(LANGUAGES.EN, appearanceTranslations_EN);
registerTranslations(LANGUAGES.EN, mainMenuTranslations_EN);