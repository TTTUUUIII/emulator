window.onload = function () {
    let game = {};
    let core = getQueryVariable("system", "");
    let img = getQueryVariable("img", "");
    let gameId = getQueryVariable("gameid", -1);
    if (gameId != -1) {
        game = Datamap.findGameById(gameId);
    } else {
        game.rom = getQueryVariable("game", undefined);
        game.system = getQueryVariable("system", undefined);
        game.img = getQueryVariable("img", "default.jpg");
        game.title = decodeURI(getQueryVariable("title", "Welcome~ 🎮"));
    }
    ControlPanel.input(game);
    let autoStart = getQueryVariable("autostart", false);
    if (!title) {
        title = game.split(".")[0];
    }
    document.getElementsByTagName("title")[0].innerText =
        "EmulatorJs | " + title;
    if (game["img"]) {
        let posterElements = document.getElementsByClassName("poster");
        if (posterElements) {
            for (i = 0; i < posterElements.length; ++i) {
                posterElements[i].setAttribute("src", "data/images/" + game["img"]);
            }
        }
    }
    EJS_gameName = game["title"];
    EJS_startOnLoaded = autoStart;
    EJS_player = "#game";
    // Can also be fceumm or nestopia
    EJS_core = core;

    EJS_lightgun = false; // Lightgun

    // URL to BIOS file
    EJS_biosUrl = "";

    // URL to Game rom
    EJS_gameUrl = "data/" + game["rom"];

    EJS_pathtodata = "https://cdn.emulatorjs.org/latest/data/";
    Emulator.start();
    ControlPanel.init();
};

let Emulator = {
    start: () => {
        let element = document.createElement("script");
        element.setAttribute("type", "text/javascript");
        element.setAttribute(
            "src",
            "https://cdn.emulatorjs.org/latest/data/loader.js"
        );
        document.getElementsByTagName("head")[0].appendChild(element);
    },
    reload: (varible) => {
        let url =
            window.location.protocol +
            "//" +
            window.location.hostname +
            ":" +
            window.location.port +
            window.location.pathname +
            varible;
        window.location.replace(url);
    },
};

let Datamap = {
    init: () => {
        var request = new XMLHttpRequest();
        request.open("GET", "data/datamap.json", true);
        request.send();
        request.onreadystatechange = function () {
            if (request.readyState == 4 && request.status == 200) {
                if (request.status == 200) {
                    window.datamap = JSON.parse(request.responseText);
                    console.log("<Datamap------------<")
                    console.log("Version:" + window.datamap["version"]);
                    console.log("License:" + window.datamap["license"]);
                    console.log("Description:" + window.datamap["description"]);
                    console.log("<-------------------<")
                } else {
                    console.error("Falied to request datamap." + request.status);
                }
            }
        };
    },
    findGameById: (id) => {
        let datamap = window.datamap;
        if(datamap) {
            for(let platform of datamap["data"]) {
                for(let publisher of platform["data"]) {
                    for(let game of publisher["games"]) {
                        if (game.id == id) return {"system": platform["system"], ...game};
                    }
                }
            }
        }

        return undefined;
    }
};

let ControlPanel = {
    init: () => {
        document.getElementById("launch").onclick = function () {
            let romId = document.getElementById("rom").value;
            let element = document.getElementById("system");
            let system = element.options[element.selectedIndex].value;
            let title = document.getElementById("title").value;
            let cover = document.getElementById("cover").value;
            Emulator.reload(
                `?game=${romId}&system=${system}&title=${title}&img=${cover}&autostart=true`
            );
        };
    },
    input: (game) => {
        document.getElementById("rom").value = game["rom"];
        document.getElementById("title").value = game["title"];
        document.getElementById("cover").value = game["img"];
        let options = document.getElementById("system").options;
        for (i = 0; i < options.length; ++i) {
            if (options[i].value === game["system"]) {
                options[i].selected = true;
            }
        }
    },
};

function getQueryVariable(key, defaultValue) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == key) {
            switch (typeof defaultValue) {
                case "boolean":
                    return pair[1] === "true";
                    break;
                case "number":
                    return +pair[1];
                    break;
                default:
                    return pair[1];
            }
        }
    }
    return defaultValue;
}

Datamap.init();