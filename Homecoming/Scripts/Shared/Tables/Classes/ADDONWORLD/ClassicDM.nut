classes[virtualServers.jarkendarDMClassic] <- [
		{
			name = "Weak Bandit",
			guild = "Bandits",
			description = "A low-ranking bandit with minimal training and equipment.",
			spawn = [26004.8, -4885.01, 6603.27, 0],
			func = function(id) {
				Players[id].setHealth(300);
				Players[id].setMaxHealth(300);
				Players[id].setStrength(60);
				Players[id].setDexterity(60);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ItMw_1h_Mil_Sword");
				Players[id].equipItem("ItRw_Bow_L_01");
				Players[id].equipItem("ITAR_BDT_M");

				Players[id].giveItem("ItMi_Joint", 16);
				Players[id].giveItem("ITAR_Leather_L", 1);
				Players[id].giveItem("ItFo_Apple", 2);
				Players[id].giveItem("ItLsTorch", 3);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItRw_Arrow", 100);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ItMw_1h_Mil_Sword", 1);
				giveItem(id, "ItRw_Bow_L_01", 1);
				giveItem(id, "ITAR_BDT_M", 1);
				equipItem(id, "ItMw_1h_Mil_Sword");
				equipItem(id, "ItRw_Bow_L_01");
				equipItem(id, "ITAR_BDT_M");
			}
		},
		{
			name = "Bandit",
			guild = "Bandits",
			description = "An experienced bandit equipped with standard gear.",
			spawn = [29417.5, -4484.92, 9305.28, 0],
			func = function(id) {
				Players[id].setHealth(500);
				Players[id].setMaxHealth(500);
				Players[id].setStrength(120);
				Players[id].setDexterity(120);

				Players[id].setOneHandSkill(60);
				Players[id].setTwoHandSkill(60);
				Players[id].setBowSkill(60);
				Players[id].setCrossbowSkill(60);

				Players[id].equipItem("ItMw_1h_Mil_Sword");
				Players[id].equipItem("ItRw_Crossbow_L_01");
				Players[id].equipItem("ItAr_BDT_H");

				Players[id].giveItem("ITAR_Leather_L", 1);
				Players[id].giveItem("ItMi_Joint", 26);
				Players[id].giveItem("ItFo_Apple", 2);
				Players[id].giveItem("ItLsTorch", 3);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItRw_Bolt", 25);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ItMw_1h_Mil_Sword", 1);
				giveItem(id, "ItRw_Crossbow_L_01", 1);
				giveItem(id, "ItAr_BDT_H", 1);
				equipItem(id, "ItMw_1h_Mil_Sword");
				equipItem(id, "ItRw_Crossbow_L_01");
				equipItem(id, "ItAr_BDT_H");
			}
		},
		{
			name = "Right Hand of the Boss",
			guild = "Bandits",
			description = "The trusted lieutenant, skilled in both magic and combat.",
			spawn = [26774.6, -3383.79, 17168.3, 0],
			func = function(id) {
				Players[id].setHealth(1000);
				Players[id].setMaxHealth(1000);
				Players[id].setMana(250);
				Players[id].setMaxMana(250);

				Players[id].setStrength(150);
				Players[id].setDexterity(150);

				Players[id].setOneHandSkill(80);
				Players[id].setTwoHandSkill(80);
				Players[id].setBowSkill(75);
				Players[id].setCrossbowSkill(75);

				Players[id].equipItem("ItMw_1h_Pal_Sword");
				Players[id].equipItem("ITAR_THORUS_ADDON");

				Players[id].giveItem("ITAR_BLOODWYN_ADDON", 1);
				Players[id].giveItem("ItMi_Joint", 6);
				Players[id].giveItem("ItFo_Apple", 2);
				Players[id].giveItem("ItRw_Bolt", 25);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItLsTorch", 3);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ItMw_1h_Pal_Sword", 1);
				giveItem(id, "ITAR_THORUS_ADDON", 1);
				equipItem(id, "ItMw_1h_Pal_Sword");
				equipItem(id, "ITAR_THORUS_ADDON");
			}
		},
		{
			name = "Boss",
			guild = "Bandits",
			description = "The supreme leader of the bandits, immensely powerful and well-equipped.",
			spawn = [25058.8, -2695.84, 15776.6, 0],
			func = function(id) {
				Players[id].setHealth(1200);
				Players[id].setMaxHealth(1200);
				Players[id].setMana(500);
				Players[id].setMaxMana(500);

				Players[id].setStrength(200);
				Players[id].setDexterity(200);

				Players[id].setOneHandSkill(100);
				Players[id].setTwoHandSkill(100);
				Players[id].setBowSkill(80);
				Players[id].setCrossbowSkill(80);

				Players[id].equipItem("ItMw_2H_SPECIAL_04");
				Players[id].equipItem("ITAR_Raven_Addon");
				Players[id].equipItem("ITRW_CROSSBOW_H_02");

				Players[id].giveItem("ITAR_VLK_L", 1);
				Players[id].giveItem("ITAR_MIL_L", 1);
				Players[id].giveItem("ItMi_Joint", 6);
				Players[id].giveItem("ItFo_Apple", 2);
				Players[id].giveItem("ItLsTorch", 3);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItRw_Bolt", 25);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ItMw_2H_SPECIAL_04", 1);
				giveItem(id, "ITAR_Raven_Addon", 1);
				giveItem(id, "ITRW_CROSSBOW_H_02", 1);
				equipItem(id, "ItMw_2H_SPECIAL_04");
				equipItem(id, "ITAR_Raven_Addon");
				equipItem(id, "ITRW_CROSSBOW_H_02");
			}
		},

		{
			name = "Weak Pirate",
			guild = "Pirates",
			description = "A novice pirate, not yet battle-hardened but eager for plunder.",
			spawn = [-34979.2, -1921.48, 19020.3, 0],
			func = function(id) {
				Players[id].setHealth(300);
				Players[id].setMaxHealth(300);
				Players[id].setStrength(60);
				Players[id].setDexterity(60);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ItMw_Addon_PIR1hSword");
				Players[id].equipItem("ItRw_Bow_L_01");
				Players[id].equipItem("ITAR_PIR_L_Addon");

				Players[id].giveItem("ItMi_Joint", 5);
				Players[id].giveItem("ItFo_Apple", 2);
				Players[id].giveItem("ItLsTorch", 3);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItRw_Arrow", 100);
				Players[id].giveItem("ItFo_Addon_Rum", 5);
				Players[id].giveItem("ItFo_Addon_LousHammer", 5);
				Players[id].giveItem("ItFo_Addon_Grog", 5);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ItMw_Addon_PIR1hSword", 1);
				giveItem(id, "ItRw_Bow_L_01", 1);
				giveItem(id, "ITAR_PIR_L_Addon", 1);
				equipItem(id, "ItMw_Addon_PIR1hSword");
				equipItem(id, "ItRw_Bow_L_01");
				equipItem(id, "ITAR_PIR_L_Addon");
			}
		},
		{
			name = "Pirate",
			guild = "Pirates",
			description = "A seasoned pirate, skilled with blade and bow alike.",
			spawn = [-36570.2, -1921.98, 17730.5, 0],
			func = function(id) {
				Players[id].setHealth(500);
				Players[id].setMaxHealth(500);
				Players[id].setStrength(120);
				Players[id].setDexterity(120);

				Players[id].setOneHandSkill(60);
				Players[id].setTwoHandSkill(60);
				Players[id].setBowSkill(60);
				Players[id].setCrossbowSkill(60);

				Players[id].equipItem("ItMw_Addon_PIR1hSword");
				Players[id].equipItem("ItRw_Crossbow_L_01");
				Players[id].equipItem("ITAR_PIR_L_Addon");

				Players[id].giveItem("ItMi_Joint", 6);
				Players[id].giveItem("ItFo_Apple", 2);
				Players[id].giveItem("ItLsTorch", 3);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItRw_Bolt", 25);
				Players[id].giveItem("ItFo_Addon_Rum", 5);
				Players[id].giveItem("ItFo_Addon_LousHammer", 5);
				Players[id].giveItem("ItFo_Addon_Grog", 5);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ItMw_Addon_PIR1hSword", 1);
				giveItem(id, "ItRw_Crossbow_L_01", 1);
				giveItem(id, "ITAR_PIR_L_Addon", 1);
				equipItem(id, "ItMw_Addon_PIR1hSword");
				equipItem(id, "ItRw_Crossbow_L_01");
				equipItem(id, "ITAR_PIR_L_Addon");
			}
		},
		{
			name = "Captain's Right Hand",
			guild = "Pirates",
			description = "The right hand of the pirate captain, cunning and deadly.",
			spawn = [-33345.8, -1906.3, 23455.9, 0],
			func = function(id) {
				Players[id].setHealth(1000);
				Players[id].setMaxHealth(1000);
				Players[id].setMana(250);
				Players[id].setMaxMana(250);

				Players[id].setStrength(150);
				Players[id].setDexterity(150);

				Players[id].setOneHandSkill(80);
				Players[id].setTwoHandSkill(80);
				Players[id].setBowSkill(75);
				Players[id].setCrossbowSkill(75);

				Players[id].equipItem("ITMW_KRUMMSCHWERT");
				Players[id].equipItem("ITAR_PIR_M_Addon");
				Players[id].equipItem("ITRW_CROSSBOW_H_02");

				Players[id].giveItem("ItMi_Joint", 6);
				Players[id].giveItem("ItFo_Apple", 2);
				Players[id].giveItem("ItLsTorch", 3);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItRw_Bolt", 25);
				Players[id].giveItem("ItFo_Addon_Rum", 8);
				Players[id].giveItem("ItFo_Addon_LousHammer", 8);
				Players[id].giveItem("ItFo_Addon_Grog", 8);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ITMW_KRUMMSCHWERT", 1);
				giveItem(id, "ITAR_PIR_M_Addon", 1);
				giveItem(id, "ITRW_CROSSBOW_H_02", 1);
				equipItem(id, "ITMW_KRUMMSCHWERT");
				equipItem(id, "ITAR_PIR_M_Addon");
				equipItem(id, "ITRW_CROSSBOW_H_02");
			}
		},
		{
			name = "Captain",
			guild = "Pirates",
			description = "The fearsome captain of the pirates, unmatched in combat and command.",
			spawn = [-34524.0, -1576.62, 20483.0, 0],
			func = function(id) {
				Players[id].setHealth(1200);
				Players[id].setMaxHealth(1200);
				Players[id].setMana(500);
				Players[id].setMaxMana(500);

				Players[id].setStrength(200);
				Players[id].setDexterity(200);

				Players[id].setOneHandSkill(100);
				Players[id].setTwoHandSkill(100);
				Players[id].setBowSkill(80);
				Players[id].setCrossbowSkill(80);

				Players[id].equipItem("ITMW_KRUMMSCHWERT");
				Players[id].equipItem("ITAR_PIR_H_Addon");
				Players[id].equipItem("ITRW_CROSSBOW_H_02");

				Players[id].giveItem("ItMi_Joint", 8);
				Players[id].giveItem("ItFo_Apple", 8);
				Players[id].giveItem("ItLsTorch", 4);
				Players[id].giveItem("ItFo_Wine", 10);
				Players[id].giveItem("ItRw_Bolt", 25);
				Players[id].giveItem("ItFo_Addon_Rum", 10);
				Players[id].giveItem("ItFo_Addon_LousHammer", 10);
				Players[id].giveItem("ItFo_Addon_Grog", 10);
				Players[id].giveItem("ItPo_Mana_Addon_04", 5);
				Players[id].giveItem("ItPo_Health_Addon_04", 5);
			},
			_func = function(id){
				giveItem(id, "ITMW_KRUMMSCHWERT", 1);
				giveItem(id, "ITAR_PIR_H_Addon", 1);
				giveItem(id, "ITRW_CROSSBOW_H_02", 1);
				equipItem(id, "ITMW_KRUMMSCHWERT");
				equipItem(id, "ITAR_PIR_H_Addon");
				equipItem(id, "ITRW_CROSSBOW_H_02");
			}
		},

		{
			name = "Water Novice",
			guild = "Circle of Water",
			description = "A beginner in the mystical arts of water, just starting to learn.",
			spawn = [-174.782, -675.798, -2495.97, 0],
			func = function(id) {
				Players[id].setHealth(300);
				Players[id].setMaxHealth(300);
				Players[id].setStrength(60);
				Players[id].setDexterity(60);

				Players[id].setOneHandSkill(30);
				Players[id].setTwoHandSkill(30);
				Players[id].setBowSkill(30);
				Players[id].setCrossbowSkill(30);

				Players[id].equipItem("ITMW_1h_nov_mace");
				Players[id].equipItem("ITAR_RANGER_Addon");

				Players[id].giveItem("ItFo_Apple", 3);
				Players[id].giveItem("ItFo_Water", 3);
				Players[id].giveItem("ITSC_LIGHT", 2);
				Players[id].giveItem("ITSC_ZAP", 1);
				Players[id].giveItem("ITSC_LIGHTMHEAL", 3);
				Players[id].giveItem("ITMI_HAMMER", 1);
				Players[id].giveItem("ITMI_RAKE", 1);
				Players[id].giveItem("ITMI_BROOM", 1);
				Players[id].giveItem("ITMI_LUTE", 1);
				Players[id].giveItem("ITMI_BRUSH", 1);
				Players[id].giveItem("ItPo_Mana_Addon_04", 4);
				Players[id].giveItem("ItPo_Health_Addon_04", 6);
			},
			_func = function(id){
				giveItem(id, "ITMW_1h_nov_mace", 1);
				giveItem(id, "ITAR_RANGER_Addon", 1);
				equipItem(id, "ITMW_1h_nov_mace");
				equipItem(id, "ITAR_RANGER_Addon");
			}
		},
		{
			name = "Water Mage",
			guild = "Circle of Water",
			description = "A trained mage of the water, skilled in defensive and ice spells.",
			spawn = [-1021.76, -964.692, -4437.78, 0],
			func = function(id) {
				Players[id].setHealth(500);
				Players[id].setMaxHealth(500);
				Players[id].setMana(250);
				Players[id].setMaxMana(250);

				Players[id].setStrength(120);
				Players[id].setDexterity(120);

				Players[id].setOneHandSkill(60);
				Players[id].setTwoHandSkill(60);
				Players[id].setBowSkill(60);
				Players[id].setCrossbowSkill(60);

				Players[id].equipItem("ITMW_1h_nov_mace");
				Players[id].equipItem("ITAR_KDW_L_Addon");

				Players[id].giveItem("ITRU_ICECUBE", 1);
				Players[id].giveItem("ITRU_MEDIUMHEAL", 1);
				Players[id].giveItem("ITRU_LIGHTNINGFLASH", 1);
				Players[id].giveItem("ITRU_LIGHT", 1);
				Players[id].giveItem("ITRU_THUNDERBALL", 1);
				Players[id].giveItem("ItPo_Mana_Addon_04", 15);
				Players[id].giveItem("ItPo_Health_Addon_04", 10);
			},
			_func = function(id){
				giveItem(id, "ITMW_1h_nov_mace", 1);
				giveItem(id, "ITAR_KDW_L_Addon", 1);
				equipItem(id, "ITMW_1h_nov_mace");
				equipItem(id, "ITAR_KDW_L_Addon");
			}
		},
		{
			name = "Archmage of Water",
			guild = "Circle of Water",
			description = "A powerful archmage of water, commanding both the offensive and defensive aspects of water magic.",
			spawn = [-962.103, -1077.57, -7177.78, 0],
			func = function(id) {
				Players[id].setHealth(1000);
				Players[id].setMaxHealth(1000);
				Players[id].setMana(500);
				Players[id].setMaxMana(500);

				Players[id].setStrength(150);
				Players[id].setDexterity(150);

				Players[id].setOneHandSkill(80);
				Players[id].setTwoHandSkill(80);
				Players[id].setBowSkill(75);
				Players[id].setCrossbowSkill(75);

				Players[id].equipItem("ItMW_Addon_Stab01");
				Players[id].equipItem("ITAR_KDW_H");

				Players[id].giveItem("ITRU_ICECUBE", 1);
				Players[id].giveItem("ITRU_FULLHEAL", 1);
				Players[id].giveItem("ITRU_LIGHTNINGFLASH", 1);
				Players[id].giveItem("ITRU_LIGHT", 1);
				Players[id].giveItem("ITRU_THUNDERBALL", 1);
				Players[id].giveItem("ITRU_WINDFIST", 1);
				Players[id].giveItem("ITRU_ICEWAVE", 1);
				Players[id].giveItem("ItPo_Mana_Addon_04", 20);
				Players[id].giveItem("ItPo_Health_Addon_04", 10);
			},
			_func = function(id){
				giveItem(id, "ItMW_Addon_Stab01", 1);
				giveItem(id, "ITAR_KDW_H", 1);
				equipItem(id, "ItMW_Addon_Stab01");
				equipItem(id, "ITAR_KDW_H");
			}
		},
		{
			name = "Master of the Water Circle",
			guild = "Circle of Water",
			description = "The venerable master of the Water Circle, unmatched in his magical prowess.",
			spawn = [3193.38, -535.981, -3790.11, 0],
			func = function(id) {
				Players[id].setHealth(1200);
				Players[id].setMaxHealth(1200);
				Players[id].setMana(750);
				Players[id].setMaxMana(750);

				Players[id].setStrength(200);
				Players[id].setDexterity(200);

				Players[id].setOneHandSkill(100);
				Players[id].setTwoHandSkill(100);
				Players[id].setBowSkill(80);
				Players[id].setCrossbowSkill(80);

				Players[id].equipItem("ItMW_Addon_Stab04");
				Players[id].equipItem("ITAR_KDW_H");

				Players[id].giveItem("ITRU_ICECUBE", 1);
				Players[id].giveItem("ITRU_FULLHEAL", 1);
				Players[id].giveItem("ITRU_LIGHTNINGFLASH", 1);
				Players[id].giveItem("ITRU_LIGHT", 1);
				Players[id].giveItem("ITRU_THUNDERBALL", 1);
				Players[id].giveItem("ITRU_WINDFIST", 1);
				Players[id].giveItem("ITRU_ICEWAVE", 1);
				Players[id].giveItem("ITRu_Geyser", 1);
				Players[id].giveItem("ItPo_Mana_Addon_04", 20);
				Players[id].giveItem("ItPo_Health_Addon_04", 10);
			},
			_func = function(id){
				giveItem(id, "ItMW_Addon_Stab04", 1);
				giveItem(id, "ITAR_KDW_H", 1);
				equipItem(id, "ItMW_Addon_Stab04");
				equipItem(id, "ITAR_KDW_H");
			}
		}
	]