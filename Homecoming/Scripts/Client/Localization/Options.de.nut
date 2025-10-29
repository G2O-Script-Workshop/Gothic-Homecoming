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

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.DE, optionsTranslations_DE);