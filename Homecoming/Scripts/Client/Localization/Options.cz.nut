// Czech (CZ) - Options strings

// Using nested structure for bi18n
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

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.CZ, optionsTranslations_CZ);