// English (EN) - Appearance/Character Creator strings
// Default language

local appearanceTranslations_EN = {
	appearance = {
		gender = "Gender",
		headModel = "Head Model",
		race = "Race",
		fatness = "Fatness",
		height = "Height",
		walkingStyle = "Walking Style",
		characterName = "Character's Name",
		saveCharacter = "Save Character",
		mainMenu = "Main Menu",
		errorEmptyName = "Character Name can't be empty!"
	}
	walkingStyles = {
		standard = "Default",
		female = "Female",
		militia = "Militia",
		mage = "Mage",
		relaxed = "Relaxed",
		arrogant = "Arrogant"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.EN, appearanceTranslations_EN);
