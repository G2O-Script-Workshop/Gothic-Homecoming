classes[virtualServers.khorinisDMClassic] <- [
		{
			name = "Guard",
			guild = "City of Khorinis",
			description = "Protect all citizens of Khorinis from bandits, station in the city or nearby areas.",
			spawn = [6251.07, 553.635, 4349.36, 0],
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
			name = "Elite Guard",
			guild = "City of Khorinis",
			description = "Protect all citizens of Khorinis from bandits, station in the city or nearby areas.",
			spawn = [2882.27, 848.125, 6572.34, 87.837],
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

				Players[id].equipItem("ITAR_MIL_M");
				Players[id].equipItem("ITMW_SHORTSWORD5");
				Players[id].equipItem("ITRW_MIL_CROSSBOW");
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
				giveItem(id, "ITAR_MIL_M", 1);
				giveItem(id, "ITMW_SHORTSWORD5", 1);
				giveItem(id, "ITMW_MIL_CROSSBOW", 1);
				equipItem(id, "ITAR_MIL_M");
				equipItem(id, "ITMW_SHORTSWORD5");
				equipItem(id, "ITMW_MIL_CROSSBOW");
			}
		},

		{
			name = "Mercenary",
			guild = "Mercenaries",
			description = "Defend farmers from bandits, embark on missions gaining glory!",
			spawn = [73965.3, 3265.16, -11976.7, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(80);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(55);
				Players[id].setTwoHandSkill(55);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_SLD_M");
				Players[id].equipItem("ITMW_2H_ORCAXE_01");
				Players[id].giveItem("ITMW_2H_SWORD_M_01", 1);
				Players[id].giveItem("ITRW_BOW_L_03", 1);
				Players[id].giveItem("ITRW_ARROW", 100);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("IFTO_XPSTEW", 25);
				Players[id].giveItem("ITAT_WOLFFUR", 10);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_SLD_M", 1);
				giveItem(id, "ITMW_2H_ORCAXE_01", 1);
				equipItem(id, "ITAR_SLD_M");
				equipItem(id, "ITMW_2H_ORCAXE_01");
			}
		},
		{
			name = "Elite Mercenary",
			guild = "Mercenaries",
			description = "Defend farmers from bandits, embark on missions gaining glory!",
			spawn = [75500, 3612.19, -9449.69, 211.49],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(80);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(55);
				Players[id].setTwoHandSkill(55);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_SLD_H");
				Players[id].equipItem("ITMW_2H_SPECIAL_02");
				Players[id].giveItem("ITMW_2H_SWORD_M_01", 1);
				Players[id].giveItem("ITRW_BOW_L_03", 1);
				Players[id].giveItem("ITRW_ARROW", 100);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("IFTO_XPSTEW", 25);
				Players[id].giveItem("ITAT_WOLFFUR", 10);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_SLD_H", 1);
				giveItem(id, "ITMW_2H_SPECIAL_02", 1);
				equipItem(id, "ITAR_SLD_H");
				equipItem(id, "ITMW_2H_SPECIAL_02");
			}
		},

		{
			name = "Rogue",
			guild = "Bandits",
			description = "Lead ambushes, rob and rape :) Steal without scruples but watch out for guards.",
			spawn = [49311.9, 1216.55, 6435.06, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(80);
				Players[id].setDexterity(50);

				Players[id].setOneHandSkill(60);
				Players[id].setTwoHandSkill(60);
				Players[id].setBowSkill(60);
				Players[id].setCrossbowSkill(60);

				Players[id].equipItem("ITAR_BDT_H");
				Players[id].equipItem("ITMW_NAGELKEULE");
				Players[id].equipItem("ITRW_BOW_L_03");
				Players[id].giveItem("ITMW_RICHTSTAB", 1);
				Players[id].giveItem("ITMW_SHORTSWORD5", 1);
				Players[id].giveItem("ITRW_ARROW", 100);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_ADDON_RUM", 100);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_BDT_H", 1);
				giveItem(id, "ITMW_NAGELKEULE", 1);
				giveItem(id, "ITRW_BOW_L_03", 1);
				equipItem(id, "ITAR_BDT_H");
				equipItem(id, "ITMW_NAGELKEULE");
				equipItem(id, "ITRW_BOW_L_03");
			}
		},
		{
			name = "Bandit",
			guild = "Bandits",
			description = "If RP isn't your thing and you're a fan of hardcore demolition, this class is for you! :)",
			spawn = [49244.2, 1226.12, 6054.32, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(100);
				Players[id].setDexterity(100);

				Players[id].setOneHandSkill(80);
				Players[id].setTwoHandSkill(80);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_RAVEN_ADDON");
				Players[id].equipItem("ITMW_2H_SLD_SWORD");
				Players[id].giveItem("ITMW_RICHTSTAB", 1);
				Players[id].giveItem("ITMW_SHORTSWORD5", 1);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_ADDON_RUM", 100);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_RAVEN_ADDON", 1);
				giveItem(id, "ITMW_2H_SLD_SWORD", 1);
				equipItem(id, "ITAR_RAVEN_ADDON");
				equipItem(id, "ITMW_2H_SLD_SWORD");
			}
		}
	]