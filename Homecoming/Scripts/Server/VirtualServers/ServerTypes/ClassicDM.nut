class ClassicDMServer extends BaseServerType {
    constructor() {
        base.constructor({
            allowProximityChat = false, // DM might use team/global only
            allowGlobalChat = true,
            globalChatPrefix = ""
        });
    }
}