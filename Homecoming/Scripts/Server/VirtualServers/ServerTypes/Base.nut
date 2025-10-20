class BaseServerType {
    config = {
        allowProximityChat = true,
        proximityChatRange = 2000,
        allowGlobalChat = false,
        globalChatPrefix = "!",
        commands = []
    };

    constructor(configOverrides = {}) {
        foreach(key, val in configOverrides) {
            if(key in config) config[key] = val;
        }
    }

    // Override in derived classes
    function onPlayerJoin(pid) {}
    function onClassSelected(pid, classId) {}
    function handleChatMessage(pid, message) { return false; } // return true if handled
    function handleCommand(pid, cmd, params) { return false; }
    function registerCommands() { return []; }
}