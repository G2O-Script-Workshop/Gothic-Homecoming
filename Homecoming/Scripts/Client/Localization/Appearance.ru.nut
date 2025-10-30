// Russian (RU) - Appearance/Character Creator strings

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

// Register translations with the LanguageManager
registerTranslations(LANGUAGES.RU, appearanceTranslations_RU);
