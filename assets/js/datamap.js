var Datamap = {
    onload: undefined,
    _loaded: false,
    _all_games: new Map(),
    _all_game_ids: [],
    _all_genres: new Map(),
    _all_series: new Map(),
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
                let series = new Map();
                for (let it of platform["series"]) {
                    series.set(it["id"], it);
                }
                this._all_series.set(platform["system"], series);

                for (let publisher of platform["data"]) {
                    for (let game of publisher["games"]) {
                        this._all_game_ids.push(game["id"]);
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
            for (let genre of this.data["genres"]) {
                this._all_genres.set(genre["id"], genre);
            }
        }
    },
    findGameById: function (id) {
        return this._all_games.get(parseInt(id));
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