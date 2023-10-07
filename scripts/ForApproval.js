var currentLocation1 = window.location.href;

$(document).ready(function () {
    $('#btnLoan').on('click', function () {
        $('#btnLoan').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#btnAccount').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnRepayments').removeClass('btn btn-success').addClass('btn btn-primary');

        GetUserLoanForApproval(function (e) {
            if ($("#tblLoan").hasClass("dataTable")) {
                $("#tblLoan").DataTable().destroy();
            }
            $('#tblLoan').DataTable({
                data: e,
                columns: [
                    {
                        "data": null,
                        "className": "dt-center editor-view",
                        "defaultContent": '<i class="glyphicon glyphicon-open" style="cursor: pointer"/> view',
                        "orderable": false
                    },
                    { "data": "COMPLETE_NAME" },
                    { "data": "STATUS_DATE" }
                ]
            });

            $('#tblLoan').on('click', 'td.editor-view', function (e) {
                var tblBorrowers_delete = $('#tblLoan').DataTable();
                var data = tblBorrowers_delete.row($(this).closest('tr')).data();
                var USER_ID_loan = data[Object.keys(data)[1]];
                //console.log(USER_ID_view);
                $('#LoanModal').modal('show');

                $.ajax({
                    url: "SharedService.asmx/GetUSelectedserDetail",
                    type: "POST",
                    data: JSON.stringify({ _USER_ID: USER_ID_loan }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        var d = JSON.parse(e.d)

                        $('#lblName_Loan').text(d[0]['FIRST_NAME'] + ' ' + d[0]['LAST_NAME']);
                        $('#lblAge_Loan').text(d[0]['AGE'] + ' ');
                        $('#lblSex_Loan').text(d[0]['SEX']);
                        $('#lblBusinessName_Loan').text(d[0]['BUSSINESS_NAME']);
                        $('#lblStreet_Loan').text(d[0]['STREET_NO'] + ' ' + d[0]['BARANGAY']);
                        $('#lblCity_Loan').text(d[0]['CITY']);
                        $('#lblProvince_Loan').text(d[0]['PROVINCE']);
                        $('#lblZipcode_Loan').text(d[0]['ZIPCODE']);
                        $('#lblLandline_Loan').text('N/A');
                        $('#lblEmail_Loan').text(d[0]['EMAIL_ADDRESS']);
                        $('#lblContactNo_Loan').text(d[0]['CONTACTNO']);

                    }
                });
            });
        });

        $('#LoanContent').show();
        $('#AccountContent').hide();
        $('#RepaymentsContent').hide();
        $('#WithdrawalContent').hide();
    });

    $('#btnAccount').on('click', function () {
        $('#btnAccount').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#btnLoan').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnRepayments').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#AccountContent').show();
        $('#LoanContent').hide();
        $('#RepaymentsContent').hide();
        $('#WithdrawalContent').hide();
    });

    $('#btnWithdrawal').on('click', function () {
        $('#btnAccount').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnLoan').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#btnRepayments').removeClass('btn btn-success').addClass('btn btn-primary');

        GetUserWithdrawalForApproval(function (e) {
            if ($("#tblRepayments").hasClass("dataTable")) {
                $("#tblRepayments").DataTable().destroy();
            }
            $('#tblRepayments').DataTable({
                data: e,
                columns: [
                    {
                        "data": null,
                        "className": "dt-center editor-view",
                        "defaultContent": '<i class="glyphicon glyphicon-open" style="cursor: pointer"/> view',
                        "orderable": false
                    },
                    { "data": "COMPLETE_NAME" },
                    { "data": "CREATED_DATE" }
                ]
            });

           
        });

        $('#AccountContent').hide();
        $('#LoanContent').hide();
        $('#RepaymentsContent').show();
        $('#WithdrawalContent').hide();
    });

    $('#btnRepayments').on('click', function () {
        $('#btnAccount').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnLoan').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnRepayments').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#AccountContent').hide();
        $('#LoanContent').hide();
        $('#RepaymentsContent').hide();
        $('#WithdrawalContent').show();
    });

    GetUserListForApproval(function (e) {
        if ($("#tblUsers").hasClass("dataTable")) {
            $("#tblUsers").DataTable().destroy();
        }
        $('#tblUsers').DataTable({
            data: e,
            columns: [
                {
                    "data": null,
                    "className": "dt-center editor-view",
                    "defaultContent": '<i class="glyphicon glyphicon-open" style="cursor: pointer"/> view',
                    "orderable": false
                },
                { "data": "COMPLETE_NAME" },
                { "data": "CREATED_DATE" }
            ]
        });

        var USER_ID_view;
        $('#tblUsers').on('click', 'td.editor-view', function (e) {
            var tblBorrowers_delete = $('#tblUsers').DataTable();
            var data = tblBorrowers_delete.row($(this).closest('tr')).data();
            USER_ID_view = data[Object.keys(data)[1]];
            console.log(USER_ID_view);
            $('#UserModal').modal('show');

            $.ajax({
                url: "SharedService.asmx/GetUSelectedserDetail",
                type: "POST",
                data: JSON.stringify({ _USER_ID: USER_ID_view }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (e) {
                    var d = JSON.parse(e.d)
                    //GetBorrowerDetails(BORROWER_USER_ID, function (b) {
                    $('#lblName').text(d[0]['FIRST_NAME'] + ' ' + d[0]['LAST_NAME']);
                    $('#lblAge').text(d[0]['AGE'] + ' ');
                    $('#lblSex').text(d[0]['SEX']);
                    $('#lblBusinessName').text(d[0]['BUSSINESS_NAME']);
                    $('#lblStreet').text(d[0]['STREET_NO'] + ' ' + d[0]['BARANGAY']);
                    $('#lblCity').text(d[0]['CITY']);
                    $('#lblProvince').text(d[0]['PROVINCE']);
                    $('#lblZipcode').text(d[0]['ZIPCODE']);
                    $('#lblLandline').text('N/A');
                    $('#lblEmail').text(d[0]['EMAIL_ADDRESS']);
                    $('#lblContactNo').text(d[0]['CONTACTNO']);
                    //});
                }
            });

            GetUserAttachment(USER_ID_view, function (d) {
                var imgsource = "..\..\GetGo\UploadedFiles";
                var imgType = d[0]["IMAGE_TYPE"];
                if (imgType == 'FRONTFACE') {
                    $("#imgFrontFace").attr("src", imgsource + "'\'" + d[0]["DESCRIPTION"]);
                }
                console.log(imgsource);
            });

            $('#btnApproveUser').on('click', function () {
                var _AMOUNT = $('#txtCreditLimit').val();
                UpdateCreditLimitForApproval(USER_ID_view, _AMOUNT, function () {
                    if (confirm("Approve?")) {
                        notification("success", "Successfully Approved!");

                        $(document).ready(function () {
                            $.ajax({
                                url: "Notification.aspx/CountForApproval",
                                type: "POST",
                                data: "{}",
                                contentType: "application/json;charset=utf-8",
                                dataType: "json",
                                success: function (e) {
                                    var d = JSON.parse(e.d)
                                    $('#txtNotificationCount').text(d[0]["NOTIF"]);
                                    $('#content').load(' #content > *');
                                },
                                error: function (errormessage) {
                                    alert(errormessage.responseText);
                                }
                            });
                        });

                    }
                });
            });
        });


    });
});

function GetUserListForApproval(callback) {
    $.ajax({
        url: "Notification.aspx/GetUserListForApproval",
        type: "POST",
        data: "{}",
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

function GetUserLoanForApproval(callback) {
    $.ajax({
        url: "Notification.aspx/GetUserLoanForApproval",
        type: "POST",
        data: "{}",
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

function GetUserWithdrawalForApproval(callback) {
    $.ajax({
        url: "Notification.aspx/GetUserWithdrawalForApproval",
        type: "POST",
        data: "{}",
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

function GetUserAttachment(_USERID, callback) {
    $.ajax({
        url: "Notification.aspx/GetUserAttachment",
        type: "POST",
        data: JSON.stringify({ _USER_ID: _USERID }),
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

function UpdateCreditLimitForApproval(_USERID, _AMOUNT, callback) {
    $.ajax({
        url: "Notification.aspx/UpdateCreditLimitForApproval",
        type: "POST",
        data: JSON.stringify({ _USER_ID: _USERID, _AMOUNT: _AMOUNT }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}