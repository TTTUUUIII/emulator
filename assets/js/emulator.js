EJS_player = "#game";
EJS_pathtodata = "https://cdn.emulatorjs.org/stable/data/";
EJS_lightgun = false; // Lightgun
EJS_Buttons = {
    playPause: false,
    restart: true,
    mute: true,
    settings: false,
    fullscreen: true,
    saveState: false,
    loadState: false,
    screenRecord: false,
    gamepad: true,
    cheat: true,
    volume: true,
    saveSavFiles: false,
    loadSavFiles: false,
    quickSave: false,
    quickLoad: false,
    screenshot: true,
    cacheManager: false,
    exitEmulation: false
};
// EJS_color = '#00FF80'
EJS_backgroundColor = "#000";
EJS_startButtonName = "👾Launch ☢️🚀🕹️"


var Emulator = {
    __testLaunch: function(rom, system) {
        this.launch({
            "title": "Test Launch",
            "rom": rom,
            "system": system
        }, false);
    },
    launch: function (game, options={}) {
        if (!game) {
            console.warn("Invalid game, ignored.");
            return;
        }
        EJS_gameName = game["title"];
        EJS_startOnLoaded = options["auto"] ?? false;
        EJS_fullscreenOnLoaded = options["fullscreen"] ?? false;
        // Can also be fceumm or nestopia
        EJS_core = game["system"];

        // URL to Game rom
        EJS_gameUrl = this.chooseRom(game);

        // URL to BIOS file
        EJS_biosUrl = this.chooseBios();
        $("head")
            .append(
                $("<script></script>")
                    .attr("type", "text/javascript")
                    .attr("src", "https://cdn.emulatorjs.org/stable/data/loader.js")
            )
    },
    chooseRom: (game) => {
        let rom = undefined;
        let region = game["region"];
        if(Array.isArray(game["rom"])) {
            if(region) {
                for(it of game["rom"]) {
                    if(region.toUpperCase() === parseRegion(it)) {
                        rom = it;
                        break
                    }
                }
            }
            if(!rom) {
                rom = game["rom"][0];
            }
        } else {
            rom = game["rom"];
        }
        return `data/${rom}`;
    },
    chooseBios: () => {
        if(EJS_gameUrl.endsWith("fds")) {
            return "data/bios/disksys.rom";
        }
        return ""
    }
};