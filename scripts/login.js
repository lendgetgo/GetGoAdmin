$(document).ready(function () {
    $('#ForgotPassContent').hide();
    $('#btnNext').hide();

    $('#lblforgotPass').on('click', function () {
        $('#loginContent').hide();
        $('#ForgotPassContent').show();
    });

    $('#btnSubmit').on('click', function () {
        var _txtForgotEmail = $('#_emailForgotPass').val();
        GetContactNo(_txtForgotEmail, function (e) {
            $('#txtContactNo').text('We send the authetication CODE on 09_ _ _ _ _' + e[0]['CONTACT_NO'].substr(7, 5));
            $('#btnNext').show();
            $('#btnSubmit').hide();
        });
    });
    $('#btnNext').on('click', function () {
        $('#ForgotPassContent').hide();
        $('#AuthenticationContent').show();
    });

    $('#btnLogin').on('click', function () {
        var _emailAddress = $('#_emailAddress').val();
        var _password = $('#_password').val();
        if ((_emailAddress == "") || (_password == "")) {
            notification("error", "Please input your Email/Password!");
        }
        else {
            GetUserAccess(_emailAddress, _password, function (e) {
                window.location.replace("pages/Home.aspx");
            });
        }
    });
    
});

function GetUserAccess(emailAddress, password, callback) {
    $.ajax({
        url: "Login.aspx/GetUserAccess",
        type: "POST",
        data: JSON.stringify({ EMAIL_ADDRESS: emailAddress, PASSWORD: password }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            if (callback !== undefined) {
                if (d.length > 0) {
                    callback(d);
                }
                else {
                    notification("error", "Invalid Email/Password!");
                }
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetContactNo(emailAddress, callback) {
    $.ajax({
        url: "Login.aspx/GetContactNo",
        type: "POST",
        data: JSON.stringify({ EMAIL_ADDRESS: emailAddress }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            console.log(d);
            if (callback !== undefined) {
                if (d.length > 0) {
                    callback(d);
                }
                else {
                    notification("error", "Invalid Email!");
                }
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
