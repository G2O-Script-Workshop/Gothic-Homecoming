local optionsTranslations_CZ = {
	options = {
		title = "Možnosti"
	},
	chat = {
		lines = "Linky chatu"
	},
	watch = {
		visibility = "Viditelnost sledování",
		on = "Zapnuto",
		off = "Vypnuto",
		realTime = "Reálný èas:",
		gameTime = "Herní èas:"
	},
	discord = {
		activity = "Aktivita na Discordu",
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
		fatness = "Tlustost",
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
		relaxed = "Uvolnìný",
		arrogant = "Arogantní"
	}
};

local mainMenuTranslations_CZ = {
	mainMenu = {
		play = "Pøehrát",
		character = "Postava",
		settings = "Nastavení",
		options = "Možnosti",
		exit = "Ukonèit"
	}
};

local serverListTranslations_CZ = {
	serverList = {
		public = "VEØEJNOST",
		favorite = "OBLÍBENÝ",
		serverType = "Typ Serveru",
		serverName = "Název Serveru",
		serverMap = "Mapa Serveru",
		players = "Hráèi",
		npcs = "NPC"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.CZ, optionsTranslations_CZ);
registerTranslations(LANGUAGES.CZ, appearanceTranslations_CZ);
registerTranslations(LANGUAGES.CZ, mainMenuTranslations_CZ);
registerTranslations(LANGUAGES.CZ, serverListTranslations_CZ);