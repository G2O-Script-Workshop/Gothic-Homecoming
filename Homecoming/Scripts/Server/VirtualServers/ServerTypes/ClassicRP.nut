class ClassicRPServer extends BaseServerType {
    constructor() {
        base.constructor({
            allowProximityChat = true,
            proximityChatRange = 2000,
            allowGlobalChat = true,
            globalChatPrefix = "!"
        });
    }

    function onClassSelected(pid, classId) {
        local synchronizeTimePacket = SynchronizeTimeMessage(pid,
            getTime().hour, getTime().min).serialize();
        synchronizeTimePacket.send(pid, RELIABLE);

        sendMessageToAll(0, 255, 0, format("%s joined the game.", Players[pid].getName()));
    }
}