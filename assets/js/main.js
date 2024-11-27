let delayedLaunch = false;

UI.onRandom = () => Datamap.random();
UI.onGetGenre = (id) => Datamap.findGenreById(id);
UI.onGetSeries = (game) => Datamap.findSeriesByGame(game);
UI.onReload = (id, auto) => {
    if(id && Datamap.exists(id)) {
        reload(id, auto);
    } else if(id) {
        Toast.error(`¯\_(ツ)_/¯ Sorry, game not found! ${id}`);
    } else {
        Toast.warn("( ͡° ͜ʖ ͡°) Please provide game's ID");
    }
}

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
});