// Language Manager
// Manages language selection and localization using bi18n

// Available languages
LANGUAGES <- {
	EN = "en",
	PL = "pl",
	DE = "de",
	RU = "ru",
	CZ = "cz"
};

// Default language
const DEFAULT_LANGUAGE = "en";
const STORAGE_KEY_LANGUAGE = "options.language";

// Global i18n instance (will be initialized after translations are loaded)
local i18n = null;

// Translation messages (populated by localization files)
local translations = {};

/**
 * Get the i18n instance for direct access
 * @return Bi18n instance or null if not initialized
 */
function getLanguageManagerI18n(){
	// Auto-initialize if not done yet
	if(!i18n && translations.len() > 0){
		initializeBi18n();
	}
	return i18n;
}

/**
 * Get the current language code
 * @return string - Current language code (e.g., "en", "pl")
 */
function getCurrentLanguage(){
	return i18n ? i18n.getLocale() : DEFAULT_LANGUAGE;
}

/**
 * Set the current language
 * @param code string - Language code (e.g., "en", "pl", "de", "ru", "cz")
 */
function setCurrentLanguage(code){
	// Validate language code
	local validLanguage = false;
	foreach(key, value in LANGUAGES){
		if(value == code){
			validLanguage = true;
			break;
		}
	}

	if(!validLanguage){
		print("[LanguageManager] Invalid language code: " + code + ", using default: " + DEFAULT_LANGUAGE);
		code = DEFAULT_LANGUAGE;
	}

	// Set locale in bi18n
	if(i18n){
		i18n.setLocale(code);
		LocalStorage.setItem(STORAGE_KEY_LANGUAGE, code);
		print("[LanguageManager] Language set to: " + code);
	} else {
		print("[LanguageManager] Warning: bi18n not initialized yet");
	}
}

/**
 * Get font path with language prefix
 * @param baseFont string - Base font filename (e.g., "FONT_DEFAULT.TGA")
 * @return string - Language-prefixed font path (e.g., "EN_FONT_DEFAULT.TGA")
 */
function getFont(baseFont){
	local lang = getCurrentLanguage().toupper();
	return lang + "_" + baseFont;
}

/**
 * Translate a key to the current language (backward compatibility wrapper)
 * @param key string - Translation key (supports both flat "KEY" and nested "category.key" format)
 * @return string - Translated string, never returns null
 */
function translate(key){
	// Auto-initialize bi18n if not done yet and we have translations
	if(!i18n && translations.len() > 0){
		initializeBi18n();
	}

	// Use bi18n if available
	if(i18n){
		try {
			local result = _t(key).tostring();
			// Ensure we never return null
			if(result == null){
				print("[LanguageManager] Warning: Translation returned null for key '" + key + "'");
				return "[" + key + "]";
			}
			return result;
		} catch(e) {
			print("[LanguageManager] Error translating key '" + key + "': " + e);
			return "[" + key + "]";
		}
	}

	// Fallback if bi18n not ready
	return "[" + key + "]";
}

/**
 * Register a translation table for a specific language
 * @param languageCode string - Language code
 * @param messages table - Table containing translation keys and values (supports nested structure)
 */
function registerTranslations(languageCode, messages){
	if(!(languageCode in translations)){
		translations[languageCode] <- {};
	}

	// Merge messages into existing translations for this language
	foreach(key, value in messages){
		translations[languageCode][key] <- value;
	}

	print("[LanguageManager] Registered translations for: " + languageCode);
}

/**
 * Initialize the bi18n instance with all registered translations
 */
function initializeBi18n(){
	// Get initial locale from storage or use default
	local initialLocale = DEFAULT_LANGUAGE;
	if(LocalStorage.len() > 0){
		local storedLanguage = LocalStorage.getItem(STORAGE_KEY_LANGUAGE);
		if(storedLanguage != null && typeof storedLanguage == "string"){
			// Validate stored language
			foreach(key, value in LANGUAGES){
				if(value == storedLanguage){
					initialLocale = storedLanguage;
					break;
				}
			}
		}
	}

	// Create bi18n instance
	i18n = Bi18n(initialLocale, translations);
	Bi18n_setupGlobal(i18n);

	print("[LanguageManager] Initialized bi18n with locale: " + initialLocale);
}