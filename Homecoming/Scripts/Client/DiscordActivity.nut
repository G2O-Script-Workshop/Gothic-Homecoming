local discordActivityEnabled = true;
local currentDiscordState = "Logging in...";

local function clearDiscordPresence(){
        if("clearPresence" in Discord){
                Discord.clearPresence();
        } else {
                DiscordRichPresence.details = "";
                DiscordRichPresence.state = "";
                Discord.updatePresence();
        }
}

function initDiscordActivity(){
        if(!discordActivityEnabled) return;

        DiscordRichPresence.details = "Gothic Multiplayer";
        DiscordRichPresence.state = currentDiscordState;

        DiscordRichPresence.largeImageKey = "https://imgur.com/WTyx8W8.png";
        DiscordRichPresence.largeImageText = "Gothic Multiplayer";

        Discord.updatePresence();
}

function updateDiscordState(stateText){
        currentDiscordState = stateText;

        if(!discordActivityEnabled) return;

        DiscordRichPresence.state = stateText;
        Discord.updatePresence();
}

function setDiscordActivityEnabled(enabled){
        if(discordActivityEnabled == enabled) return;

        discordActivityEnabled = enabled;

        if(discordActivityEnabled){
                initDiscordActivity();
        } else {
                clearDiscordPresence();
        }
}

function isDiscordActivityEnabled(){
        return discordActivityEnabled;
}