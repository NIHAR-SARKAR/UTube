
$(document).ready(function () {

    $('#UserPass,#ContentPlaceHolder1_tbPassword').focus(function (e) {
        var position = $(this).position();
        $('#pass-strength').css('top', position.top + 35).css('left', position.left + 60).fadeIn(500);
    }).focusout(function () {$('#pass-strength').fadeOut(500);
    });

    $('#UserName').focus(function (e) {
        var position = $(this).position();
        $('#Username-valid').css('top', position.top + 35).css('left', position.left + 60).fadeIn(500);
    }).focusout(function () {
$('#Username-valid').fadeOut(500);
    });

    $('#UserId').focus(function (e) {
        var position = $(this).position();
        $('#Email-valid').css('top', position.top + 35).css('left', position.left + 60).fadeIn(500);
    }).focusout(function () {$('#Email-valid').fadeOut(500);
    });

    $('#UserConfPass,#ContentPlaceHolder1_tbConfirm').focus(function (e) {
        var position = $(this).position();
        $('#Password-confirm').css('top', position.top + 35).css('left', position.left + 60).fadeIn(500);
    }).focusout(function () {$('#Password-confirm').fadeOut(500);
    });
    

    
    $('#UserPass,#ContentPlaceHolder1_tbPassword').keyup(function (event) {
            var str = $.trim($(this).val()); var f1 = 0, f2 = 0, f3 = 0,f4 = 0;
            for (i = 0; i < str.length; i++) {
                var ch = str.charCodeAt(i);

                if (ch < 91 && ch > 64) {
                    f1 = 1;}
                else if (ch < 123 && ch > 96) {
                    f2 = 1;}
                else if (ch < 58 && ch > 47) {
                    f3 = 1;}
                else if (!(ch < 58 && ch > 47) && !(ch < 91 && ch > 64) && !(ch < 123 && ch > 96)) {
                    f4 = 1}

            }
            if (f1 == 1 && f2 == 1) {
                changemode('upper-lower-img', 'upper-lower', 'green');
            } else { changemode('upper-lower-img', 'upper-lower', 'gray'); }

            if (f3 == 1) {
                changemode('number-img', 'number', 'green');
            } else { changemode('number-img', 'number', 'gray'); }

            if (str.length > 11) {
                changemode('min-char-img', 'min-char', 'green');
            } else { changemode('min-char-img', 'min-char', 'gray'); }

            if (f4 == 1) {
                changemode('special-char-img', 'special-char', 'green');
            } else { changemode('special-char-img', 'special-char', 'gray'); }

            if (f1 == 1 && f2 == 1 && f3 == 1 && f4 == 1 && str.length > 11) {
                $('.st1 , .st2 , .st3').css({ 'background-color': '#14b621' });
            }
        else if (f1 == 1 && f2 == 1 && f3 == 1 && f4 == 1 && str.length > 8 && str.length < 12) {
            $('.st1 , .st2 ').css({ 'background-color': '#ebda12' });
            $('.st3').css({ 'background-color': 'transparent' });
            }
            else if ((f1 == 1 && f2 == 1 && f3 == 0 && f4 == 0 && str.length > 11) || (f1 == 1 && f2 == 1 && f3 == 1 && f4 == 1 && str.length < 12 && str.length > 7) || (f1 == 1 && f2 == 1 && f3 == 1 && f4 == 0 && str.length < 12 && str.length > 7) || (f1 == 1 && f2 == 1 && f3 == 0 && f4 == 1 && str.length < 12 && str.length > 7)) {
                $('.st1 , .st2 ').css({ 'background-color': '#ebda12' });
                $('.st3').css({ 'background-color': 'transparent' });
            }
            else{
                $('.st1 ').css({ 'background-color': '#f00'});
                $('.st2 , .st3').css({ 'background-color': 'transparent' });
            }

    });




    $('#UserId').keyup(function (event) {
        var xstr = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/; var str = $(this).val();
        var ck = xstr.exec(str);
        if (!ck || ck[0] != str) {
            changemode('Email-valid-img', 'Email-valid', 'gray');
        } else {
            changemode('Email-valid-img', 'Email-valid', 'green');
        }
    });

    $('#UserName').keyup(function (event) {
        var xstr = /[a-zA-Z\s]+/; var str = $(this).val();
        var ck = xstr.exec(str);
        if (!ck || ck[0] != str) {
            changemode('Username-valid-img', 'Username-valid', 'gray');
        } else {
            changemode('Username-valid-img', 'Username-valid', 'green');
        }
    });
    //$('#DOB').keyup(function (event) {
    //    var xstr = /(^(((0[1-9]|1[0-9]|2[0-8])[-](0[1-9]|1[012]))|((29|30|31)[-](0[13578]|1[02]))|((29|30)[-](0[4,6,9]|11)))[-](19|[2-9][0-9])\d\d$)|(^29[-]02[-](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)/; var str = $(this).val();
    //    var ck = xstr.exec(str);
    //    if (!ck || ck[0] != str) {
    //        $(this).css('color', 'red');     
    //    } else {
    //        $(this).css('color', 'green');
    //    }
    //});
    $('#UserConfPass').keyup(function (event) {
        if ($(this).val() == $('#UserPass').val()) {
            changemode('Password-confirm-img', 'Password-confirm', 'green');
        } else {
            changemode('Password-confirm-img', 'Password-confirm', 'gray');
        }
    });

    $('#ContentPlaceHolder1_tbConfirm').keyup(function (event) {
        if ($(this).val() == $('#ContentPlaceHolder1_tbPassword').val()) {
            changemode('Password-confirm-img', 'Password-confirm', 'green');
        } else {
            changemode('Password-confirm-img', 'Password-confirm', 'gray');
        }
    });

















    function changemode(pic, text, attr) {
        if (attr == 'green') {
            $('#valid-area .' + pic).css({ '-webkit-filter': 'grayscale(0%)', 'filter': 'grayscale(0%)' });
            $('#valid-area .' + text).css({ 'color': '#22bb77' });
        }
        else if (attr == 'gray') {
            $('#valid-area .' + pic).css({ '-webkit-filter': 'grayscale(100%)', 'filter': 'grayscale(100%)' });
            $('#valid-area .' + text).css({ 'color': '#888' });
        }
    }



});
