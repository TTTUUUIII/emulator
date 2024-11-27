const TOAST_LEVEL_WARN = "warn";
const TOAST_LEVEL_INFO = "info";
const TOAST_LEVEL_ERROR = "error";
var Toast = {
    error: function(text) {
        this.show(text, TOAST_LEVEL_ERROR);
    },
    warn: function(text) {
        this.show(text, TOAST_LEVEL_WARN);
    },
    show: function(text, level=TOAST_LEVEL_INFO, duration=2000) {
        let container = $(".toast-container");
        let element = this.__create_toast_element(text, level);
        element.find(".close").off("click").on("click", () => {
            element.remove();
        });
        container && container.prepend(element) && element.slideDown("fast");
        setTimeout(() => {
            element.slideUp("slow", function() {
                (this).remove();
            });
        }, duration);
    },
    __create_toast_element: function(text, level) {
        let icon = `<svg xmlns="http://www.w3.org/2000/svg" fill="#0d6efd" width="16" height="16" class="bi bi-bell-fill" viewBox="0 0 16 16">
                        <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
                    </svg>`
        switch (level) {
            case TOAST_LEVEL_WARN:
                icon = `<svg xmlns="http://www.w3.org/2000/svg" fill="#fabc3f" width="16" height="16" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                        </svg>`
                break
            case TOAST_LEVEL_ERROR:
                icon = `<svg xmlns="http://www.w3.org/2000/svg" fill="#dc3545" width="16" height="16" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                        </svg>`
                break
            default:;
        }
        return $(`<div class="toast hidden mt-sm">
                    <div class="toast-header">
                        ${icon}
                        <span class="close">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                            </svg>
                        </span>
                    </div>
                    <div class="toast-body">
                        ${text}
                    </div>
                </div>`)
    }
}