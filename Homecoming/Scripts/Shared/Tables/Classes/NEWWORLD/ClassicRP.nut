classes[virtualServers.khorinisRPClassic] <- [
		{
			name = "Wanderer",
			guild = "None",
			description = "Adventurer, just like yourself.",
			spawn = [38609.4, 3910.47, -1259.92, 142.253],
			func = function(id) {
				Players[id].setHealth(100);
				Players[id].setMaxHealth(100);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(50);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_LEATHER_L");
				Players[id].equipItem("ITMW_1H_VLK_SWORD");
				Players[id].giveItem("ITMW_SHORTSWORD5", 1);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_BEER", 100);
				Players[id].giveItem("ITFO_BREAD", 100);
				Players[id].giveItem("ITFO_SAUSAGE", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("ITMI_BROOM", 1);
				Players[id].giveItem("ITMI_BRUSH", 1);
				Players[id].giveItem("ITMI_HAMMER", 1);
				Players[id].giveItem("ITMI_LUTE", 1);
				Players[id].giveItem("ITMI_PAN", 1);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_RAKE", 1);
				Players[id].giveItem("ITMI_SAW", 1);
				Players[id].giveItem("ITMI_SILVERRING", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_LEATHER_L", 1);
				giveItem(id, "ITMW_1H_VLK_SWORD", 1);
				equipItem(id, "ITAR_LEATHER_L");
				equipItem(id, "ITMW_1H_VLK_SWORD");
			}
		},
		{
			name = "Hunter",
			guild = "None",
			description = "Travel wherever you want, set up camps, hunt bandits in the forests of Khorinis.",
			spawn = [71901.1, 3205.33, -9038.77, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(70);
				Players[id].setDexterity(100);

				Players[id].setOneHandSkill(60);
				Players[id].setTwoHandSkill(60);
				Players[id].setBowSkill(100);
				Players[id].setCrossbowSkill(100);

				Players[id].equipItem("ITAR_PIR_M_ADDON");
				Players[id].equipItem("ITMW_SHORTSWORD4");
				Players[id].equipItem("ITRW_BOW_L_03");
				Players[id].giveItem("ITMW_2H_SWORD_M_01", 1);
				Players[id].giveItem("ITRW_CROSSBOW_L_02", 1);
				Players[id].giveItem("ITRW_ARROW", 100);
				Players[id].giveItem("ITRW_BOLT", 100);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFOMUTTON", 100);
				Players[id].giveItem("ITFO_APPLE", 100);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_WATER", 100);
				Players[id].giveItem("ITAR_SLD_M", 1);
				Players[id].giveItem("ITAR_DIEGO", 1);
				Players[id].giveItem("ITAT_CLAW", 10);
				Players[id].giveItem("ITAT_WOLFFUR", 10);
				Players[id].giveItem("ITMI_IEDRUMSCHEIT", 1);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_PIR_M_ADDON", 1);
				giveItem(id, "ITMW_SHORTSWORD4", 1);
				giveItem(id, "ITRW_BOW_L_03", 1);
				equipItem(id, "ITAR_PIR_M_ADDON");
				equipItem(id, "ITMW_SHORTSWORD4");
				equipItem(id, "ITRW_BOW_L_03");
			}
		},

		{
			name = "Citizen",
			guild = "City of Khorinis",
			description = "City dweller, find your own home, work, enjoy freedom with others.",
			spawn = [10315.3, 320.096, 4384.52, 0],
			func = function(id) {
				Players[id].setHealth(100);
				Players[id].setMaxHealth(100);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(50);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_VLK_H");
				Players[id].equipItem("ITMW_KRIEGSKEULE");
				Players[id].giveItem("ITMW_SHORTSWORD5", 1);
				Players[id].giveItem("ITAR_VLK_M", 1);
				Players[id].giveItem("ITAR_VLK_L", 1);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_BEER", 100);
				Players[id].giveItem("ITFO_BREAD", 100);
				Players[id].giveItem("ITFO_SAUSAGE", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("ITMI_BROOM", 1);
				Players[id].giveItem("ITMI_BRUSH", 1);
				Players[id].giveItem("ITMI_HAMMER", 1);
				Players[id].giveItem("ITMI_LUTE", 1);
				Players[id].giveItem("ITMI_PAN", 1);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_RAKE", 1);
				Players[id].giveItem("ITMI_SAW", 1);
				Players[id].giveItem("ITMI_SILVERRING", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_VLK_H", 1);
				giveItem(id, "ITMW_KRIEGSKEULE", 1);
				equipItem(id, "ITAR_VLK_H");
				equipItem(id, "ITMW_KRIEGSKEULE");
			}
		},
		{
			name = "Citizen",
			guild = "City of Khorinis",
			description = "City dweller, find your own home, work, enjoy freedom with others.",
			spawn = [8824.39, 160.89, -472.979, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(40);
				Players[id].setDexterity(0);

				Players[id].setOneHandSkill(20);
				Players[id].setTwoHandSkill(0);
				Players[id].setBowSkill(0);
				Players[id].setCrossbowSkill(0);

				Players[id].equipItem("ITAR_VLKBABE_L");
				Players[id].equipItem("ITMW_1H_VLK_DAGGER");
				Players[id].giveItem("ITAR_VLKBABE_M", 1);
				Players[id].giveItem("ITAR_VLKBABE_H", 1);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("ITMI_GOLDRING", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_VLKBABE_L", 1);
				giveItem(id, "ITMW_1H_VLK_DAGGER", 1);
				equipItem(id, "ITAR_VLKBABE_L");
				equipItem(id, "ITMW_1H_VLK_DAGGER");
			}
		},
		{
			name = "Alchemist",
			guild = "City of Khorinis",
			description = "Create potions for the citizens of Khorinis, hire apprentices!",
			spawn = [6811.99, 173.924, -370.107, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(80);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_BAU_M");
				Players[id].equipItem("ITMW_1H_BAU_AXE");
				Players[id].giveItem("ITMI_FLASK", 25);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("IFTO_XPSTEW", 25);
				Players[id].giveItem("ITAT_WOLFFUR", 10);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITWR_ADDON_MANA_04", 1);
				Players[id].giveItem("ITWR_ADDON_HEALTH_04", 1);
				Players[id].giveItem("ITWR_ADDON_MCELIXIER_01", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_BAU_M", 1);
				giveItem(id, "ITMW_1H_BAU_AXE", 1);
				equipItem(id, "ITAR_BAU_M");
				equipItem(id, "ITMW_1H_BAU_AXE");
			}
		},
		{
			name = "Smith",
			guild = "City of Khorinis",
			description = "Work in the forge, find your own home and produce weapons for the residents of Khorinis.",
			spawn = [5825.7, 320.058, -1456.41, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(50);
				Players[id].setMaxMana(50);

				Players[id].setStrength(80);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_SMITH");
				Players[id].equipItem("ITMW_KRIEGSHAMMER1");
				Players[id].giveItem("ITWR_ADDON_AXTANLEITUNG", 1);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_BACON", 100);
				Players[id].giveItem("ITFO_BEER", 100);
				Players[id].giveItem("ITFO_BREAD", 100);
				Players[id].giveItem("ITFO_SAUSAGE", 100);
				Players[id].giveItem("ITFO_WINE", 100);
				Players[id].giveItem("ITMISWORDRAW", 100);
				Players[id].giveItem("ITMISWORDRAWHOT", 100);
				Players[id].giveItem("ITMISWORDBLADE", 100);
				Players[id].giveItem("ITMISWORDBLADEHOT", 100);
				Players[id].giveItem("ITMI_BROOM", 1);
				Players[id].giveItem("ITMI_BRUSH", 1);
				Players[id].giveItem("ITMI_HAMMER", 1);
				Players[id].giveItem("ITMI_LUTE", 1);
				Players[id].giveItem("ITMI_PAN", 1);
				Players[id].giveItem("ITMI_POCKET", 2);
				Players[id].giveItem("ITMI_RAKE", 1);
				Players[id].giveItem("ITMI_SAW", 1);
				Players[id].giveItem("ITMI_SILVERRING", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_SMITH", 1);
				giveItem(id, "ITMW_KRIEGSHAMMER1", 1);
				equipItem(id, "ITAR_SMITH");
				equipItem(id, "ITMW_KRIEGSHAMMER1");
			}
		},
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
			name = "Farmer",
			guild = "Mercenaries",
			description = "Cultivate your own land, manage your chosen farm, hire workers.",
			spawn = [72594.2, 3246.7, -11786.7, 0],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(30);
				Players[id].setMaxMana(30);

				Players[id].setStrength(50);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITAR_BAU_L");
				Players[id].equipItem("ITMW_1H_NOV_MACE");
				Players[id].giveItem("ITMW_SENSE", 1);
				Players[id].giveItem("ITMW_1H_BAU_AXE", 1);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_APPLE", 100);
				Players[id].giveItem("ITFO_BREAD", 100);
				Players[id].giveItem("ITFO_CHEESE", 100);
				Players[id].giveItem("ITFO_MILK", 100);
				Players[id].giveItem("ITFO_WATER", 100);
				Players[id].giveItem("ITAR_BAU_M", 1);
				Players[id].giveItem("ITMI_LUTE", 1);
				Players[id].giveItem("ITMI_PAN", 1);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_RAKE", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ITAR_BAU_L", 1);
				giveItem(id, "ITMW_1H_NOV_MACE", 1);
				equipItem(id, "ITAR_BAU_L");
				equipItem(id, "ITMW_1H_NOV_MACE");
			}
		},
		{
			name = "Farmer",
			guild = "Mercenaries",
			description = "Cultivate your own land, manage your chosen farm, hire workers.",
			spawn = [72476.6, 3272.73, -11991.7, 45.2973],
			func = function(id) {
				Players[id].setHealth(400);
				Players[id].setMaxHealth(400);
				Players[id].setMana(30);
				Players[id].setMaxMana(30);

				Players[id].setStrength(50);
				Players[id].setDexterity(30);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ItAr_BauBabe_L");
				Players[id].equipItem("ITMW_1H_NOV_MACE");
				Players[id].giveItem("ITMW_SENSE", 1);
				Players[id].giveItem("ITMW_1H_BAU_AXE", 1);
				Players[id].giveItem("ITPO_HEALTH_ADDON_04", 5);
				Players[id].giveItem("ITFO_APPLE", 100);
				Players[id].giveItem("ITFO_BREAD", 100);
				Players[id].giveItem("ITFO_CHEESE", 100);
				Players[id].giveItem("ITFO_MILK", 100);
				Players[id].giveItem("ITFO_WATER", 100);
				Players[id].giveItem("ItAr_BauBabe_M", 1);
				Players[id].giveItem("ITMI_LUTE", 1);
				Players[id].giveItem("ITMI_PAN", 1);
				Players[id].giveItem("ITMI_POCKET", 1);
				Players[id].giveItem("ITMI_RAKE", 1);
				Players[id].giveItem("ITMI_JOINT", 100);
			},
			_func = function(id){
				giveItem(id, "ItAr_BauBabe_L", 1);
				giveItem(id, "ITMW_1H_NOV_MACE", 1);
				equipItem(id, "ItAr_BauBabe_L");
				equipItem(id, "ITMW_1H_NOV_MACE");
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