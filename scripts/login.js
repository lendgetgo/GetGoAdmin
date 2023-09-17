$(document).ready(function () {
    
    $('#btnLogin').on('click', function () {
        var _emailAddress = $('#_emailAddress').val();
        var _password = $('#_password').val();
        GetUserAccess(_emailAddress, _password, function (e) {
            
            alert('test');
        });
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
            console.log(e);
            if (callback !== undefined) {
                callback(e);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}