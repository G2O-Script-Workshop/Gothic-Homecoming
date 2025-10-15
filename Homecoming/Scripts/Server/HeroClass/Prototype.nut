local _giveItem = giveItem;
local _equipItem = equipItem;

class PrototypeHero {
	id = -1;

	color = {
		r = -1,
		g = -1,
		b = -1
	};

	name = "";
	class_id = -1;

	instance = "PC_HERO";
	guild = -1;

	level = -1;
	experience = -1;
	learnpoints = -1;

	health = -1;
	max_health = -1;
	mana = -1;
	max_mana = -1;
	strength = -1;
	dexterity = -1;

	onehand = -1;
	twohand = -1;
	bow = -1;
	cbow = -1;

	magic_circle = -1;

	sneaking = -1;
	picklock = -1;
	pickpocket = -1;
	runemaking = -1;
	alchemy = -1;
	smithing = -1;
	trophies = -1;
	acrobatic = -1;

	walk = "HUMANS.MDS";
	visual = {
		bm = "HUM_BODY_NAKED0",
		bt = 8,
		hm = "HUM_HEAD_PONY",
		ht = 18
	};
	scale = {
		x = 1.0,
		y = 1.0,
		z = 1.0,
		f = 1.0
	};

	world = "NEWWORLD\\NEWWORLD.ZEN";
	virtual_world = -1;
	pos = {
		x = 0.0,
		y = 0.0,
		z = 0.0,
		a = 0.0
	};

	function setColor(r, g, b){
		this.color = {
			r = convert(r, "integer"),
			g = convert(g, "integer"),
			b = convert(b, "integer")
		};

		setPlayerColor(this.id, this.color.r, this.color.g, this.color.b);
	}

	function setColorHex(hex){
		hex = hexToRgb(convert(hex, "string"));

		this.color = {
			r = convert(hex.r, "integer"),
			g = convert(hex.g, "integer"),
			b = convert(hex.b, "integer")
		};

		setPlayerColor(this.id, this.color.r, this.color.g, this.color.b);
	}

	function getColor(){
		return this.color;
	}

	function getColorHex(){
		return rgbToHex(this.color.r, this.color.g, this.color.b);
	}


		// Hero Functions

	function setName(name){
		this.name = convert(name, "string");
		setPlayerName(this.id, this.name);
	}

	function getName(){
		return this.name;
	}


	function setInstance(instance){
		this.instance = convert(instance, "string");

		if(this.instance == "PC_HERO") this.setVisual(this.visual.bm, this.visual.bt, this.visual.hm, this.visual.ht);
	}

	function getInstance(){
		return this.instance;
	}


	function setGuild(guild){
		this.guild = convert(guild, "integer");

		/* local setHeroGuild = HeroStatsMessage_Guild(this.id,
			this.guild
			).serialize();
		setHeroGuild.send(this.id, RELIABLE_ORDERED); */
	}

	function getGuild(){
		return this.guild;
	}


	function setLevel(level){
		this.level = convert(level, "integer");

		/* local setHeroLevel = HeroStatsMessage_Level(this.id,
			this.level
			).serialize();
		setHeroLevel.send(this.id, RELIABLE_ORDERED); */
	}

	function getLevel(){
		return this.level;
	}


	function setExperience(experience){
		this.experience = convert(experience, "integer");

		/* local setHeroEXP = HeroStatsMessage_EXP(this.id,
			this.experience
			).serialize();
		setHeroEXP.send(this.id, RELIABLE_ORDERED); */
	}

	function getExperience(){
		return this.experience;
	}


	function setLearnPoints(learnpoints){
		this.learnpoints = convert(learnpoints, "integer");

		/* local setHeroLP = HeroStatsMessage_LP(this.id,
			this.learnpoints
			).serialize();
		setHeroLP.send(this.id, RELIABLE_ORDERED); */
	}

	function getLearnPoints(){
		return this.learnpoints;
	}


	function setHealth(hp){
		this.health = convert(hp, "integer");

		setPlayerHealth(this.id, this.health);
	}

	function getHealth(){
		return this.health;
	}


	function setMaxHealth(max_hp){
		this.max_health = convert(max_hp, "integer");

		setPlayerMaxHealth(this.id, this.max_health);
	}

	function getMaxHealth(){
		return this.max_health;
	}


	function setMana(mp){
		this.mana = convert(mp, "integer");

		setPlayerMana(this.id, this.mana);
	}

	function getMana(){
		return this.mana;
	}


	function setMaxMana(max_mp){
		this.max_mana = convert(max_mp, "integer");

		setPlayerMaxMana(this.id, this.max_mana);
	}

	function getMaxMana(){
		return this.max_mana;
	}


	function setStrength(str){
		this.strength = convert(str, "integer");

		setPlayerStrength(this.id, this.strength);
	}

