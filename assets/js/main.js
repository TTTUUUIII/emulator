let delayedLaunch = false;

UI.onReload = (id, auto) => {
    if(id && Datamap.exists(id)) {
        reload(id, auto);
    } else if(id) {
        Toasts.error(`¯\_(ツ)_/¯ Sorry, game "${id}" not found!`);
    } else {
        Toasts.warn("( ͡° ͜ʖ ͡°) Please provide game's ID");
    }
}
UI.onRegionChanged = (region) => {
    let id = getQueryVariable("id");
    if (id == -1) {
        Toasts.error("Unable find game's ID.");
        return;
    }
    Properties.put(`game.region.${id}`, region);
    let auto = getQueryVariable("auto", false);
    reload(id, auto, region);
}
UI.onShortcutKey = (sk) => {
    if(!EJS_emulator || EJS_emulator.isNetplay) {return false};
    let ctrl = undefined;
    switch(sk) {
        case SK_RESET:
            Emulator.restart();
            break
        case SK_QUICK_SAVE_STATE:
            ctrl = $("#game > div.ejs_context_menu > ul > li")[3];
            break
        case SK_QUICK_LOAD_STATE:
            ctrl = $("#game > div.ejs_context_menu > ul > li")[4];
            break
        case SK_SAVE_STATE_TO_DISK:
            ctrl = $("#game > div.ejs_menu_bar > button")[3];
            break
        case SK_LOAD_STATE_FROM_DISK:
            ctrl = $("#game > div.ejs_menu_bar > button")[4];
            break
        case SK_TOGGLE_PLAY_PAUSE:
            Emulator.tooglePlayOrPause();
            break
        default:
            return false;
    }
    if(ctrl) {
        ctrl.click();
    }
    return true;
}

Emulator.onGameStart = () => {
    UI.setGameElementOpacity(1.0);
    let autorestore = Properties.getOrDefault("game.autorestore", "true");
    if(autorestore == "true") {
        let base64State = Properties.get(`game.last_state.${Emulator.hashcode}`);
        if(base64State) {
            Emulator.loadBase64State(base64State);
            Toasts.show("Auto restored to last state!")
        }
    }
}

Emulator.onReady = () => {
    UI.setGameElementOpacity(0.8);
}
// GPScanner.onConnectStateChanged = (gpindex, id, isconnected) => {
//     console.log(`onConnectStateChanged: ${gpindex}, ${id}, ${isconnected}`);
// }
// GPScanner.onKeyDown = (gpindex, keys) => {
//     console.log(`onKeyDown: ${gpindex}: ${keys}`);
// }

function launch() {
    let game = undefined;
    let id = getQueryVariable("id", -1);
    if (id != -1) {
        game = Datamap.findGameById(id);
        if (game) {
            game["system"] = getQueryVariable("core", game["system"]);
        }
    }
    let auto = getQueryVariable("auto", false);
    let region = getQueryVariable("reg", undefined) ?? Properties.get(`game.region.${id}`);
    if (game) {
        game = {...game, "region": region};
        UI.bind(game);
        Emulator.launch(game, {"auto":auto});
    }
}

Datamap.onload = function() {
    console.log("**************************************************")
    console.log(`* Version: ${Datamap.data["version"]}`)
    console.log(`* License: ${Datamap.data["license"]}`);
    console.log(`* Description: ${Datamap.data["description"]}`);
    console.log("**************************************************")
    delayedLaunch && launch();
    delayedLaunch = false;
};

Datamap.init();

$(function () {
    if (getQueryVariable("id", -1) != -1 && !Datamap.loaded()) {
        delayedLaunch = true;
    } else {
        launch();
    }
    UI.init();
    // GPScanner.init();
});

window.addEventListener("beforeunload", function() {
    Emulator._actived && Properties.put(`game.last_state.${Emulator.hashcode}`, Emulator.getBase64State());
});