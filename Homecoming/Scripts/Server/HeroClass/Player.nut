Players <- {};

class Player extends PrototypeHero {
	login = "";
	password = "";

	serial = "";
	mac = "";
	ip = "";

	authority = -1;

	logged = -1;
	afk = -1;
	invisible = -1;
	whitelist = -1;


		constructor(id, params){
			this.serial = getPlayerSerial(id);
			this.mac = getPlayerMacAddr(id);
			this.ip = getPlayerIP(id);

			this.init(id, params);

			Players[this.id] <- this;
		}


	function setLogin(login){
		this.login = convert(login, "string");
	}

	function getLogin(){
		return this.login;
	}


	function setPassword(password){
		this.password = convert(password, "string");
	}

	function getPassword(){
		return this.password;
	}


	function getSerial(){
		return this.serial;
	}

	function getMacAddress(){
		return this.mac;
	}

	function getIPAddress(){
		return this.ip;
	}


	function setAuthority(permissions){
		this.authority = convert(permissions, "integer");
	}

	function getAuthority(){
		return this.authority;
	}


	function isLogged(){
		return this.logged;
	}


	function setInvisible(state){
		this.invisible = convert(state, "bool");

		setPlayerInvisible(this.id, this.invisible);
	}

	function getInvisible(){
		return this.invisible;
	}
}


addEventHandler("onPlayerDisconnect", function(pid, reason){
	if(isNpc(pid)) return;

	if(pid in Players) delete Players[pid];
});

addEventHandler("onPlayerDead", function(pid, kid){
	if(isNpc(pid)) return;

	Players[pid].unspawn();
});

addEventHandler("onPlayerRespawn", function(pid){
	if(isNpc(pid)) return;

	Players[pid].respawn();
});