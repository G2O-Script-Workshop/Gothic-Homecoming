// Czech (CZ) - Appearance/Character Creator strings

local appearanceTranslations_CZ = {
	appearance = {
		gender = "Pohlaví",
		headModel = "Model Hlavy",
		race = "Rasa",
		fatness = "Tuhost",
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
		relaxed = "Uvoln?ný",
		arrogant = "Arogantní"
	}
};

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.CZ, appearanceTranslations_CZ);
