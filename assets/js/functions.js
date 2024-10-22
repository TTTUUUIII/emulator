function upper(str) {
    let tmp = str.split(" ");
    for (let i = 0; i < tmp.length; i++) {
        tmp[i] = tmp[i].substring(0, 1).toUpperCase() + tmp[i].substring(1);
    }
    return tmp.join(" ");
}

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