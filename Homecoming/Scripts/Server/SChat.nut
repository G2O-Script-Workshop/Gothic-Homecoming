addEventHandler("onPlayerMessage", function(pid, message) {
    local serverType = getServerType(Players[pid].getVirtualWorld());

    if(serverType && serverType.handleChatMessage(pid, message)) {
        // Server type handled it
        Log("log_chat.txt", format("%s: %s", Players[pid].getName(), message));
        return;
    }

    // Fallback to default proximity chat
    local nearPlayers = findNearbyPlayers(
        getPlayerPosition(pid), 2000,
        Players[pid].getWorld(),
        Players[pid].getVirtualWorld()
    );
    foreach(player in nearPlayers) {
        sendMessageToPlayer(player, 255, 255, 255,
            format("%s: %s", Players[pid].getName(), message));
    }

    Log("log_chat.txt", format("%s: %s", Players[pid].getName(), message));
});

addEventHandler("onPlayerCommand", function(pid, cmd, params) {
    cmd = cmd.tolower();

    local serverType = getServerType(Players[pid].getVirtualWorld());

    if(serverType && serverType.handleCommand(pid, cmd, params)) {
        return; // Command handled by server type
    }

    // Handle global commands here
});