classes <- [
  {
    name = "Knecht",
    guild = "Ludzie",
    description = "...",
    spawn = [-10294.9, -14.5313, -12431.5, 116.979],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 100);
    	setPlayerMaxHealth(id, 100);
    	setPlayerMana(id, 10);
    	setPlayerMaxMana(id, 10);
    	setPlayerStrength(id, 30);
    	setPlayerDexterity(id, 30);
    	setPlayerSkillWeapon(id, WEAPON_1H, 20);
    	setPlayerSkillWeapon(id, WEAPON_2H, 20);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 20);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 20);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_MIL_L"));
      equipMeleeWeapon(id, Items.id("ITMW_1H_VLK_SWORD"));
      equipRangedWeapon(id, Items.id("ITRW_CROSSBOW_L_01"));
      giveItem(id, Items.id("ITRW_BOLT"), 50);
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "¯o³nierz",
    guild = "Ludzie",
    description = "...",
    spawn = [-9339.45, -14.8438, -14685, 294.52],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 150);
    	setPlayerMaxHealth(id, 150);
    	setPlayerMana(id, 10);
    	setPlayerMaxMana(id, 10);
    	setPlayerStrength(id, 50);
    	setPlayerDexterity(id, 50);
    	setPlayerSkillWeapon(id, WEAPON_1H, 30);
    	setPlayerSkillWeapon(id, WEAPON_2H, 30);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 30);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 30);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_MIL_M"));
      equipMeleeWeapon(id, Items.id("ITMW_SHORTSWORD5"));
      equipRangedWeapon(id, Items.id("ITRW_MIL_CROSSBOW"));
      giveItem(id, Items.id("ITRW_BOLT"), 50);
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Mag Ognia",
    guild = "Ludzie",
    description = "...",
    spawn = [-9472.66, -14.7656, -17306.6, 141.935],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 300);
    	setPlayerMaxHealth(id, 300);
    	setPlayerMana(id, 100);
    	setPlayerMaxMana(id, 100);
    	setPlayerStrength(id, 80);
    	setPlayerDexterity(id, 80);
    	setPlayerSkillWeapon(id, WEAPON_1H, 50);
    	setPlayerSkillWeapon(id, WEAPON_2H, 50);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 50);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 50);
    	setPlayerTalent(id, 0, 1);
      setPlayerMagicLevel(id, 6);
      equipArmor(id, Items.id("ITAR_KDF_H"));
      equipMeleeWeapon(id, Items.id("ITMW_ADDON_STAB05"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Rycerz",
    guild = "Ludzie",
    description = "...",
    spawn = [-9579.22, 560.938, -12588.4, 212.693],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 300);
    	setPlayerMaxHealth(id, 300);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 70);
    	setPlayerSkillWeapon(id, WEAPON_2H, 70);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 70);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 70);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_PAL_M"));
      equipMeleeWeapon(id, Items.id("ITMW_2H_PAL_SWORD"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Paladyn",
    guild = "Ludzie",
    description = "...",
    spawn = [-9515.08, 490.625, -16375, 278.035],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 500);
      setPlayerMaxHealth(id, 500);
      setPlayerMana(id, 100);
      setPlayerMaxMana(id, 100);
      setPlayerStrength(id, 120);
      setPlayerDexterity(id, 120);
      setPlayerSkillWeapon(id, WEAPON_1H, 100);
      setPlayerSkillWeapon(id, WEAPON_2H, 100);
      setPlayerSkillWeapon(id, WEAPON_BOW, 100);
      setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
      setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_PAL_H"));
      equipMeleeWeapon(id, Items.id("ITMW_2H_BLESSED_02"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
//
  {
    name = "Ork Zwiadowca",
    guild = "Orkowie",
    description = "...",
    spawn = [-18909.5, 2094.61, 14631.3, 290.703],
    func = function(id) {
      setPlayerInstance(id, "ORCWARRIOR_HARAD");
      setPlayerHealth(id, 100);
    	setPlayerMaxHealth(id, 100);
    	setPlayerMana(id, 10);
    	setPlayerMaxMana(id, 10);
      setPlayerStrength(id, 30);
    	setPlayerDexterity(id, 30);
    	setPlayerSkillWeapon(id, WEAPON_1H, 20);
    	setPlayerSkillWeapon(id, WEAPON_2H, 20);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 20);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 20);
    	setPlayerTalent(id, 0, 1);
      //equipMeleeWeapon(id, Items.id("ITMW_1H_VLK_SWORD"));
      equipRangedWeapon(id, Items.id("ITRW_CROSSBOW_L_1"));
      giveItem(id, Items.id("ITRW_BOLT"), 50);
	//applyPlayerOverlay(id, Mds.id("HUMANS_RELAXED.MDS"));
    }
  },
  {
    name = "Orkowy ¯o³nierz",
    guild = "Orkowie",
    description = "...",
    spawn = [-18909.5, 2094.61, 14631.3, 290.703],
    func = function(id) {
      setPlayerInstance(id, "ORCWARRIOR_ROAM");
      setPlayerHealth(id, 150);
    	setPlayerMaxHealth(id, 150);
    	setPlayerMana(id, 10);
    	setPlayerMaxMana(id, 10);
    	setPlayerStrength(id, 50);
    	setPlayerDexterity(id, 50);
    	setPlayerSkillWeapon(id, WEAPON_1H, 30);
    	setPlayerSkillWeapon(id, WEAPON_2H, 30);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 30);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 30);
    	setPlayerTalent(id, 0, 1);
      //equipMeleeWeapon(id, Items.id("ITMW_SHORTSWORD5"));
      equipRangedWeapon(id, Items.id("ITRW_MIL_CROSSBOW"));
      giveItem(id, Items.id("ITRW_BOLT"), 50);
	//applyPlayerOverlay(id, Mds.id("HUMANS_RELAXED.MDS"));
    }
  },
  {
    name = "Orkowy Szaman",
    guild = "Orkowie",
    description = "...",
    spawn = [-14777, 2207.73, 20490.5, 285.88],
    func = function(id) {
      setPlayerInstance(id, "ORCSHAMAN_SIT");
      setPlayerHealth(id, 300);
    	setPlayerMaxHealth(id, 300);
    	setPlayerMana(id, 100);
    	setPlayerMaxMana(id, 100);
    	setPlayerStrength(id, 80);
    	setPlayerDexterity(id, 80);
    	setPlayerSkillWeapon(id, WEAPON_1H, 50);
    	setPlayerSkillWeapon(id, WEAPON_2H, 50);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 50);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 50);
    	setPlayerTalent(id, 0, 1);
      setPlayerMagicLevel(id, 6);
      //equipMeleeWeapon(id, Items.id("ITMW_SCHWERT1"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_RELAXED.MDS"));
    }
  },
  {
    name = "Elitarny Orkowy Wojownik",
    guild = "Orkowie",
    description = "...",
    spawn = [-15199.5, 2627.73, 23170, 267.439],
    func = function(id) {
      setPlayerInstance(id, "ORCELITE_ROAM");
      setPlayerHealth(id, 300);
    	setPlayerMaxHealth(id, 300);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 70);
    	setPlayerSkillWeapon(id, WEAPON_2H, 70);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 70);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 70);
    	setPlayerTalent(id, 0, 1);
      //equipMeleeWeapon(id, Items.id("ITMW_STREITAXT1"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_RELAXED.MDS"));
    }
  },
  {
    name = "Orkowy Genera³",
    guild = "Orkowie",
    description = "...",
    spawn = [-20038.7, 2207.66, 20490.5, 77.8558],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "ORCELITE_ANTIPALADIN");
      setPlayerHealth(id, 500);
    	setPlayerMaxHealth(id, 500);
    	setPlayerMana(id, 100);
    	setPlayerMaxMana(id, 100);
    	setPlayerStrength(id, 120);
    	setPlayerDexterity(id, 120);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      //equipMeleeWeapon(id, Items.id("ITMW_2H_SPECIAL_02"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_RELAXED.MDS"));
    }
  },
