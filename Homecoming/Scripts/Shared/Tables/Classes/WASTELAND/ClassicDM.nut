classes[virtualServers.wastelandDMClassic] <- [
	{
		name = "Paladin",
		guild = "Castle",
		description = "The most dignified of the most dignified. The brightest of the bright. The purest of the purest.",
		spawn = [-3522.5, -168.901, -474.529, 0],
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
			giveItem(id, "ITMW_2H_BLESSED_02", 1);
			equipItem(id, "ItAr_Pal_H");
			equipItem(id, "ITMW_2H_BLESSED_02");
		}
	},
	{
		name = "Dragonhunter",
		guild = "Mercenaries",
		description = "Ex-Mercenary, off to his own pointless adventures.",
		spawn = [3394.18, 316.764, -789.345, 0],
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

			Players[id].equipItem("ItAr_DJG_H");
			Players[id].equipItem("ITMW_DRACHENSCHNEIDE");
			Players[id].giveItem("itmw_rubinklinge", 1);
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
			giveItem(id, "ItAr_DJG_H", 1);
			giveItem(id, "ITMW_DRACHENSCHNEIDE", 1);
			equipItem(id, "ItAr_DJG_H");
			equipItem(id, "ITMW_DRACHENSCHNEIDE");
		}
	}
]