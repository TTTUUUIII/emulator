var UI = {
    init: function () {
        $("#random").click(function () {
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
    bind: function (game) {
        if(!game) return;
        let title = game["title"];
        $("title").text("🕹 Emulator | " + title);
        if (title.length > 20) {
            $("#game-title")
                .addClass("marquee-content")
                .parent().addClass("marquee");
        }
        $("#game-title").text(title);
        $("#game-img").attr("src", `data/images/${game["img"]}`);
        $("img.main-background").attr("src", `data/images/${game["img"]}`)
        if (game["id"]) {
            $("#game-details").append(
                $(`<div class="card-item"><label>ID</label><p>${game["id"]}</p></div>`)
            );
        }
        if (game["publisher"]) {
            $("#game-details").append(
                $(`<div class="card-item"><label>Publisher</label><a href="${game["publisher"]["url"] ?? "#"}" target="_blank">${upper(game["publisher"]["name"])}</a></div>`)
            );
        }
        if (game["release"]) {
            $("#game-details").append(
                $(`<div class="card-item"><label>Release</label><p>${game["release"]}</p></div>`)
            );
        }
        if (game["system"] && game["series_id"]) {
            let series = Datamap.findSeriesById(game["series_id"], game["system"]);
            if (series) {
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
                    $(`<div class="card-item"><label>Genre(s)</label><div class="v-stack">${temp}<div></div>`)
                );
            }
        }
    }
}