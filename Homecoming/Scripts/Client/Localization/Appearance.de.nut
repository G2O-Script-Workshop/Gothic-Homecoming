// German (DE) - Appearance/Character Creator strings

local appearanceTranslations_DE = {
	appearance = {
		gender = "Geschlecht",
		headModel = "Kopfmodell",
		race = "Rasse",
		fatness = "Körperfülle",
		height = "Größe",
		walkingStyle = "Gangstil",
		characterName = "Name des Charakters",
		saveCharacter = "Charakter Speichern",
		mainMenu = "Hauptmenü",
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

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.DE, appearanceTranslations_DE);
