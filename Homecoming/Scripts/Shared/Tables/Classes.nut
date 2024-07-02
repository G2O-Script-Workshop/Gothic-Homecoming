classes <- [
	{
		name = "Class1",
		guild = "Guild1",
		description = "Description1",
		spawn = [38609.4, 3910.47, -1259.92, 142.253],
		func = function(id) {
			Players[id].setHealth(100);
			Players[id].setMaxHealth(100);
			Players[id].setMana(10);
			Players[id].setMaxMana(10);

			Players[id].setStrength(10);
			Players[id].setDexterity(10);

			Players[id].setOneHandSkill(20);
			Players[id].setTwoHandSkill(20);
			Players[id].setBowSkill(20);
			Players[id].setCrossbowSkill(20);

			Players[id].setSneakTalent(true);

			Players[id].equipItem("ITAR_MIL_L");
			Players[id].giveItem("ITRW_BOLT", 50);
		},
		_func = function(id){
			giveItem(id, "ITAR_MIL_L", 1);
			giveItem(id, "ITMW_1H_VLK_SWORD", 1);
			giveItem(id, "ITRW_CROSSBOW_L_01",1 );
			equipItem(id, "ITAR_MIL_L");
			equipItem(id, "ITMW_1H_VLK_SWORD");
			equipItem(id, "ITRW_CROSSBOW_L_01");
		}
	},
	{
		name = "Class2",
		guild = "Guild2",
		description = "Description2",
		spawn = [72476.6, 3272.73, -11991.7, 45.2973],
		func = function(id) {
			Players[id].setHealth(100);
			Players[id].setMaxHealth(100);
			Players[id].setMana(10);
			Players[id].setMaxMana(10);

			Players[id].setStrength(10);
			Players[id].setDexterity(10);

			Players[id].setOneHandSkill(20);
			Players[id].setTwoHandSkill(20);
			Players[id].setBowSkill(20);
			Players[id].setCrossbowSkill(20);

			Players[id].setSneakTalent(true);

			Players[id].equipItem("ITAR_MIL_L");
			Players[id].giveItem("ITRW_BOLT", 50);
		},
		_func = function(id){
			giveItem(id, "ITAR_MIL_L", 1);
			giveItem(id, "ITMW_1H_VLK_SWORD", 1);
			giveItem(id, "ITRW_CROSSBOW_L_01",1 );
			equipItem(id, "ITAR_MIL_L");
			equipItem(id, "ITMW_1H_VLK_SWORD");
			equipItem(id, "ITRW_CROSSBOW_L_01");
		}
	},
	{
		name = "Class3",
		guild = "Guild3",
		description = "Description3",
		spawn = [49853.2, 5090.86, 21943.7, 252.711],
		func = function(id) {
			Players[id].setHealth(100);
			Players[id].setMaxHealth(100);
			Players[id].setMana(10);
			Players[id].setMaxMana(10);

			Players[id].setStrength(10);
			Players[id].setDexterity(10);

			Players[id].setOneHandSkill(20);
			Players[id].setTwoHandSkill(20);
			Players[id].setBowSkill(20);
			Players[id].setCrossbowSkill(20);

			Players[id].setSneakTalent(true);

				Players[id].equipItem("ITAR_MIL_L");
				Players[id].giveItem("ITRW_BOLT", 50);
		},
		_func = function(id){
			giveItem(id, "ITAR_MIL_L", 1);
			giveItem(id, "ITMW_1H_VLK_SWORD", 1);
			giveItem(id, "ITRW_CROSSBOW_L_01",1 );
			equipItem(id, "ITAR_MIL_L");
			equipItem(id, "ITMW_1H_VLK_SWORD");
			equipItem(id, "ITRW_CROSSBOW_L_01");
		}
	}
]