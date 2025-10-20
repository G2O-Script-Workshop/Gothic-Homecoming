class BasicRPServer extends BaseServerType {
    constructor() {
        base.constructor({
            allowProximityChat = true,
            proximityChatRange = 1500,
            allowGlobalChat = false
        });
    }

    function registerCommands() {
        return ["b", "me", "do", "w", "s", "y"];
    }

    function handleCommand(pid, cmd, params) {
        switch(cmd) {
            case "b": // OOC chat
                this.broadcastToVirtualWorld(pid, 150, 150, 150,
                    format("(( %s: %s ))", Players[pid].getName(), params));
                return true;

            case "me": // Action text
                this.broadcastProximity(pid, 194, 162, 218,
                    format("* %s %s", Players[pid].getName(), params));
                return true;

            case "do": // Environment description
                this.broadcastProximity(pid, 194, 162, 218,
                    format("* %s *", params));
                return true;

            case "w": // Whisper
                this.broadcastProximity(pid, 255, 255, 255,
                    format("%s whispers: %s", Players[pid].getName(), params), 500);
                return true;

            case "s": // Shout
                this.broadcastProximity(pid, 255, 100, 100,
                    format("%s shouts: %s", Players[pid].getName(), params), 5000);
                return true;

            case "y": // Yell
                this.broadcastToVirtualWorld(pid, 255, 0, 0,
                    format("%s yells: %s", Players[pid].getName(), params));
                return true;
        }
        return false;
    }

    function broadcastProximity(pid, r, g, b, message, range = null) {
        if(range == null) range = config.proximityChatRange;
        local nearPlayers = findNearbyPlayers(
            getPlayerPosition(pid), range,
            Players[pid].getWorld(),
            Players[pid].getVirtualWorld()
        );
        foreach(player in nearPlayers) {
            sendMessageToPlayer(player, r, g, b, message);
        }
    }

    function broadcastToVirtualWorld(pid, r, g, b, message) {
        local vworld = Players[pid].getVirtualWorld();
        foreach(player in Players) {
            if(player.getVirtualWorld() == vworld) {
                sendMessageToPlayer(player.id, r, g, b, message);
            }
        }
    }
}