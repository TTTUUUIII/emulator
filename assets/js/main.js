window.onload = function() {

    let game = getQueryVariable("game");
    let core = getQueryVariable("core");
    let img = getQueryVariable("img");
    if (img) {
        let posterElements = document.getElementsByClassName("poster");
        if(posterElements) {
            for(i = 0; i < posterElements.length; ++i) {
                posterElements[i].setAttribute("src", "https://media.snowland.ink/images/" + img);
            }
        }
    }
    if(!game) {
        console.error("Error! game not specified!!!");
        return;
    }
    if(!core) {
        console.error("Error! emulatorjs core not specified!!!");
        return;
    }
    EJS_player = '#game';
    // Can also be fceumm or nestopia
    EJS_core = core;
    
    EJS_lightgun = false; // Lightgun
    
    // URL to BIOS file
    EJS_biosUrl = '';
    
    // URL to Game rom
    EJS_gameUrl = 'data/' + game;

    EJS_pathtodata = 'https://cdn.emulatorjs.org/latest/data/';
    loadGame();
}

function loadGame() {
    let element = document.createElement("script");
    element.setAttribute('type','text/javascript');
    element.setAttribute("src", "https://cdn.emulatorjs.org/latest/data/loader.js");
    document.getElementsByTagName("head")[0].appendChild(element);
}

function getQueryVariable(key) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == key){return pair[1];}
    }
    return(false);
}