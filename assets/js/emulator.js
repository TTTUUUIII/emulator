EJS_player = "#game";
EJS_pathtodata = "https://cdn.emulatorjs.org/latest/data/";
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
    launch: (game, auto) => {
        if (!game) {
            console.warn("Invalid game, ignored.");
            return;
        }
        EJS_gameName = game["title"];
        EJS_startOnLoaded = auto;
        // Can also be fceumm or nestopia
        EJS_core = game["system"];

        // URL to BIOS file
        EJS_biosUrl = "";

        // URL to Game rom
        EJS_gameUrl = "data/" + game["rom"];
        $("head")
            .append(
                $("<script></script>")
                    .attr("type", "text/javascript")
                    .attr("src", "https://cdn.emulatorjs.org/latest/data/loader.js")
            )
    }
};