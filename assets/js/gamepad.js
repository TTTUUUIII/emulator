var GPXBoxKeyMapper = {
    GP_KEY_UP: 12,
    GP_KEY_DOWN: 13,
    GP_LEFT: 14,
    GP_RIGHT: 15,
    GP_X: 2,
    GP_Y: 3,
    GP_A: 1,
    GP_B: 0
}

var GPScanner = {
    onConnectStateChanged: undefined,
    onKeyDown: undefined,
    onKeyUp: undefined,
    _gps_records: new Map(),
    _scanning: false,
    init: function(period=100) {
        window.addEventListener("gamepadconnected", (event) => {
            this.onConnectStateChanged && this.onConnectStateChanged(event.gamepad.index, event.gamepad.id, true);
            if (this._scanning) return;
            setInterval(this.__loop_scan, period);
            this._scanning = true;
        });
        window.addEventListener("gamepaddisconnected", (event) => {
            this._gp_record.delete(event.gamepad.index);
            this.onConnectStateChanged && this.onConnectStateChanged(event.gamepad.index, event.gamepad.id, false);
        })
    },
    __loop_scan: function() {
        let gps = navigator.getGamepads();
        for(let gp of gps) {
            if (!gp || !gp.connected) continue;
            let record = [];
            for(let button of gp.buttons) {
                record.push(button.pressed);
            }
            GPScanner.__diff(gp.index, record);
        }
    },
    __diff: function(gpindex, record) {
        let keydown = [];
        let keyup = [];
        let prev = GPScanner._gps_records[gpindex];
        if (!prev) {
            record.forEach((pressed, index) => {
                pressed && keydown.push(index);
            });
        } else {
            record.forEach((pressed, index) => {
                if(pressed != prev[index]) {
                    if (pressed) {
                        keydown.push(index);
                    } else {
                        keyup.push(index);
                    }
                }
            });
        }
        GPScanner._gps_records[gpindex] = record;
        keydown.length > 0 && GPScanner.onKeyDown && GPScanner.onKeyDown(gpindex, keydown);
        keyup.length > 0 && GPScanner.onKeyUp && GPScanner.onKeyUp(gpindex, keyup);
    }
}