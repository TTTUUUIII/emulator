var Properties = {
    put: function(k, v) {
        localStorage.setItem(k, v);
    },
    get: function(k) {
        return localStorage.getItem(k);
    },
    getOrDefault(k, v) {
        return this.get(k) ?? v;
    }
}