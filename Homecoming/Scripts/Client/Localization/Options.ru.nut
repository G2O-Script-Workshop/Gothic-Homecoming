// Russian (RU) - Options strings

// Using nested structure for bi18n
local optionsTranslations_RU = {
	options = {
		title = "Настройки"
	},
	chat = {
		lines = "Строки чата"
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

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.RU, optionsTranslations_RU);