	function getStrength(){
		return this.strength;
	}


	function setDexterity(dex){
		this.dexterity = convert(dex, "integer");

		setPlayerDexterity(this.id, this.dexterity);
	}

	function getDexterity(){
		return this.dexterity;
	}


	function setOneHandSkill(onehand){
		if (onehand > 100) onehand = 100;
		this.onehand = convert(onehand, "integer");

		setPlayerSkillWeapon(this.id, WEAPON_1H, this.onehand);
	}

	function getOneHandSkill(){
		return this.onehand;
	}


	function setTwoHandSkill(twohand){
		if (twohand > 100) twohand = 100;
		this.twohand = convert(twohand, "integer");

		setPlayerSkillWeapon(this.id, WEAPON_2H, this.twohand);
	}

	function getTwoHandSkill(){
		return this.twohand;
	}


	function setBowSkill(bow){
		if (bow > 100) bow = 100;
		this.bow = convert(bow, "integer");

		setPlayerSkillWeapon(this.id, WEAPON_BOW, this.bow);
	}

	function getBowSkill(){
		return this.bow;
	}


	function setCrossbowSkill(cbow){
		if (cbow > 100) cbow = 100;
		this.cbow = convert(cbow, "integer");

		setPlayerSkillWeapon(this.id, WEAPON_CBOW, this.cbow);
	}

	function getCrossbowSkill(){
		return this.cbow;
	}


	function setMagicCircle(level){
		if (level > 6) level = 6;
		this.magic_circle = convert(level, "integer");

		setPlayerTalent(this.id, TALENT_MAGE, this.magic_circle);
	}

	function getMagicCircle(){
		return this.magic_circle;
	}


