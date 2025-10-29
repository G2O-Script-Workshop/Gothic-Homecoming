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

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.EN, optionsTranslations_EN);