var Datamap = {
    onload: undefined,
    _loaded: false,
    _all_games: new Map(),
    _all_game_ids: [],
    _all_genres: new Map(),
    _all_series: new Map(),
    _all_developers: new Map(),
    init: function () {
        $.ajax({
            url:"data/datamap.json", 
            async: true,
            dataType: "json", 
            success: function(data) {
                Datamap.data = data;
                Datamap.__index();
                Datamap._loaded = true;
                if(Datamap.onload) {
                    Datamap.onload();
                }
            },
            error: function(_, status) {
                console.error(`Failed to request datamap.json ${status}`);
            }
        });
    },
    __index: function () {
        if (this.data) {

            // Index games and series
            for (let platform of this.data["data"]) {
                let system = platform["system"];
                let series = new Map();
                if(platform["series"]) {
                    for (let it of platform["series"]) {
                        series.set(it["id"], it);
                    }
                }
                this._all_series.set(system, series);
                for (let developer of platform["data"]) {
                    let dev = {
                        name: developer["developer"],
                        url: developer["url"]
                    };
                    if (!dev.name.startsWith("@")) {
                        this._all_developers.set(`${system}/${dev.name}`, dev);
                    }
                    for (let game of developer["games"]) {
                        this._all_game_ids.push(game["id"]);
                        this._all_games.set(game["id"], {
                            developer: dev,
                            system: platform["system"],
                            ...game
                        });
                    }
                }
            }

            // Index Genres
            for (let genre of this.data["genres"]) {
                this._all_genres.set(genre["id"], genre);
            }
        }
    },
    findGameById: function (id) {
        let game = this._all_games.get(parseInt(id));
        if(game.developer.name.startsWith("@")) {
            game.developer = this._all_developers.get(game.developer.name.substring(1));
        }
        return game;
    },
    findGenreById: function (id) {
        return this._all_genres.get(parseInt(id));
    },
    findSeriesById: function (id, system) {
        let series = this._all_series.get(system);
        if (series) {
            return series.get(parseInt(id));
        }
        return undefined;
    },
    findSeriesByGame: function(game) {
        let seriesId = game["series_id"];
        let system = game["system"];
        if(typeof seriesId === "string" && seriesId.startsWith("@")) {
            [system, seriesId] = seriesId.substring("1").split("/");
        }
        return this.findSeriesById(seriesId, system);
    },
    random: function () {
        return this._all_game_ids[Math.floor(Math.random() * this._all_game_ids.length)];
    },
    exists: function (id) {
        return this._all_games.has(parseInt(id));
    },
    loaded: function () {
        return this._loaded;
    }
};