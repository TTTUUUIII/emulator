/**
 *
 * @param {number} id
 * @param {number} auto 
 */
function reload(id, auto, region=undefined) {
    let queries = `?id=${id}`;
    if(auto) {
        queries += `&auto=1`
    }
    if(region) {
        queries += `&reg=${region}`
    }
    window.location.replace(`${window.location.href.split("?")[0]}${queries}`);
}

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

function parseRegion(name) {
    let begin = name.lastIndexOf("@");
    let end = name.lastIndexOf(".");
    if (begin != -1 && end != -1) {
        return name.substring(begin + 1, end);
    }
    return undefined
}