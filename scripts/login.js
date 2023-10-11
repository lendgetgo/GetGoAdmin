var strCode = 'abc';
var strUserID;

$(document).ready(function () {
    initializePasswordValidation();
    $('#ForgotPassContent').hide();
    $('#btnNext').hide();

    $('#lblforgotPass').on('click', function () {
        $('#loginContent').hide();
        $('#ForgotPassContent').show();
        reset();
    });

    $('#btnSubmit').on('click', function () {
        var _txtForgotEmail = $('#_emailForgotPass').val();
        GetContactNo(_txtForgotEmail, function (data) {
            let output = createAuthenticationNumber();
            let contactNo = data[0]['CONTACT_NO'];
            let emailaddress = data[0]['EMAIL_ADDRESS'];
            strUserID = data[0]['USER_ID'];
            strCode = output;
            console.log(contactNo, output);
            //SendSMS(contactNo, output, function () {
            GetUserID(output, emailaddress, function () { });
                $('#txtContactNo').text('We send the authetication CODE on 09_ _ _ _ _' + data[0]['CONTACT_NO'].substr(7, 5) + ' then Click Next!');
                $('#btnNext').show();
                $('#btnSubmit').remove();
            //});
        });
    });
   
    $('#btnNext').on('click', function () {
        $('#ForgotPassContent').hide();
        $('#AuthenticationContent').show();
        reset();
    });

    $('#btnSubmitAuthentication').on('click', function () {
        var code1 = $('#txtCode1').val();
        var code2 = $('#txtCode2').val();
        var code3 = $('#txtCode3').val();
        var code4 = $('#txtCode4').val();
        var code5 = $('#txtCode5').val();
        var code6 = $('#txtCode6').val();
        var inputCode = '' + code1 + code2 + code3 + code4 + code5 + code6;
        if (inputCode == strCode) {
            console.log("SUCCESS");
            notification("success", "Authentication Code Correct!");
            $('#AuthenticationContent').hide();
            $('#ChangePassContent').show();
            reset();
        }
        else {
            notification("warning", "Authentication Code Incorrect!");
        }
    });

    $('#btnConfirm').on('click', function () {
        var strPassword = $('#_changePassword').val();
        var strConfirmPassword = $('#_confirmPassword').val();
        if (strPassword == strConfirmPassword) {
            UpdatePassword(strUserID, strPassword, function () {
                notification("success", "Success Password Change!");
                $('#ChangePassContent').hide();
                $('#loginContent').show();
                reset();
            });
        }
        else { notification("warning", "Password not matched!"); }
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

    $(".inputs").keyup(function () {
        if (this.value.length == this.maxLength) {
            var $next = $(this).next('.inputs');
            if ($next.length)   
                $(this).next('.inputs').focus();
            else
                $(this).blur();
        }
    });
});

function reset() {
    $(".input-lg").val("");
}

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

function createAuthenticationNumber() {
    var minm = 100000;
    var maxm = 999999;
    return Math.floor(Math.random() * (maxm - minm + 1)) + minm;
}

function SendSMS(_contactNo, _AuthenticationCode, callback) {
    $.ajax({
        url: "Login.aspx/SendSMS",
        type: "POST",
        data: JSON.stringify({ ContactNo: _contactNo, AutheticationCode: _AuthenticationCode }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetUserID(_query, _input, callback) {
    $.ajax({
        url: "Login.aspx/GetUserID",
        type: "POST",
        data: JSON.stringify({ Vcode: _query, input: _input }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UpdatePassword(strUserID, strPassword, callback) {
    $.ajax({
        url: "Login.aspx/UpdatePassword",
        type: "POST",
        data: JSON.stringify({ _USER_ID: strUserID, _PASSWORD: strPassword }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initializePasswordValidation() {
    $('#_changePassword').on('input', function () {
        const passwordValue = $('#_changePassword').val();

        // Check if the password meets the criteria
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
        const isValidPassword = passwordRegex.test(passwordValue);

        if (!isValidPassword) {
            $('#lblchangePassword').text('Password must contain 1 capital letter, 1 lowercase letter, 1 number, and be at least 8 characters long.');
        }
        else {
            $('#lblchangePassword').text('');
        }
    });

    $('#_confirmPassword').on('input', function () {
        const passwordValue = $('#_confirmPassword').val();

        // Check if the password meets the criteria
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
        const isValidPassword = passwordRegex.test(passwordValue);

        if (!isValidPassword) {
            $('#lblconfirmPassword').text('Password must contain 1 capital letter, 1 lowercase letter, 1 number, and be at least 8 characters long.');
        } else {
            $('#lblconfirmPassword').text('');
        }
    });
}
