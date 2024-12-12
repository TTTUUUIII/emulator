var UI = {
    onReload: undefined,
    onGetSeries: undefined,
    onGetGenre: undefined,
    onRandom: undefined,
    onRegionChanged: undefined,
    init: function () {
        this.__bind_event();
        this.__refresh_clock($(".clock"));
    },
    __bind_event: function () {
        $("#random").off("click").on("click", () => {
            $("#game-id").val(this.onRandom());
        });
        $("#launch").off("click").on("click", () => {
            let id = $("#game-id").val();
            this.onReload(id, 1);
        });
        $("#game-id").off("keydown").on("keydown", (event) => {
            event.keyCode == 13 &&
                event.target.value &&
                this.onReload(event.target.value, 1);
        });
        $(document).off("keydown").on("keydown", (event) => {
            let ctrl = undefined;
            if (event.keyCode == 27) {
                ctrl = $("#game > div.ejs_menu_bar > button")[0];
            } else if (event.ctrlKey) {
                ctrl = event.shiftKey ? $("#game > div.ejs_menu_bar > button")[3] : $("#game > div.ejs_context_menu > ul > li")[3];
            } else if (event.altKey) {
                ctrl = event.shiftKey ? $("#game > div.ejs_menu_bar > button")[4] : $("#game > div.ejs_context_menu > ul > li")[4];
            }
            if (ctrl) {
                ctrl.click();
                event.preventDefault();
            }
        })
        EJS_ready = () => {
            $("#game").css("opacity", "0.8");
        };
        EJS_onGameStart = (e) => {
            $("#game").css("opacity", "1");
        };
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
        let series = this.onGetSeries(game);
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
                let genre = this.onGetGenre(id);
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
        regionSelectElement.children().length > 0 && regionSelectElement.parent().removeClass("invisible")
        region = getQueryVariable("reg", undefined);
        region && regionSelectElement.val(region);
        regionSelectElement.change(function() {
            UI.onRegionChanged(this.value);
        });
    }
};
