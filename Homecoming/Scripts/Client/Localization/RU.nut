local optionsTranslations_RU = {
	options = {
		title = "Параметры"
	},
	chat = {
		lines = "Линии чата"
	},
	watch = {
		visibility = "Видимость часов",
		on = "Вкл",
		off = "Выкл"
	},
	discord = {
		activity = "Активность Discord",
		on = "Вкл",
		off = "Выкл"
	},
	language = {
		label = "Язык",
		english = "Английский",
		polish = "Польский",
		german = "Немецкий",
		russian = "Русский",
		czech = "Чешский"
	},
	buttons = {
		back = "Назад"
	}
};

local appearanceTranslations_RU = {
	appearance = {
		gender = "Пол",
		headModel = "Модель головы",
		race = "Раса",
		fatness = "Толстость",
		height = "Рост",
		walkingStyle = "Стиль походки",
		characterName = "Имя персонажа",
		saveCharacter = "Сохранить персонажа",
		mainMenu = "Главное меню",
		errorEmptyName = "Имя персонажа не может быть пустым!"
	}
	walkingStyles = {
		standard = "Стандартная",
		female = "Женская",
		militia = "Милиция",
		mage = "Маг",
		relaxed = "Расслабленная",
		arrogant = "Высокомерная"
	}
};

local mainMenuTranslations_RU = {
	mainMenu = {
		play = "Играть",
		character = "Персонаж",
		settings = "Настройки",
		options = "Опции",
		exit = "Выход"
	}
};

local serverListTranslations_RU = {
	serverList = {
		public = "ОБЩЕСТВЕННОСТЬ",
		favorite = "ЛЮБИМЫЙ",
		serverType = "Тип сервера",
		serverName = "Имя сервера",
		serverMap = "Карта сервера",
		players = "Игроки",
		npcs = "NPC"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.RU, optionsTranslations_RU);
registerTranslations(LANGUAGES.RU, appearanceTranslations_RU);
registerTranslations(LANGUAGES.RU, mainMenuTranslations_RU);
registerTranslations(LANGUAGES.RU, serverListTranslations_RU);