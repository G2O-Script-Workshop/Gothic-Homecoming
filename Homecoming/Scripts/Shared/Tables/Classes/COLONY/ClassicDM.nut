classes[virtualServers.colonyDMClassic] <- [
	{
		name = "Elite Guard",
		guild = "Old Camp",
		description = "A veteran guard with unmatched skills in combat and tactics.",
		spawn = [-2019.0, 200.03, -2475.39, 260.0],
		func = function(id) {
			Players[id].setHealth(750);
			Players[id].setMaxHealth(750);
			Players[id].setStrength(145);
			Players[id].setMana(300);
			Players[id].setMaxMana(300);
			Players[id].setDexterity(160);

			Players[id].equipItem("itmw_zweihaender3");
			Players[id].equipItem("ITRW_CROSSBOW_M_01");
			Players[id].equipItem("ITAR_THORUS_ADDON");

			Players[id].giveItem("ItFo_Apple", 20);
			Players[id].giveItem("ItFo_Bacon", 20);
			Players[id].giveItem("ItFo_Bread", 10);
			Players[id].giveItem("ItFo_Wine", 20);
			Players[id].giveItem("ItRw_Bolt", 300);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 25);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 25);
			Players[id].giveItem("ITKE_PASS_MIS", 1);
		},
		_func = function(id){
			giveItem(id, "itmw_zweihaender3", 1);
			giveItem(id, "ITRW_CROSSBOW_M_01", 1);
			giveItem(id, "ITAR_THORUS_ADDON", 1);
			equipItem(id, "itmw_zweihaender3");
			equipItem(id, "ITRW_CROSSBOW_M_01");
			equipItem(id, "ITAR_THORUS_ADDON");
		}
	},
	{
		name = "Ore Baron",
		guild = "Old Camp",
		description = "A powerful noble with vast resources and a commanding presence in combat.",
		spawn = [-1855.98, -31.811, -3070.71, 142.253],
		func = function(id) {
			Players[id].setHealth(1000);
			Players[id].setMaxHealth(1000);
			Players[id].setStrength(200);
			Players[id].setMana(500);
			Players[id].setMaxMana(500);
			Players[id].setDexterity(200);

			Players[id].equipItem("ITMW_STURMBRINGER");
			Players[id].equipItem("ITRW_CROSSBOW_H_01");
			Players[id].equipItem("ITAR_OreBaron_Addon");

			Players[id].giveItem("ItFo_Apple", 30);
			Players[id].giveItem("ItFo_Bacon", 30);
			Players[id].giveItem("ItFo_Bread", 20);
			Players[id].giveItem("ItFo_Wine", 30);
			Players[id].giveItem("ItRw_Bolt", 500);
			Players[id].giveItem("ItMi_Addon_WhitePearl", 10);
			Players[id].giveItem("ITFO_CHEESE", 30);
			Players[id].giveItem("ITAR_THORUS_ADDON", 1);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 35);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 35);
			Players[id].giveItem("ITKE_PASS_MIS", 1);
		},
		_func = function(id){
			giveItem(id, "ITMW_STURMBRINGER", 1);
			giveItem(id, "ITRW_CROSSBOW_H_01", 1);
			giveItem(id, "ITAR_OreBaron_Addon", 1);
			equipItem(id, "ITMW_STURMBRINGER");
			equipItem(id, "ITRW_CROSSBOW_H_01");
			equipItem(id, "ITAR_OreBaron_Addon");
		}
	},
	{
		name = "Rogue",
		guild = "New Camp",
		description = "A troublesome figure skilled in archery and melee, causing chaos wherever they go.",
		spawn = [-52999.2, 2633.23, 12127.6, 142.253],
		func = function(id) {
			Players[id].setHealth(250);
			Players[id].setMaxHealth(250);
			Players[id].setStrength(90);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(90);

			Players[id].equipItem("ITMW_BARTAXT");
			Players[id].equipItem("ITRW_BOW_M_01");
			Players[id].equipItem("ITAR_BDT_M");

			Players[id].giveItem("ItFo_Apple", 15);
			Players[id].giveItem("ItFo_Bacon", 15);
			Players[id].giveItem("ItFo_Bread", 15);
			Players[id].giveItem("ItFo_Wine", 15);
			Players[id].giveItem("ItRw_ARROW", 200);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 15);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 15);
			Players[id].giveItem("ITMI_LUTE", 2);
			Players[id].giveItem("ITMI_JOINT", 12);
		},
		_func = function(id){
			giveItem(id, "ITMW_BARTAXT", 1);
			giveItem(id, "ITRW_BOW_M_01", 1);
			giveItem(id, "ITAR_BDT_M", 1);
			equipItem(id, "ITMW_BARTAXT");
			equipItem(id, "ITRW_BOW_M_01");
			equipItem(id, "ITAR_BDT_M");
		}
	},
	{
		name = "Elite Mercenary",
		guild = "New Camp",
		description = "An elite fighter with top-notch skills and an array of powerful weapons.",
		spawn = [-59950.8, 3722.0, 10719.4, 142.253],
		func = function(id) {
			Players[id].setHealth(700);
			Players[id].setMaxHealth(700);
			Players[id].setStrength(160);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(160);

			Players[id].equipItem("itmw_barbarenstreitaxt");
			Players[id].equipItem("ITRW_BOW_H_02");
			Players[id].equipItem("ITAR_SLD_H");

			Players[id].giveItem("ItFo_Apple", 30);
			Players[id].giveItem("ItFo_Bacon", 30);
			Players[id].giveItem("ItFo_Bread", 30);
			Players[id].giveItem("ItFo_Wine", 30);
			Players[id].giveItem("ItRw_ARROW", 500);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 30);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 30);
		},
		_func = function(id){
			giveItem(id, "itmw_barbarenstreitaxt", 1);
			giveItem(id, "ITRW_BOW_H_02", 1);
			giveItem(id, "ITAR_SLD_H", 1);
			equipItem(id, "itmw_barbarenstreitaxt");
			equipItem(id, "ITRW_BOW_H_02");
			equipItem(id, "ITAR_SLD_H");
		}
	}
]