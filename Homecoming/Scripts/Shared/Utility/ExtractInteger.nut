function extractInteger(name, findStr) {
    local index = 999;
    do {
        index = name.find(findStr);
        if (index != null) {
            name = name.slice(index + findStr.len());
        }
    } while (index != null);
    return name.tointeger();
}