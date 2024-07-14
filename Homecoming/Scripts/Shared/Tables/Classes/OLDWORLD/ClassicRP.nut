classes[virtualServers.valleyRPClassic] <- [
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
			spawn = [-1993.89, 0.0368767, -2798.82, 0],
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