//
  {
    name = "£owca Smoków",
    guild = "VIP",
    description = "...",
    spawn = [-23257.2, 1566.56, -4629.22, 109.382],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_DJG_M"));
      equipMeleeWeapon(id, Items.id("ITMW_RUBINKLINGE"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Najemnik Orków",
    guild = "VIP",
    description = "...",
    spawn = [-17389.1, 2094.69, 15068.3, 254.453],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_RAVEN_ADDON"));
      equipMeleeWeapon(id, Items.id("ITMW_RUBINKLINGE"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Jaszczurocz³ek",
    guild = "VIP",
    description = "...",
    spawn = [-20176.1, 2094.61, 15237.9, 241.45],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "DRACONIAN");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      //equipMeleeWeapon(id, Items.id("ITMW_RUBINKLINGE"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Mag Wody",
    guild = "VIP",
    description = "...",
    spawn = [-21066.1, 1496.33, -3869.69, 242.95],
    serial = ["b1fc75842d3778c0981fc0dc857e46901b64bd5",
		          "50d78fc177c4a7764b40795c6393a237cc78a0e",
              "60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 100);
    	setPlayerMaxMana(id, 100);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      setPlayerMagicLevel(id, 6);
      equipArmor(id, Items.id("ITAR_KDW_H"));
      equipMeleeWeapon(id, Items.id("ITMW_ADDON_STAB05"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MAGE.MDS"));
    }
  },
  {
    name = "Nekromanta",
    guild = "VIP",
    description = "...",
    spawn = [-17351.3, 2357.73, 17654.8, 354.095],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 100);
    	setPlayerMaxMana(id, 100);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      setPlayerMagicLevel(id, 6);
      equipArmor(id, Items.id("ITAR_XARDAS"));
      equipMeleeWeapon(id, Items.id("ITMW_ADDON_STAB05"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MAGE.MDS"));
    }
  },
  {
    name = "Upad³y Paladyn",
    guild = "VIP",
    description = "...",
    spawn = [-20336.6, 2407.73, 17546, 90.4353],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "SKELETON_LORD");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_PAL_SKEL"));
      equipMeleeWeapon(id, Items.id("ITMW_ZWEIHAENDER1"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Ork O¿ywieniec",
    guild = "VIP",
    description = "...",
    spawn = [-20078.5, 2627.73, 23445.6, 108.08],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "UNDEADORCWARRIOR");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 100);
    	setPlayerMaxMana(id, 100);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      equipMeleeWeapon(id, Items.id("ITMW_ZWEIHAENDER1"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
//
  {
    name = "Arkhan Qualshy",
    guild = "Klasa Prywatna",
    description = "Podró¿nik, który zwiedza ka¿dy zakamarek œwiata.",
    spawn = [-22886.3, 1420, -857.5, 133.096],
    serial = ["60c5ac7101bcb18ad14d6f90de0838814bd261a"],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_RANGER_ADDON"));
      equipMeleeWeapon(id, Items.id("ITMW_1H_SPECIAL_02"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_MILITIA.MDS"));
    }
  },
  {
    name = "Spazzmaticus",
    guild = "Klasa Prywatna",
    description = "Ten drañ nie ma nawet z³ota!",
    spawn = [-22886.3, 1420, -857.5, 133.096],
    serial = ["3e8fdeba74409ee806a3e750ae3649e4f454920"],
    func = function(id) {
      setPlayerInstance(id, "PC_HERO");
      setPlayerHealth(id, 400);
    	setPlayerMaxHealth(id, 400);
    	setPlayerMana(id, 75);
    	setPlayerMaxMana(id, 75);
    	setPlayerStrength(id, 100);
    	setPlayerDexterity(id, 100);
    	setPlayerSkillWeapon(id, WEAPON_1H, 100);
    	setPlayerSkillWeapon(id, WEAPON_2H, 100);
    	setPlayerSkillWeapon(id, WEAPON_BOW, 100);
    	setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
    	setPlayerTalent(id, 0, 1);
      equipArmor(id, Items.id("ITAR_RANGER_ADDON"));
      equipMeleeWeapon(id, Items.id("ITMW_2H_SPECIAL_01"));
	//applyPlayerOverlay(id, Mds.id("HUMANS_.MDS"));
    }
  }
];
