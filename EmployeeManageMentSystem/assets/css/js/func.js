function modalclick() {
    var txt_useremail = document.getElementById('forgotemail');

    if (txt_useremail.value == '') {
        Lobibox.notify('error', {
            pauseDelayOnHover: true,
            continueDelayOnInactiveTab: false,
            // size: 'ini',
            rounded: true,
            icon: 'bx bx-x-circle',
            delayIndicator: true,
            continueDelayOnInactiveTab: false,
            position: 'top right',
            msg: 'Registered EMail Id Can not be Empty'
        });
        console.log("user empty");
        txt_useremail.focus();
        return false;
    }
}