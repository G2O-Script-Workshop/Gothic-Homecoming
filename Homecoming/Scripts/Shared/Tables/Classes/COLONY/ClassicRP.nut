classes[virtualServers.colonyRPClassic] <- [
	{
		name = "Digger",
		guild = "Old Camp",
		description = "A simple laborer skilled with an axe and basic survival skills.",
		spawn = [-6878.56, -1015.39, 833.972, 142.253],
		func = function(id) {
			Players[id].setHealth(100);
			Players[id].setMaxHealth(100);
			Players[id].setStrength(40);
			Players[id].setMana(200);
			Players[id].setMaxMana(200);
			Players[id].setDexterity(30);

			Players[id].equipItem("itmw_2h_axe_l_01");
			Players[id].equipItem("ITAR_PRISONER");

			Players[id].giveItem("ItFo_Apple", 25);
			Players[id].giveItem("ItFo_Water", 50);
			Players[id].giveItem("ITSC_LIGHTMHEAL", 5);
			Players[id].giveItem("ITMI_LUTE", 1);
			Players[id].giveItem("ItPo_Mana_Addon_04", 4);
			Players[id].giveItem("ItPo_Health_Addon_04", 6);
		},
		_func = function(id){
			giveItem(id, "itmw_2h_axe_l_01", 1);
			giveItem(id, "ITAR_PRISONER", 1);
			equipItem(id, "itmw_2h_axe_l_01");
			equipItem(id, "ITAR_PRISONER");
		}
	},
	{
		name = "Shadow",
		guild = "Old Camp",
		description = "A stealthy figure skilled with the sword and bow, lurking in the shadows.",
		spawn = [-4882.7, -774.251, 2979.25, 142.253],
		func = function(id) {
			Players[id].setHealth(300);
			Players[id].setMaxHealth(300);
			Players[id].setStrength(70);
			Players[id].setMana(50);
			Players[id].setMaxMana(50);
			Players[id].setDexterity(120);

			Players[id].equipItem("ITMW_1H_MIL_SWORD");
			Players[id].equipItem("ITRW_BOW_M_04");
			Players[id].equipItem("ITAR_DIEGO");

			Players[id].giveItem("ItFo_Apple", 5);
			Players[id].giveItem("ItFo_Bacon", 5);
			Players[id].giveItem("ItFo_Bread", 1);
			Players[id].giveItem("ItFo_Wine", 5);
			Players[id].giveItem("ItRw_Arrow", 100);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 10);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 10);
		},
		_func = function(id){
			giveItem(id, "ITMW_1H_MIL_SWORD", 1);
			giveItem(id, "ITRW_BOW_M_04", 1);
			giveItem(id, "ITAR_DIEGO", 1);
			equipItem(id, "ITMW_1H_MIL_SWORD");
			equipItem(id, "ITRW_BOW_M_04");
			equipItem(id, "ITAR_DIEGO");
		}
	},
	{
		name = "Guard",
		guild = "Old Camp",
		description = "A well-equipped city guard, vigilant and strong, protecting the streets.",
		spawn = [1881.03, 199.724, -1295.77, 142.253],
		func = function(id) {
			Players[id].setHealth(450);
			Players[id].setMaxHealth(450);
			Players[id].setStrength(115);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(140);

			Players[id].equipItem("itmw_zweihaender1");
			Players[id].equipItem("ITRW_CROSSBOW_M_01");
			Players[id].equipItem("ITAR_BLOODWYN_ADDON");

			Players[id].giveItem("ItFo_Apple", 10);
			Players[id].giveItem("ItFo_Bacon", 10);
			Players[id].giveItem("ItFo_Bread", 2);
			Players[id].giveItem("ItFo_Wine", 10);
			Players[id].giveItem("ItRw_Bolt", 200);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 15);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 15);
		},
		_func = function(id){
			giveItem(id, "itmw_zweihaender1", 1);
			giveItem(id, "ITRW_CROSSBOW_M_01", 1);
			giveItem(id, "ITAR_BLOODWYN_ADDON", 1);
			equipItem(id, "itmw_zweihaender1");
			equipItem(id, "ITRW_CROSSBOW_M_01");
			equipItem(id, "ITAR_BLOODWYN_ADDON");
		}
	},
	{
		name = "Good Guard",
		guild = "Old Camp",
		description = "An elite guard of the city, known for both valor and strength.",
		spawn = [-584.036, 177.799, 970.481, 142.253],
		func = function(id) {
			Players[id].setHealth(600);
			Players[id].setMaxHealth(600);
			Players[id].setStrength(135);
			Players[id].setMana(200);
			Players[id].setMaxMana(200);
			Players[id].setDexterity(155);

			Players[id].equipItem("ITMW_1H_BLESSED_01");
			Players[id].equipItem("ITRW_CROSSBOW_M_01");
			Players[id].equipItem("ITAR_THORUS_ADDON");

			Players[id].giveItem("ItFo_Apple", 15);
			Players[id].giveItem("ItFo_Bacon", 15);
			Players[id].giveItem("ItFo_Bread", 5);
			Players[id].giveItem("ItFo_Wine", 15);
			Players[id].giveItem("ItRw_Bolt", 300);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 20);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 20);
			Players[id].giveItem("ITKE_PASS_MIS", 1);
		},
		_func = function(id){
			giveItem(id, "ITMW_1H_BLESSED_01", 1);
			giveItem(id, "ITRW_CROSSBOW_M_01", 1);
			giveItem(id, "ITAR_THORUS_ADDON", 1);
			equipItem(id, "ITMW_1H_BLESSED_01");
			equipItem(id, "ITRW_CROSSBOW_M_01");
			equipItem(id, "ITAR_THORUS_ADDON");
		}
	},
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
		name = "Chief of Old Camp",
		guild = "Old Camp",
		description = "The governor of the Southern Outpost, a master strategist and a fierce warrior.",
		spawn = [-2679.08, 0.03, -3287.45, 142.253],
		func = function(id) {
			Players[id].setHealth(1300);
			Players[id].setMaxHealth(1300);
			Players[id].setStrength(200);
			Players[id].setMana(500);
			Players[id].setMaxMana(500);
			Players[id].setDexterity(200);

			Players[id].equipItem("ItMw_Drachenschneide");
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
			giveItem(id, "ItMw_Drachenschneide", 1);
			giveItem(id, "ITRW_CROSSBOW_H_01", 1);
			giveItem(id, "ITAR_OreBaron_Addon", 1);
			equipItem(id, "ItMw_Drachenschneide");
			equipItem(id, "ITRW_CROSSBOW_H_01");
			equipItem(id, "ITAR_OreBaron_Addon");
		}
	},

	{
		name = "Mole",
		guild = "New Camp",
		description = "A low-level worker with basic skills in melee combat and survival.",
		spawn = [-49861.0, 2654.95, 15227.7, 142.253],
		func = function(id) {
			Players[id].setHealth(100);
			Players[id].setMaxHealth(100);
			Players[id].setStrength(20);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(20);

			Players[id].equipItem("itmw_2h_axe_l_01");
			Players[id].equipItem("itar_bau_l");

			Players[id].giveItem("ItFo_Apple", 10);
			Players[id].giveItem("ItFo_Bacon", 10);
			Players[id].giveItem("ItFo_Bread", 10);
			Players[id].giveItem("ItFo_Wine", 10);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 10);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 10);
			Players[id].giveItem("ITMI_LUTE", 2);
		},
		_func = function(id){
			giveItem(id, "itmw_2h_axe_l_01", 1);
			giveItem(id, "itar_bau_l", 1);
			equipItem(id, "itmw_2h_axe_l_01");
			equipItem(id, "itar_bau_l");
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
		name = "Chief of Rogues",
		guild = "New Camp",
		description = "The leader of troublemakers, exceptionally skilled and equipped to cause major disruptions.",
		spawn = [-52201.6, 2589.83, 5322.65, 142.253],
		func = function(id) {
			Players[id].setHealth(450);
			Players[id].setMaxHealth(450);
			Players[id].setStrength(120);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(120);

			Players[id].equipItem("ITMW_KRIEGSHAMMER2");
			Players[id].equipItem("ITRW_BOW_M_03");
			Players[id].equipItem("ITAR_BDT_M");

			Players[id].giveItem("ItFo_Apple", 20);
			Players[id].giveItem("ItFo_Bacon", 20);
			Players[id].giveItem("ItFo_Bread", 20);
			Players[id].giveItem("ItFo_Wine", 20);
			Players[id].giveItem("ItRw_ARROW", 300);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 20);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 20);
			Players[id].giveItem("ITMI_SCOOP", 2);
			Players[id].giveItem("ITMI_PAN", 2);
			Players[id].giveItem("ITMI_SAW", 2);
			Players[id].giveItem("ITMI_BROOM", 2);
			Players[id].giveItem("ITMI_RAKE", 2);
			Players[id].giveItem("ITMI_LUTE", 2);
			Players[id].giveItem("ITMI_BRUSH", 2);
			Players[id].giveItem("ITMI_LUTE", 2);
			Players[id].giveItem("ITMI_JOINT", 12);
		},
		_func = function(id){
			giveItem(id, "ITMW_KRIEGSHAMMER2", 1);
			giveItem(id, "ITRW_BOW_M_03", 1);
			giveItem(id, "ITAR_BDT_M", 1);
			equipItem(id, "ITMW_KRIEGSHAMMER2");
			equipItem(id, "ITRW_BOW_M_03");
			equipItem(id, "ITAR_BDT_M");
		}
	},
	{
		name = "Mercenary",
		guild = "New Camp",
		description = "A hired sword known for their combat proficiency and tactical prowess.",
		spawn = [-57665.0, 2706.47, 3211.25, 142.253],
		func = function(id) {
			Players[id].setHealth(450);
			Players[id].setMaxHealth(450);
			Players[id].setStrength(120);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(120);

			Players[id].equipItem("ITMW_SCHWERT5");
			Players[id].equipItem("ITRW_BOW_L_02");
			Players[id].equipItem("ITAR_SLD_L");

			Players[id].giveItem("ItFo_Apple", 25);
			Players[id].giveItem("ItFo_Bacon", 25);
			Players[id].giveItem("ItFo_Bread", 25);
			Players[id].giveItem("ItFo_Wine", 25);
			Players[id].giveItem("ItRw_ARROW", 400);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 25);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 25);
		},
		_func = function(id){
			giveItem(id, "ITMW_SCHWERT5", 1);
			giveItem(id, "ITRW_BOW_L_02", 1);
			giveItem(id, "ITAR_SLD_L", 1);
			equipItem(id, "ITMW_SCHWERT5");
			equipItem(id, "ITRW_BOW_L_02");
			equipItem(id, "ITAR_SLD_L");
		}
	},
	{
		name = "Good Mercenary",
		guild = "New Camp",
		description = "A distinguished mercenary with a noble heart, fighting for just causes.",
		spawn = [-58720.0, 3363.26, 7051.65, 142.253],
		func = function(id) {
			Players[id].setHealth(600);
			Players[id].setMaxHealth(600);
			Players[id].setStrength(145);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(140);

			Players[id].equipItem("ITMW_SCHLACHTAXT");
			Players[id].equipItem("ITRW_BOW_M_04");
			Players[id].equipItem("ITAR_SLD_M");

			Players[id].giveItem("ItFo_Apple", 30);
			Players[id].giveItem("ItFo_Bacon", 30);
			Players[id].giveItem("ItFo_Bread", 30);
			Players[id].giveItem("ItFo_Wine", 30);
			Players[id].giveItem("ItRw_ARROW", 500);
			Players[id].giveItem("ITPO_HEALTH_ADDON_04", 30);
			Players[id].giveItem("ITPO_MANA_ADDON_04", 30);
		},
		_func = function(id){
			giveItem(id, "ITMW_SCHLACHTAXT", 1);
			giveItem(id, "ITRW_BOW_M_04", 1);
			giveItem(id, "ITAR_SLD_M", 1);
			equipItem(id, "ITMW_SCHLACHTAXT");
			equipItem(id, "ITRW_BOW_M_04");
			equipItem(id, "ITAR_SLD_M");
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
	},
	{
		name = "Chief of Mercenaries",
		guild = "New Camp",
		description = "The supreme leader of mercenaries, unmatched in combat and leadership.",
		spawn = [-59679.7, 4118.72, 5043.46, 142.253],
		func = function(id) {
			Players[id].setHealth(1000);
			Players[id].setMaxHealth(1000);
			Players[id].setStrength(200);
			Players[id].setMana(100);
			Players[id].setMaxMana(100);
			Players[id].setDexterity(200);

			Players[id].equipItem("itmw_berserkeraxt");
			Players[id].equipItem("ITRW_BOW_H_03");
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
			giveItem(id, "itmw_berserkeraxt", 1);
			giveItem(id, "ITRW_BOW_H_03", 1);
			giveItem(id, "ITAR_SLD_H", 1);
			equipItem(id, "itmw_berserkeraxt");
			equipItem(id, "ITRW_BOW_H_03");
			equipItem(id, "ITAR_SLD_H");
		}
	}
]