local optionsTranslations_PL = {
	options = {
		title = "Opcje"
	},
	chat = {
		lines = "Linie czatu"
	},
	watch = {
		visibility = "Widocznoœæ zegara",
		on = "W³¹czony",
		off = "Wy³¹czony"
	},
	discord = {
		activity = "Aktywnoœæ Discord",
		on = "W³¹czona",
		off = "Wy³¹czona"
	},
	language = {
		label = "Jêzyk",
		english = "Angielski",
		polish = "Polski",
		german = "Niemiecki",
		russian = "Rosyjski",
		czech = "Czeski"
	},
	buttons = {
		back = "Wstecz"
	}
};

local appearanceTranslations_PL = {
	appearance = {
		gender = "P³eæ",
		headModel = "Model G³owy",
		race = "Rasa",
		fatness = "Tucznoœæ",
		height = "Wzrost",
		walkingStyle = "Styl Chodu",
		characterName = "Imiê Postaci",
		saveCharacter = "Zapisz Postaæ",
		mainMenu = "Menu G³ówne",
		errorEmptyName = "Imiê postaci nie mo¿e byæ puste!"
	}
	walkingStyles = {
		standard = "Domyœlny",
		female = "Kobiecy",
		militia = "Milicja",
		mage = "Mag",
		relaxed = "Zrelaksowany",
		arrogant = "Arogancki"
	}
};

local mainMenuTranslations_PL = {
	mainMenu = {
		play = "Graj",
		character = "Postaæ",
		settings = "Ustawienia",
		options = "Opcje",
		exit = "Wyjœcie"
	}
};

local serverListTranslations_PL = {
	serverList = {
		public = "PUBLICZNE",
		favorite = "ULUBIONE",
		serverType = "Typ Serwera",
		serverName = "Nazwa Serwera",
		serverMap = "Mapa Serwera",
		players = "Gracze",
		npcs = "NPC"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.PL, optionsTranslations_PL);
registerTranslations(LANGUAGES.PL, appearanceTranslations_PL);
registerTranslations(LANGUAGES.PL, mainMenuTranslations_PL);
registerTranslations(LANGUAGES.PL, serverListTranslations_PL);