ServerTypes <- {};

function registerServerType(vserverId, serverTypeInstance) {
    ServerTypes[vserverId] <- serverTypeInstance;
}

function getServerType(vserverId) {
    return vserverId in ServerTypes ? ServerTypes[vserverId] : null;
}

// Initialize all server types
function initializeServerTypes() {
    // Classic RP servers
    registerServerType(virtualServers.khorinisRPClassic, ClassicRPServer());
    registerServerType(virtualServers.valleyRPClassic, ClassicRPServer());
    registerServerType(virtualServers.wastelandRPClassic, ClassicRPServer());
    registerServerType(virtualServers.jarkendarRPClassic, ClassicRPServer());
    registerServerType(virtualServers.irdorathRPClassic, ClassicRPServer());
    registerServerType(virtualServers.colonyRPClassic, ClassicRPServer());

    // Classic DM servers
    registerServerType(virtualServers.khorinisDMClassic, ClassicDMServer());
    registerServerType(virtualServers.valleyDMClassic, ClassicDMServer());
    // ... etc

    // Example: Add new Basic RP server
    // registerServerType(virtualServers.khorinisRPBasic, BasicRPServer());
}