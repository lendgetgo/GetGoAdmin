
var baseUrl = "http://lendgetgo-001-site1.atempurl.com/UploadedFiles/";
//var baseUrl = "http://" + _ipaddress + "/Getgo/Images/";
$(document).ready(function () {
    $('#lblCollateral').click(function () {
        window.location.replace("./Collateral.aspx");
    });

    $.ajax({
        url: "Home.aspx/GetNewAccountImages",
        type: "POST",
        data: "{}",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            console.log(d);
            var defaultImage = "../dist/img/avatar.png";

            // Set profile picture with default image if the source is null or empty
            $('#profilePicMaster').attr('src', d[0].PROFILE_IMAGE ? baseUrl + d[0].PROFILE_IMAGE : defaultImage);
            $('#imgProfile').attr('src', d[0].PROFILE_IMAGE ? baseUrl + d[0].PROFILE_IMAGE : defaultImage);
        }
    });
});