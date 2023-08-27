toastr.options.closeButton = true;
toastr.options.positionClass = 'toast-top-right';
toastr.options.extendedTimeOut = 0; //1000;
toastr.options.timeOut = 2000;
toastr.options.fadeOut = 250;
toastr.options.fadeIn = 250;

function notification(type, message, title) {
    if (type == 'success') {
        toastr.success(message, title);
    } else if (type == 'error') {
        toastr.error(message, title);
    } else if (type == 'warning') {
        toastr.warning(message, title);
    } else {
        toastr.info(message, title);
    }
}
