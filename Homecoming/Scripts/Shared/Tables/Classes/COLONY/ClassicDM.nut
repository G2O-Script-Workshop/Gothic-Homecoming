classes[virtualServers.colonyDMClassic] <- [
		{
			name = "Citizen",
			guild = "City of Khorinis",
			description = "City dweller, find your own home, work, enjoy freedom with others.",
			spawn = [-10512.7, 512.826, -12633.6, 0],
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
			name = "Bandit",
			guild = "Bandits",
			description = "If RP isn't your thing and you're a fan of hardcore demolition, this class is for you! :)",
			spawn = [-9731.34, 434.576, -16815.7, 0],
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