// German (DE) - Options strings

// Using nested structure for bi18n
local optionsTranslations_DE = {
	options = {
		title = "Optionen"
	},
	chat = {
		lines = "Chat-Zeilen"
	},
	watch = {
		visibility = "Uhr-Sichtbarkeit",
		on = "Ein",
		off = "Aus"
	},
	discord = {
		activity = "Discord-Aktivität",
		on = "Ein",
		off = "Aus"
	},
	language = {
		label = "Sprache",
		english = "Englisch",
		polish = "Polnisch",
		german = "Deutsch",
		russian = "Russisch",
		czech = "Tschechisch"
	},
	buttons = {
		back = "Zurück"
	}
};

local appearanceTranslations_DE = {
	appearance = {
		gender = "Geschlecht",
		headModel = "Kopfmodell",
		race = "Rasse",
		fatness = "K?rperf?lle",
		height = "Gr??e",
		walkingStyle = "Gangstil",
		characterName = "Name des Charakters",
		saveCharacter = "Charakter Speichern",
		mainMenu = "Hauptmen?",
		errorEmptyName = "Charaktername darf nicht leer sein!"
	}
	walkingStyles = {
		standard = "Standard",
		female = "Weiblich",
		militia = "Miliz",
		mage = "Magier",
		relaxed = "Entspannt",
		arrogant = "Arrogant"
	}
};

local mainMenuTranslations_DE = {
	mainMenu = {
		play = "Spielen",
		character = "Charakter",
		settings = "Einstellungen",
		options = "Optionen",
		exit = "Beenden"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.DE, optionsTranslations_DE);
registerTranslations(LANGUAGES.DE, appearanceTranslations_DE);
registerTranslations(LANGUAGES.DE, mainMenuTranslations_DE);