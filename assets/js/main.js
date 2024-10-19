let delayedLaunch = false;
$(function () {
    if (getQueryVariable("id", -1) != -1 && !window.datamap) {
        delayedLaunch = true;
    } else {
        launch();
    }
    UI.init();
});

function launch() {
    let game = {};
    let id = getQueryVariable("id", -1);
    if (id != -1) {
        game = Datamap.findGameById(id);
        if (!game) {
            game = {
                title: "Welcome~ 🎮",
                img: "default.jpg"
            }
        }
    } else {
        game.rom = getQueryVariable("game", undefined);
        game.system = getQueryVariable("system", undefined);
        game.img = getQueryVariable("img", "default.jpg");
        game.title = decodeURI(getQueryVariable("title", "Welcome~ 🎮"));
    }
    UI.input(game);
    let auto = getQueryVariable("auto", false);
    Emulator.launch(game, auto);
}

function forceReload(id, auto) {
    if (Datamap.exists(id)) {
        window.location.replace(`${window.location.href.split("?")[0]}?id=${id}&auto=${auto}`);
    } else {
        console.warn(`¯\_(ツ)_/¯ Sorry, no game with ${id}`);
        alert(`¯\_(ツ)_/¯ Sorry, no game with ${id}`);
    }
}

let Emulator = {
    launch: (game, auto) => {
        if (!game || !game.rom || !game.system) {
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
        let element = document.createElement("script");
        element.setAttribute("type", "text/javascript");
        element.setAttribute(
            "src",
            "https://cdn.emulatorjs.org/latest/data/loader.js"
        );
        document.getElementsByTagName("head")[0].appendChild(element);
    }
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
                    console.log("Datamap loaded.")
                    console.log("Version:" + window.datamap["version"]);
                    console.log("License:" + window.datamap["license"]);
                    console.log("Description:" + window.datamap["description"]);
                    if (delayedLaunch) {
                        launch();
                        delayedLaunch = false;
                    }
                } else {
                    console.error("Falied to request datamap." + request.status);
                }
            }
        };
    },
    findGameById: (id) => {
        let datamap = window.datamap;
        if (datamap) {
            for (let platform of datamap["data"]) {
                for (let publisher of platform["data"]) {
                    for (let game of publisher["games"]) {
                        if (game.id == id) {
                            return {
                                publisher: {
                                    name: publisher["publisher"],
                                    url: publisher["url"]
                                },
                                system: platform["system"],
                                ...game
                            };
                        }
                    }
                }
            }
        }

        return undefined;
    },
    findGenreById: (id) => {
        let genres = window.datamap["genres"];
        if (genres) {
            for(let genre of genres) {
                if(genre["id"] == id) return genre;
            }
        }
        return undefined;
    },
    findSeriesById: (id, system) => {
        let data = window.datamap["data"];
        if (!data) return undefined;
        let platform = undefined;
        for(let it of data) {
            if(it["system"] === system) {
                platform = it;
                break;
            }
        }
        if (!platform) return undefined;
        let series = platform["series"];
        if (series) {
            for (let it of series) {
                if (it["id"] == id) return it;
            }
        }
        return undefined;
    },
    exists: (id) => {
        return Datamap.findGameById(id) != undefined;
    }
};

function getQueryVariable(key, defaultValue) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == key) {
            switch (typeof defaultValue) {
                case "boolean":
                    return pair[1] === "true" || pair[1] === "1";
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

function upper(str, n) {
    return str.substring(0, n).toUpperCase() + str.substring(n);
}

let UI = {
    init: () => {
        $("#launch").click(function () {
            let id = $("#gameId").val();
            id && forceReload(id, 1);
        });
        $("#gameId").keypress((event) => {
            event.keyCode == 13 && event.target.value && forceReload(event.target.value, 1);
        });
        EJS_ready = () => {
            $("#viewport").css("opacity", "0.8");
        }
        EJS_onGameStart = (e) => {
            $("#viewport").css("opacity", "1");
        }
    },
    input: (game) => {
        $(".sliderbar .card img").attr("src", `data/images/${game["img"]}`);
        $("title").text("Emulator🕹 | " + game["title"]);
        $("img.poster").attr("src", `data/images/${game["img"]}`)
        if (game["id"]) {
            $(".sliderbar > .card > .card-body").append(
                $(`<div class="card-item"><label>ID</label><p>${game["id"]}</p></div>`)
            );
        }
        $(".sliderbar > .card > .card-header").text(game["title"]);
        if (game["publisher"]) {
            $(".sliderbar > .card > .card-body").append(
                $(`<div class="card-item"><label>Publisher</label><a href="${game["publisher"]["url"] ?? "#"}" target="_blank">${upper(game["publisher"]["name"], 1)}</a></div>`)
            );
        }
        if (game["release"]) {
            $(".sliderbar > .card > .card-body").append(
                $(`<div class="card-item"><label>Release</label><p>${game["release"]}</p></div>`)
            );
        }
        if(game["system"] && game["series_id"]) {
            let series = Datamap.findSeriesById(game["series_id"], game["system"]);
            if(series) {
                $(".sliderbar > .card > .card-body").append(
                    $(`<div class="card-item"><label>Series</label><a href="${series["url"]}" target="_blank">${series["title"]}</a></div>`)
                );
            }
        }
        let genreIds = game["genre"];
        if (genreIds) {
            let temp = "";
            for (let id of genreIds) {
                let genre = Datamap.findGenreById(id);
                if (genre) {
                    temp += `<a href="${genre["url"] ?? "#"}" target="_blank">${genre["title"]}</a>`;
                }
            }
            if (temp) {
                $(".sliderbar > .card > .card-body").append(
                    $(`<div class="card-item"><label>Genre</label><div class="v-stack">${temp}<div></div>`)
                );
            }
        }
    }
}

Datamap.init();
