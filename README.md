# Gothic-Homecoming
The Gothic Homecoming gamemode is based on how the 2011's Gothic Multiplayer worked, where you simply join a server and choose a class. 

# Features
- Multiple scenes in Menu (depending on present ZEN)
- Server List mockup (based on Virtual Worlds)
- Class Select on Join
- Global Chat under prefix (!) for everyone and distance chat by default
- Playerlist with Class Names (F1)
- World Map (F2)
- Animation Window (F3)
- Net Stats (F4)
- Ability to reconnect to a different Virtual Server by pressing (F9) while in-game
- Player Visual change in Menu
- Client Settings in Menu (WIP)
- Game Options in Menu (WIP)

# How to Run
Clone the code repo:
```bash
git clone https://github.com/G2O-Script-Workshop/Gothic-Homecoming
cd Gothic-Homecoming
```

Make sure to pull submodules too
```bash
git submodule update --init --recursive
git submodule update --remote --force
```

Put 0.3.0 server files in the repo and import the gamemode in `config.xml` file
```xml
<import src="Homecoming/import.xml" />
```

Add the [BASS](https://gitlab.com/GothicMultiplayerTeam/modules/bass) and [LocalStorage](https://gitlab.com/GothicMultiplayerTeam/modules/LocalStorage) modules to the `config.xml` file of your server. Downloading them is not needed.
```xml
<module src="LocalStorage.dll" type="client" />
<module src="sq_bass.dll" type="client" />
```

Allow the Addon to be loaded in the `config.xml`:
```xml
<resource vdf="GMP_Assets.vdf" />
```