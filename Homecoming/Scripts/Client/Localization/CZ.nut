local optionsTranslations_CZ = {
	options = {
		title = "Možnosti"
	},
	chat = {
		lines = "Øádky chatu"
	},
	watch = {
		visibility = "Viditelnost hodin",
		on = "Zapnuto",
		off = "Vypnuto"
	},
	discord = {
		activity = "Aktivita Discord",
		on = "Zapnuto",
		off = "Vypnuto"
	},
	language = {
		label = "Jazyk",
		english = "Angliètina",
		polish = "Polština",
		german = "Nìmèina",
		russian = "Ruština",
		czech = "Èeština"
	},
	buttons = {
		back = "Zpìt"
	}
};

local appearanceTranslations_CZ = {
	appearance = {
		gender = "Pohlaví",
		headModel = "Model Hlavy",
		race = "Rasa",
		fatness = "Tuhost",
		height = "Výška",
		walkingStyle = "Styl Chùze",
		characterName = "Jméno Postavy",
		saveCharacter = "Uložit Postavu",
		mainMenu = "Hlavní Menu",
		errorEmptyName = "Jméno postavy nemùže být prázdné!"
	}
	walkingStyles = {
		standard = "Výchozí",
		female = "Žena",
		militia = "Milice",
		mage = "Mág",
		relaxed = "Uvoln?ný",
		arrogant = "Arogantní"
	}
};

local mainMenuTranslations_CZ = {
	mainMenu = {
		play = "P?ehrát",
		character = "Postava",
		settings = "Nastavení",
		options = "Možnosti",
		exit = "Ukon?it"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.CZ, optionsTranslations_CZ);
registerTranslations(LANGUAGES.CZ, appearanceTranslations_CZ);
registerTranslations(LANGUAGES.CZ, mainMenuTranslations_CZ);