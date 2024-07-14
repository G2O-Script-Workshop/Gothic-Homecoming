classes[virtualServers.jarkendarDMClassic] <- [
		{
			name = "Bandit Boss",
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