// Polish (PL) - Options strings

// Using nested structure for bi18n
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

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.PL, optionsTranslations_PL);