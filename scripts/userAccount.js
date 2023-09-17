var currentLocation1 = window.location.href;

$(document).ready(function () {

    $('#datepicker').datepicker({
        autoclose: true
    })
});

if (currentLocation1.includes('Add_Account.aspx')) {
    $('#btnSubmit').on('click', function () {
        var USER_ACCESS = $('#slctAccess').val();
        var USER_NAME = $('#txtUserName').val();
        var FIRST_NAME = $('#txtFirstName').val();
        var MIDDLE_NAME = $('#txtMiddleName').val();
        var LAST_NAME = $('#txtLastName').val();
        var EXTENSION_NAME = $('#txtExtensionName').val();
        var EMAIL_ADDRESS = $('#txtEmail').val();
        var REGION = $('#txtRegion').val();
        var PROVINCE = $('#txtProvince').val();
        var CITY = $('#txtCity').val();
        var PASSWORD = $('#txtPassword').val();
        var AGE = $('#txtAge').val();
        var DATE_OF_BIRTH = $('#datepicker').val();
        var SEX = $('#slctSex').val();
        var CONTACTNO = $('#txtContactNo').val();
        var BARANGAY = $('#txtBarangay').val();
        var ZIPCODE = $('#txtZipCode').val();
        var STREET_NO = $('#txtStNo').val();
        var CREATED_BY = '12345';
/*        var UPDATED_BY = 'ABCDE';*/
        var _request = {};

        _request.USER_ACCESS = USER_ACCESS;
        _request.USERNAME = USER_NAME;
        _request.FIRST_NAME = FIRST_NAME;
        _request.MIDDLE_NAME = MIDDLE_NAME;
        _request.LAST_NAME = LAST_NAME;
        _request.EXTENSION_NAME = EXTENSION_NAME;
        _request.EMAIL_ADDRESS = EMAIL_ADDRESS;
        _request.CONTACT_NO = CONTACTNO;
        _request.REGION = REGION;
        _request.PROVINCE = PROVINCE;
        _request.CITY = CITY;
        _request.PASSWORD = PASSWORD
        _request.AGE = AGE;
        _request.DATE_OF_BIRTH = DATE_OF_BIRTH;
        _request.SEX = SEX;
        _request.BARANGAY = BARANGAY;
        _request.ZIPCODE = ZIPCODE;
        _request.STREET_NO = STREET_NO;
        _request.CREATED_BY = CREATED_BY;
        //_request.UPDATED_BY = UPDATED_BY;

        $.ajax({
            url: 'Add_Account.aspx/AddUserAccount',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify({ request: _request }),
            success: function (e) {
                notification('success', 'Save successfully!');
                $('html, body').animate({ scrollTop: '0px' }, 0);
                $('#content').load(' #content > *');
            }
        });
    })
}

if (currentLocation1.includes('View_Account.aspx')) {
    GetUsers(function (e) {
        if ($("#tblUsers").hasClass("dataTable")) {
            $("#tblUsers").DataTable().destroy();
        }
        $('#tblUsers').DataTable({
            data: e,
            columns: [
                { "data": "CompleteName" },
                { "data": "USER_ACCESS" },
                { "data": "USER_ID" },
                { "data": "CONTACT_NO" },
                { "data": "EMAIL_ADDRESS" },
                {
                    "data": null,
                    "className": "dt-center editor-edit",
                    "defaultContent": '<i class="glyphicon glyphicon-edit" style="cursor: pointer"/>',
                    "orderable": false
                },
                {
                    "data": null,
                    "className": "dt-center editor-delete",
                    "defaultContent": '<i class="glyphicon glyphicon-trash" style="cursor: pointer"/>',
                    "orderable": false
                }
            ]
            //columnDefs: [{ "targets": 0, visible: false }]
        });

    });
}

function GetUsers(callback) {
    $.ajax({
        url: "View_Account.aspx/GetUserList",
        type: "POST",
        data: "{}",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            console.log(d);
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}