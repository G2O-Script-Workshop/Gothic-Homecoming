function initDiscordActivity(){
	DiscordRichPresence.details = "Gothic Multiplayer";
    DiscordRichPresence.state = "Logging in...";

    DiscordRichPresence.largeImageKey = "https://imgur.com/WTyx8W8.png";
    DiscordRichPresence.largeImageText = "Gothic Multiplayer";

    Discord.updatePresence();
}

function updateDiscordState(stateText){
    DiscordRichPresence.state = stateText;
    Discord.updatePresence();
}