	function setSneakTalent(arg){
		this.sneaking = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_SNEAK, this.sneaking);
	}

	function getSneakTalent(){
		return this.sneak;
	}


	function setPicklockTalent(arg){
		this.picklock = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_PICK_LOCKS, this.picklock);
	}

	function getPicklockTalent(){
		return this.picklock;
	}


	function setPickpocketTalent(arg){
		this.pickpocket = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_PICKPOCKET, this.pickpocket);
	}

	function getPickpocketTalent(){
		return this.pickpocket;
	}


	function setRunemakingTalent(arg){
		this.runemaking = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_RUNES, this.runemaking);
	}

	function getRunemakingTalent(){
		return this.runemaking;
	}


	function setAlchemyTalent(arg){
		this.alchemy = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_ALCHEMY, this.alchemy);
	}

	function getAlchemyTalent(){
		return this.alchemy;
	}


	function setSmithingTalent(arg){
		this.smithing = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_SMITH, this.smithing);
	}

	function getSmithingTalent(){
		return this.smithing;
	}


	function setTrophiesTalent(arg){
		this.trophies = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_THROPHY, this.trophies);
	}

	function getTrophiesTalent(){
		return this.trophies;
	}


	function setAcrobaticTalent(arg){
		this.acrobatic = convert(arg, "integer");

		setPlayerTalent(this.id, TALENT_ACROBATIC, this.acrobatic);
	}

	function getAcrobaticTalent(){
		return this.acrobatic;
	}


	function setWalkstyle(walk){
		this.walk = convert(walk, "string");

		applyPlayerOverlay(this.id, this.walk);
	}

	function resetWalkstyle(){
		removePlayerOverlay(this.id, this.walk);

		this.walk = "HUMANS.MDS"
	}

	function getwalkstyle(){
		return this.walk;
	}


	function setVisual(bodyModel, bodyTexture, headModel, headTexture){
		this.visual = {
			bm = convert(bodyModel, "string"),
			bt = convert(bodyTexture, "integer"),
			hm = convert(headModel, "string"),
			ht = convert(headTexture, "integer")
		};

		setPlayerVisual(this.id, this.visual.bm, this.visual.bt, this.visual.hm, this.visual.ht);
	}

	function getVisual(){
		return this.visual;
	}


	function setScale(x, y, z, fatness){
		this.scale = {
			x = convert(x, "float"),
			y = convert(y, "float"),
			z = convert(z, "float"),
			f = convert(fatness, "float")
		};

		setPlayerScale(this.id, this.scale.x, this.scale.y, this.scale.z);
		setPlayerFatness(this.id, this.scale.f);
	}

	function getScale(){
		return this.scale;
	}


	function setWorld(world){
		if (this.world != world){
			this.world = convert(world, "string");

			setPlayerWorld(this.id, this.world);
		}
	}

	function getWorld(){
		return this.world;
	}


	function setVirtualWorld(vworld){
		this.virtual_world = convert(vworld, "integer");

		setPlayerVirtualWorld(this.id, this.virtual_world);
	}

	function getVirtualWorld(){
		return this.virtual_world;
	}


	function setPosition(x, y, z, angle){
		this.pos = {
			x = convert(x, "float"),
			y = convert(y, "float"),
			z = convert(z, "float"),
			a = convert(angle, "float")
		};

		setPlayerPosition(this.id, this.pos.x, this.pos.y, this.pos.z);
		setPlayerAngle(this.id, this.pos.a);
	}

	function getPosition(){
		local gamepos = getPlayerPosition(this.id);
		local gameang = getPlayerAngle(this.id)

		this.pos = {
			x = convert(gamepos.x, "float"),
			y = convert(gamepos.y, "float"),
			z = convert(gamepos.z, "float"),
			a = convert(gameang, "float")
		};

		return this.pos;
	}

	function setWaypoint(wp){
		local wp_pos = getWaypoint(this.world, convert(wp, "string"));

		if(wp_pos != null){
			this.setPosition(
				wp_pos.x,
				wp_pos.y,
				wp_pos.z,
				0
			);
		} else {
			this.setPosition(
				0.0,
				0.0,
				0.0,
				0
			);
		}
	}

	function respawn(){
		spawnPlayer(this.id);

		this.setVisual(this.visual.bm, this.visual.bt, this.visual.hm, this.visual.ht);

		local class_pos = classes[this.virtual_world][this.class_id].spawn;
		this.setPosition(class_pos[0], class_pos[1], class_pos[2], class_pos[3]);

		this.setClass(this.class_id);
	}

	function spawn(){
		spawnPlayer(this.id);

		local visual = this.getVisual();
		this.setVisual(this.visual.bm, this.visual.bt, this.visual.hm, this.visual.ht);
	}

	function unspawn(){
		unspawnPlayer(this.id);
	}


	function giveItem(instance, amount){
		_giveItem(this.id, instance, amount);
	}

	function equipItem(instance){
		_giveItem(this.id, instance, 1);
		_equipItem(this.id, instance);
	}


	function setClass(classId){
		this.class_id = convert(classId, "integer");

		classes[this.virtual_world][classId].func(this.id);
	}

	function getClass(){
		return this.class_id;
	}



	function init(id, params){
		this.id = id;

		spawnPlayer(this.id);

		this.setName("characterName" in params ? params.name : getPlayerName(id));

		this.setInstance("instance" in params ? params.instance : getPlayerInstance(id));
		this.setGuild("guild" in params ? params.guild : 0)

		this.setLevel("level" in params ? params.level : 1)
		this.setExperience(250 * pow(this.getLevel(), 2))
		this.setLearnPoints(10 * this.getLevel());

		if(isNpc(id)){
			this.setHealth(9999);
			this.setMaxHealth(9999);
			this.setMana(9999);
			this.setMaxMana(9999);
			this.setStrength(9999);
			this.setDexterity(9999);

			this.setOneHandSkill(100);
			this.setTwoHandSkill(100);
			this.setBowSkill(100);
			this.setCrossbowSkill(100);

			this.setMagicCircle(6);

			this.setSneakTalent(true);
			this.setPicklockTalent(true);
			this.setPickpocketTalent(true);
			this.setRunemakingTalent(true);
			this.setAlchemyTalent(true);
			this.setSmithingTalent(true);
			this.setTrophiesTalent(true);
			this.setAcrobaticTalent(true);
		}

		if(!isNpc(id)){
			this.setVisual(
				"visual" in params ? params.visual[0] : getPlayerVisual(id).bodyModel, //"HUM_BODY_NAKED0",
				"visual" in params ? params.visual[1] : getPlayerVisual(id).bodyTxt, //8,
				"visual" in params ? params.visual[2] : getPlayerVisual(id).headModel, //"HUM_HEAD_PONY",
				"visual" in params ? params.visual[3] : getPlayerVisual(id).headTxt //18
			);
			this.setWalkstyle("walk" in params ? params.walk : "HUMANS.MDS");
			this.setScale(
				"scale" in params ? params.scale : getPlayerScale(id).x,
				"scale" in params ? params.scale : getPlayerScale(id).y,
				"scale" in params ? params.scale : getPlayerScale(id).z,
				"fatness" in params ? params.fatness : getPlayerFatness(id)
			);
		}

		this.setWorld("world" in params ? params.world : "NEWWORLD\\NEWWORLD.ZEN");
		this.setVirtualWorld("vworld" in params ? params.vworld : 0);

		if(isNpc(id)){
			this.setWaypoint("wp" in params ? params.wp : "TOT");
		} else {
			this.setPosition(
				"pos" in params ? params.pos[0] : 0.0,
				"pos" in params ? params.pos[1] : 0.0,
				"pos" in params ? params.pos[2] : 0.0,
				"pos" in params ? params.pos[3] : 0.0
			);
		}
	}
}