local discord = Discord.activity;
local g2oicon = discord.assets.largeImage;

function initDiscordActivity(){
	discord.details = "Gothic Multiplayer";
	discord.state = "Logging in...";
	/* discord.assets.smallImage = g2oicon; */
	discord.assets.largeImage = "https://imgur.com/WTyx8W8.png";
	discord.update();
}

function updateDiscordState(stringFormat){
	discord.state = stringFormat;
	discord.update();
}