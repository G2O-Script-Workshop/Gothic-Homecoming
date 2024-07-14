classes[virtualServers.valleyRPClassic] <- [
	{
        name = "Convict",
        guild = "Castle",
        description = "He has too many wounds to live. And not enough wounds to die.",
        spawn = [-164.96, 130.321, -2300.64, 0],
        func = function(id) {
            Players[id].setHealth(100);
            Players[id].setMaxHealth(100);
            Players[id].setMana(10);
            Players[id].setMaxMana(10);

            Players[id].setStrength(40);
            Players[id].setDexterity(20);

            Players[id].setOneHandSkill(10);
            Players[id].setTwoHandSkill(10);
            Players[id].setBowSkill(10);
            Players[id].setCrossbowSkill(10);

            Players[id].equipItem("ItAr_Prisoner");
            Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
            Players[id].giveItem("ITFO_BACON", 100);
            Players[id].giveItem("ITFO_WINE", 100);
            Players[id].giveItem("IFTO_XPSTEW", 25);
            Players[id].giveItem("ITAR_GOVERNOR", 1);
            Players[id].giveItem("ItMw_2H_Axe_L_01", 1);
            Players[id].giveItem("ITMI_IEDRUMSCHEIT", 1);
            Players[id].giveItem("ITMI_POCKET", 1);
            Players[id].giveItem("ITMI_JOINT", 100);
        },
        _func = function(id){
            giveItem(id, "ItAr_Prisoner", 1);
            giveItem(id, "ItMw_2H_Axe_L_01", 1);
            equipItem(id, "ItAr_Prisoner");
            equipItem(id, "ItMw_2H_Axe_L_01");
        }
    },
	{
		name = "Men-at-arms",
		guild = "Castle",
		description = "Become the help of great warriors protecting themselves from the evil orcs.",
		spawn = [2373.8, 199.73, -1592.02, 0],
		func = function(id) {
			Players[id].setHealth(400);
			Players[id].setMaxHealth(400);
			Players[id].setMana(50);
			Players[id].setMaxMana(50);

			Players[id].setStrength(110);
			Players[id].setDexterity(50);

			Players[id].setOneHandSkill(80);
			Players[id].setTwoHandSkill(80);
			Players[id].setBowSkill(50);
			Players[id].setCrossbowSkill(100);

			Players[id].equipItem("ITAR_MIL_L");
			Players[id].equipItem("ITMW_HELLEBARDE");
			Players[id].giveItem("ITMW_1H_SPECIAL_01", 1);
			Players[id].giveItem("ITMW_2H_SWORD_M_01", 1);
			Players[id].giveItem("ITRW_CROSSBOW_L_02", 1);
			Players[id].giveItem("ITRW_BOLT", 100);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
			Players[id].giveItem("ITFO_BACON", 100);
			Players[id].giveItem("ITFO_WINE", 100);
			Players[id].giveItem("IFTO_XPSTEW", 25);
			Players[id].giveItem("ITAR_GOVERNOR", 1);
			Players[id].giveItem("ITBE_ADDON_STR_10", 1);
			Players[id].giveItem("ITMI_IEDRUMSCHEIT", 1);
			Players[id].giveItem("ITMI_POCKET", 1);
			Players[id].giveItem("ITMI_JOINT", 100);
		},
		_func = function(id){
			giveItem(id, "ITAR_MIL_L", 1);
			giveItem(id, "ITMW_HELLEBARDE", 1);
			equipItem(id, "ITAR_MIL_L");
			equipItem(id, "ITMW_HELLEBARDE");
		}
	},
	{
        name = "Warehouseman",
        guild = "Castle",
        description = "Nothing will happen if a few things disappear, of course if you pay enough.",
        spawn = [131.067, 299.708, 1883.15, 0],
        func = function(id) {
            Players[id].setHealth(450);
            Players[id].setMaxHealth(450);
            Players[id].setMana(50);
            Players[id].setMaxMana(50);

            Players[id].setStrength(120);
            Players[id].setDexterity(70);

            Players[id].setOneHandSkill(80);
            Players[id].setTwoHandSkill(80);
            Players[id].setBowSkill(50);
            Players[id].setCrossbowSkill(100);

            Players[id].equipItem("ItAr_Mil_M");
            Players[id].equipItem("itmw_zweihaender1");
            Players[id].giveItem("itmw_1h_sld_sword", 1);
            Players[id].giveItem("ITMW_2H_SWORD_M_01", 1);
            Players[id].giveItem("ITRW_CROSSBOW_L_02", 1);
            Players[id].giveItem("ITRW_BOLT", 100);
            Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
            Players[id].giveItem("ITFO_BACON", 100);
            Players[id].giveItem("ITFO_WINE", 100);
            Players[id].giveItem("IFTO_XPSTEW", 25);
            Players[id].giveItem("ITAR_GOVERNOR", 1);
            Players[id].giveItem("ITBE_ADDON_STR_10", 1);
            Players[id].giveItem("ITMI_IEDRUMSCHEIT", 1);
            Players[id].giveItem("ITMI_POCKET", 1);
            Players[id].giveItem("ITMI_JOINT", 100);
        },
        _func = function(id){
            giveItem(id, "ItAr_Mil_M", 1);
            giveItem(id, "itmw_zweihaender1", 1);
            equipItem(id, "ItAr_Mil_M");
            equipItem(id, "itmw_zweihaender1");
        }
    },
	{
		name = "Knight",
		guild = "Castle",
		description = "Fight or die with the orcs. Become a legend, defeat the dragon and win the hand of the princess.",
		spawn = [-767.525, 199.507, 2.63988, 0],
		func = function(id) {
			Players[id].setHealth(400);
			Players[id].setMaxHealth(400);
			Players[id].setMana(80);
			Players[id].setMaxMana(80);

			Players[id].setStrength(130);
			Players[id].setDexterity(70);

			Players[id].setOneHandSkill(90);
			Players[id].setTwoHandSkill(90);
			Players[id].setBowSkill(70);
			Players[id].setCrossbowSkill(100);

			Players[id].equipItem("ItAr_Pal_M");
			Players[id].equipItem("itmw_1h_special_02");
			Players[id].giveItem("itmw_1h_special_02", 1);
			Players[id].giveItem("itmw_2h_special_01", 1);
			Players[id].giveItem("ItRu_PalLight", 1);
			Players[id].giveItem("ItRu_PalLightHeal", 1);
			Players[id].giveItem("itrw_crossbow_m_01", 1);
			Players[id].giveItem("ITRW_BOLT", 100);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
			Players[id].giveItem("ITFO_BACON", 100);
			Players[id].giveItem("ITFO_WINE", 100);
			Players[id].giveItem("IFTO_XPSTEW", 25);
			Players[id].giveItem("ITAR_GOVERNOR", 1);
			Players[id].giveItem("ITBE_ADDON_STR_10", 1);
			Players[id].giveItem("ITMI_IEDRUMSCHEIT", 1);
			Players[id].giveItem("ITMI_POCKET", 1);
			Players[id].giveItem("ITMI_JOINT", 100);
		},
		_func = function(id){
			giveItem(id, "ItAr_Pal_M", 1);
			giveItem(id, "itmw_1h_special_02", 1);
			equipItem(id, "ItAr_Pal_M");
			equipItem(id, "itmw_1h_special_02");
		}
	},
	{
		name = "Paladin",
		guild = "Castle",
		description = "The most dignified of the most dignified. The brightest of the bright. The purest of the purest.",
		spawn = [-1993.89, 0.03, -2798.82, 180.0],
		func = function(id) {
			Players[id].setHealth(400);
			Players[id].setMaxHealth(400);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);

			Players[id].setStrength(150);
			Players[id].setDexterity(100);

			Players[id].setOneHandSkill(100);
			Players[id].setTwoHandSkill(100);
			Players[id].setBowSkill(100);
			Players[id].setCrossbowSkill(100);

			Players[id].equipItem("ItAr_Pal_H");
			Players[id].equipItem("itmw_1h_blessed_02");
			Players[id].giveItem("itmw_1h_blessed_02", 1);
			Players[id].giveItem("itmw_rubinklinge", 1);
			Players[id].giveItem("ItRu_PalLight", 1);
			Players[id].giveItem("ItRu_MasterOfDisaster", 1);
			Players[id].giveItem("ItRu_PalLightHeal", 1);
			Players[id].giveItem("itrw_crossbow_m_01", 1);
			Players[id].giveItem("ITRW_BOLT", 100);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
			Players[id].giveItem("ITFO_BACON", 100);
			Players[id].giveItem("ITFO_WINE", 100);
			Players[id].giveItem("IFTO_XPSTEW", 25);
			Players[id].giveItem("ITAR_GOVERNOR", 1);
			Players[id].giveItem("ITBE_ADDON_STR_10", 1);
			Players[id].giveItem("ITMI_IEDRUMSCHEIT", 1);
			Players[id].giveItem("ITMI_POCKET", 1);
			Players[id].giveItem("ITMI_JOINT", 100);
		},
		_func = function(id){
			giveItem(id, "ItAr_Pal_H", 1);
			giveItem(id, "ITMW_HELLEBARDE", 1);
			equipItem(id, "ItAr_Pal_H");
			equipItem(id, "ITMW_HELLEBARDE");
		}
	}
]