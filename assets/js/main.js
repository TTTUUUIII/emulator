let delayedLaunch = false;

$(function () {
    if (getQueryVariable("id", -1) != -1 && !Datamap.loaded()) {
        delayedLaunch = true;
    } else {
        launch();
    }
    UI.init();
    Clock.init($(".clock"));
});

function launch() {
    let game = undefined;
    let id = getQueryVariable("id", -1);
    if (id != -1) {
        game = Datamap.findGameById(id);
        if (game) {
            game["system"] = getQueryVariable("core", game["system"]);
        }
    }
    UI.bind(game);
    let auto = getQueryVariable("auto", false);
    Emulator.launch(game, auto);
}

/**
 *
 * @param {number} id
 * @param {number} auto 
 */
function forceReload(id, auto) {
    if (Datamap.exists(id)) {
        window.location.replace(`${window.location.href.split("?")[0]}?id=${id}&auto=${auto}`);
    } else {
        console.warn(`¯\_(ツ)_/¯ Sorry, no game with ${id}`);
        alert(`¯\_(ツ)_/¯ Sorry, no game with ${id}`);
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