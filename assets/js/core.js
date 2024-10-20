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
    let game = {};
    let id = getQueryVariable("id", -1);
    if (id != -1) {
        game = Datamap.findGameById(id);
        if (!game) {
            game = {
                title: DEFAULT_SEO,
                img: "default.jpg"
            }
        }
    } else {
        game.rom = getQueryVariable("game", undefined);
        game.system = getQueryVariable("system", undefined);
        game.img = getQueryVariable("img", "default.jpg");
        game.title = decodeURI(getQueryVariable("title", DEFAULT_SEO));
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
    _loaded: false,
    _all_games: new Map(),
    _all_genres: new Map(),
    _all_series: new Map(),
    init: function() {
        var request = new XMLHttpRequest();
        request.open("GET", "data/datamap.json", true);
        request.send();
        request.onreadystatechange = function () {
            if (request.readyState == 4 && request.status == 200) {
                if (request.status == 200) {
                    Datamap.data = JSON.parse(request.responseText);
                    console.log("Datamap loaded.")
                    console.log("Version:" + Datamap.data["version"]);
                    console.log("License:" + Datamap.data["license"]);
                    console.log("Description:" + Datamap.data["description"]);
                    Datamap.__index();
                    Datamap.loaded = true;
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
    __index: function() {
        if (this.data) {

            // Index games and series
            for (let platform of this.data["data"]) {
                let series = new Map();
                for(let it of platform["series"]) {
                    series.set(it["id"], it);
                }
                this._all_series.set(platform["system"], series);

                for (let publisher of platform["data"]) {
                    for (let game of publisher["games"]) {
                        this._all_games.set(game["id"], {
                            publisher: {
                                name: publisher["publisher"],
                                url: publisher["url"]
                            },
                            system: platform["system"],
                            ...game
                        });
                    }
                }
            }

            // Index Genres
            for(let genre of this.data["genres"]) {
                this._all_genres.set(genre["id"], genre);
            }
        }
    },
    findGameById: function(id) {
        return this._all_games.get(parseInt(id));
    },
    findGenreById: function(id) {
        return this._all_genres.get(parseInt(id));
    },
    findSeriesById: function(id, system) {
        let series = this._all_series.get(system);
        if (series) {
            return series.get(parseInt(id));
        }
        return undefined;
    },
    random: function() {
        return Array.from(this._all_games.keys())[Math.floor(Math.random() * this._all_games.size)];
    },
    exists: function(id) {
        return this._all_games.has(parseInt(id));
    },
    loaded: function() {
        return this._loaded;
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
    init: function() {
        $("#random").click(function() {
            $("#game-id").val(Datamap.random());
        });
        $("#launch").click(function () {
            let id = $("#game-id").val();
            id && forceReload(id, 1);
        });
        $("#game-id").keypress((event) => {
            event.keyCode == 13 && event.target.value && forceReload(event.target.value, 1);
        });
        EJS_ready = () => {
            $("#viewport").css("opacity", "0.8");
        }
        EJS_onGameStart = (e) => {
            $("#viewport").css("opacity", "1");
        }
    },
    input: function(game) {
        $("#game-img").attr("src", `data/images/${game["img"]}`);
        let title = game["title"];
        $("title").text("Emulator🕹 | " + title);
        if(title.length > 20) {
            $("#game-title")
            .addClass("marquee-content")
            .parent().addClass("marquee");
        }
        $("#game-title").text(title);
        $("img.main-background").attr("src", `data/images/${game["img"]}`)
        if (game["id"]) {
            $("#game-details").append(
                $(`<div class="card-item"><label>ID</label><p>${game["id"]}</p></div>`)
            );
        }
        if (game["publisher"]) {
            $("#game-details").append(
                $(`<div class="card-item"><label>Publisher</label><a href="${game["publisher"]["url"] ?? "#"}" target="_blank">${upper(game["publisher"]["name"], 1)}</a></div>`)
            );
        }
        if (game["release"]) {
            $("#game-details").append(
                $(`<div class="card-item"><label>Release</label><p>${game["release"]}</p></div>`)
            );
        }
        if(game["system"] && game["series_id"]) {
            let series = Datamap.findSeriesById(game["series_id"], game["system"]);
            if(series) {
                $("#game-details").append(
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
                $("#game-details").append(
                    // $(`<div class="card-item"><label>Genre(s)</label><div class="v-stack">${temp}<div></div>`)
                );
            }
        }
    }
}

Datamap.init();
