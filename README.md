# Gothic-Homecoming
The Gothic Homecoming gamemode is based on how the 2011's Gothic Multiplayer worked, where you simply join a server and choose a class. 

# Features
- Multiple scenes in Main Menu
- Server List mockup (based on Virtual Worlds)
- Class Select on Join
- Global Chat under prefix (!) for everyone and distance chat by default
- Playerlist with Class Names (F1)
- World Map (F2)
- Animation Window (F3)
- Net Stats (F4)
- Player Visual change in Menu
- Server Settings in Menu
- Client Options in Menu 

# How to Run
Clone the code repo:
```bash
git clone https://github.com/G2O-Script-Workshop/Gothic-Homecoming
cd Gothic-Homecoming
```

Put 0.3.0 server files in the repo and import the gamemode in `config.xml` file
```xml
<import src="Homecoming/import.xml" />
```

Download the [BASS](https://gitlab.com/GothicMultiplayerTeam/modules/bass) and [LocalStorage](https://gitlab.com/GothicMultiplayerTeam/modules/LocalStorage) modules, adding them to the `config.xml` file of your server.
```xml
<module src="LocalStorage.dll" type="client" />
<module src="sq_bass.dll" type="client" />
```

Allow the Addon to be loaded in the `config.xml`:
```xml
<resource vdf="GMP_Assets.vdf" />
```

Make sure your players also get the correct version dll!