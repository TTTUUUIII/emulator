const KEY_ESC                               = 27;
const KEY_P                                 = 80;

const SK_RESET                              = 1;
const SK_QUICK_SAVE_STATE                   = 2;
const SK_QUICK_LOAD_STATE                   = 3;
const SK_SAVE_STATE_TO_DISK                 = 4;
const SK_LOAD_STATE_FROM_DISK               = 5;
const SK_TOGGLE_PLAY_PAUSE                  = 6;

var UI = {
    onReload: undefined,
    onRegionChanged: undefined,
    onShortcutKey: undefined,
    init: function () {
        this.__bind_event();
        this.__refresh_clock($(".clock"));
    },
    __bind_event: function () {
        $(".action-random").off("click").on("click", () => {
            $("input.game-id").val(Datamap.random());
        });
        $(".action-launch").off("click").on("click", () => {
            let id = $("input.game-id").val();
            this.onReload(id, 1);
        });
        $("input.game-id").off("keydown").on("keydown", (event) => {
            event.keyCode == 13 &&
                event.target.value &&
                this.onReload(event.target.value, 1);
        });
        $(document).off("keydown").on("keydown", (event) => {
            let sk = -1;
            if (event.keyCode == KEY_ESC) {
                sk = SK_RESET;
            } else if(event.keyCode == KEY_P) {
                sk = SK_TOGGLE_PLAY_PAUSE;
            } else if (event.ctrlKey) {
                sk = event.shiftKey ? SK_SAVE_STATE_TO_DISK : SK_QUICK_SAVE_STATE;
            } else if (event.altKey) {
                sk = event.shiftKey ? SK_LOAD_STATE_FROM_DISK : SK_QUICK_LOAD_STATE;
            }
            if (sk != -1 && this.onShortcutKey(sk)) {
                event.preventDefault();
            }
        })
    },
    __refresh_clock: function (target) {
        var date = new Date();
        var h = date.getHours(); // 0 - 23
        var m = date.getMinutes(); // 0 - 59
        var s = date.getSeconds(); // 0 - 59
        var session = "AM";

        if (h == 0) {
            h = 12;
        }

        if (h > 12) {
            h = h - 12;
            session = "PM";
        }

        h = (h < 10) ? "0" + h : h;
        m = (m < 10) ? "0" + m : m;
        s = (s < 10) ? "0" + s : s;

        var time = h + ":" + m + ":" + s + " " + session;
        target.text(time);
        setTimeout(UI.__refresh_clock, 1000, target);
    },
    setGameElementOpacity: (v) => {
        $("#game").css("opacity", v);
    },
    bind: function (game) {
        if (!game) return;
        let title = game["title"];
        $("title").text(`🕹 Emulator | Play「${title}」Online!`);
        if (title.length > 20) {
            $("#game-title")
                .addClass("marquee-content")
                .parent()
                .addClass("marquee");
        }
        $("#game-title").text(title);
        let gameImg = game["img"];
        let gamePoster = undefined;
        if(Array.isArray(gameImg)) {
            gamePoster = gameImg[1];
            gameImg = gameImg[0];
        }
        $("#game-img").attr("src", `data/images/${gameImg}`);
        let series = Datamap.findSeriesByGame(game);
        if(!gamePoster) {
            gamePoster = (series && series["poster"]) ? series["poster"] : gameImg;
        }
        $("img.main-background").attr("src", `data/images/${gamePoster}`);
        if (gameImg === gamePoster) {
            $("img.main-background").css("object-position", "0px 50%");
        }
        if (game["id"]) {
            $("#game-details").append(
                $(
                    `<div class="card-item"><label>ID</label><p>${game["id"]}</p></div>`
                )
            );
        }
        if (game["developer"]) {
            $("#game-details").append(
                $(
                    `<div class="card-item"><label>Developer</label><a href="${game["developer"]["url"] ?? "#"
                    }" target="_blank">${upper(
                        game["developer"]["name"]
                    )}</a></div>`
                )
            );
        }
        if (series) {
            $("#game-details").append(
                $(
                    `<div class="card-item"><label>Series</label><a href="${series["url"]}" target="_blank">${series["title"]}</a></div>`
                )
            );
        }
        let genreIds = game["genre"];
        if (genreIds) {
            let temp = "";
            for (let id of genreIds) {
                let genre = Datamap.findGenreById(id);
                if (genre) {
                    temp += `<a href="${genre["url"] ?? "#"}" target="_blank">${genre["title"]
                        }</a>`;
                }
            }
            if (temp) {
                $("#game-details").append(
                    $(
                        `<div class="card-item"><label>Genre(s)</label><div class="v-stack">${temp}<div></div>`
                    )
                );
            }
        }
        if (game["release"]) {
            $("#game-details").append(
                $(
                    `<div class="card-item"><label>Release</label><p>${game["release"]}</p></div>`
                )
            );
        }
        let region = undefined;
        let regionSelectElement = $(".region-select > select");
        if (Array.isArray(game["rom"])) {
            for(it of game["rom"]) {
                region = parseRegion(it);
                region && regionSelectElement.append(
                    $(`<option value=${region.toLowerCase()}>${region}</option>`)
                );
            }
        } else {
            region = parseRegion(game["rom"]);
            region && regionSelectElement.append(
                $(`<option value=${region.toLowerCase()}>${region}</option>`)
            );
        }
        regionSelectElement.children().length > 0 && regionSelectElement.parent().addClass("h-stack-inline").removeClass("invisible");
        game["region"] && regionSelectElement.val(game["region"]);
        regionSelectElement.change(function() {
            UI.onRegionChanged(this.value);
        });
    }
};
