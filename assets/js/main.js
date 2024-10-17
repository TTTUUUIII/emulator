window.onload = function() {

    let game = getQueryVariable("game", "");
    let core = getQueryVariable("system", "");
    let img = getQueryVariable("img", "");
    let title = decodeURI(getQueryVariable("title", "Welcome~ 🎮"));
    ControlPanel.input(game, core, title, img);
    let autoStart = getQueryVariable("autostart", false);
    if (!title) {
        title = game.split(".")[0];
    }
    document.getElementsByTagName("title")[0].innerText = "EmulatorJs | " + title;
    if (img) {
        let posterElements = document.getElementsByClassName("poster");
        if(posterElements) {
            for(i = 0; i < posterElements.length; ++i) {
                posterElements[i].setAttribute("src", "data/images/" + img);
            }
        }
    }
    if(!game) {
        console.warn("Warning! game not specified!!!");
    }
    if(!core) {
        console.warn("Warning! emulatorjs system not specified!!!");
    }
    EJS_gameName = title;
    EJS_startOnLoaded = autoStart;
    EJS_player = '#game';
    // Can also be fceumm or nestopia
    EJS_core = core;
    
    EJS_lightgun = false; // Lightgun
    
    // URL to BIOS file
    EJS_biosUrl = '';
    
    // URL to Game rom
    EJS_gameUrl = 'data/' + game;

    EJS_pathtodata = 'https://cdn.emulatorjs.org/latest/data/';
    Emulator.start();
    ControlPanel.init();
}

let Emulator = {
    start: () => {
        let element = document.createElement("script");
        element.setAttribute('type','text/javascript');
        element.setAttribute("src", "https://cdn.emulatorjs.org/latest/data/loader.js");
        document.getElementsByTagName("head")[0].appendChild(element);
    },
    reload: (varible) => {
        let url = window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname + varible;
        window.location.replace(url);
    }
}

// let MainMenu = {
//     init: () => {
//         var request = new XMLHttpRequest();
//         request.open('GET', "data/datamap.json", true);
//         request.send();
//         request.onreadystatechange = function() {
//             if (request.readyState == 4 && request.status == 200) {
//                 var datamap = JSON.parse(request.responseText);
//                 console.log(datamap);
//             }
//         }
//     }
// }

let ControlPanel = {
    init: () => {
        document.getElementById("load").onclick = function() {
            let romId = document.getElementById("rom").value;
            let element = document.getElementById("system");
            let system = element.options[element.selectedIndex].value;
            let title = document.getElementById("title").value;
            let cover = document.getElementById("cover").value;
            Emulator.reload("?game=${romId}&system=${system}&title=${title}&cover=${cover}");
        }
    },
    input: (romId, system, title, cover) => {
        document.getElementById("rom").value = romId;
        // document.getElementById("system").value = system;
        document.getElementById("title").value = title;
        document.getElementById("cover").value = cover;
    }
}


function getQueryVariable(key, defaultValue) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == key){
            switch(typeof defaultValue) {
                case "boolean":
                    return pair[1] === "true";
                    break
                case "number":
                    return +pair[1];
                    break
                default:
                    return pair[1];
                            
            }
        }
    }
    return defaultValue;
}