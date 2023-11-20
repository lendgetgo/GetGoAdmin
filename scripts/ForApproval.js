var currentLocation1 = window.location.href;
var baseUrl = "http://lendgetgo-001-site1.atempurl.com/UploadedFiles/";
//var baseUrl = "http://" + _ipaddress + "/Getgo/Images/";

var USER_ID;
var USER_ID_loan;
var _STATUS;
var _CONTACTNO;
var _emailaddress;
var USER_ID_view;
var USER_ID_loan_W;
$(document).ready(function () {
    

    $('#btnLoan').on('click', function () {


        $('#btnLoan').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#btnAccount').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnRepayments').removeClass('btn btn-success').addClass('btn btn-primary');

        displayLoanForApproval();

        $('#LoanContent').show();
        $('#AccountContent').hide();
        $('#RepaymentsContent').hide();
        $('#WithdrawalContent').hide();

        $('#btnApproveUser_Loan').on('click', function (e) {
            if (confirm("Are you sure you want to Approve?")) {
                _STATUS = 'APPROVED';
                UpdateBorrowerLoanStatus(USER_ID_loan, _STATUS, function () {
                    _emailaddress = '';
                });
            }
        });

        $('#btnDeclineUser_Loan').on('click', function (e) {
            if (confirm("Are you sure you want to Decline?")) {
                _STATUS = 'DECLINED';
                DeclineUserLoan(USER_ID_loan, _STATUS, function () {
                    _emailaddress = '';
                });
            }
        });
    });
   
    $('#btnAccount').on('click', function () {
        $('#btnAccount').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#btnLoan').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnRepayments').removeClass('btn btn-success').addClass('btn btn-primary');

        displayUsersForApproval();

        $('#AccountContent').show();
        $('#LoanContent').hide();
        $('#RepaymentsContent').hide();
        $('#WithdrawalContent').hide();

        $('#btnApproveUser').on('click', function () {
            var _AMOUNT = $('#txtCreditLimit').val();
            if (confirm("Are you sure you want to Approve?")) {
                UpdateCreditLimitForApproval(USER_ID_view, _AMOUNT, function () {
                    $.ajax({
                        url: "Notification.aspx/CountForApproval",
                        type: "POST",
                        data: "{}",
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        success: function (e) {
                            var d = JSON.parse(e.d)

                            $('#txtNotificationCount').text(d[0]["NOTIF"]);
                        },
                        error: function (errormessage) {
                            alert(errormessage.responseText);
                        }
                    });


                });
            }
        });

        $('#btnDeclineUser').on('click', function () {
            if (confirm("Are you sure you want to Decline?")) {
                DeclineUser(USER_ID_view, function () {});
            }
        });
    });

    $('#btnWithdrawal').on('click', function () {
        $('#btnAccount').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnLoan').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#btnRepayments').removeClass('btn btn-success').addClass('btn btn-primary');

        displayWithrawalForApproval();
        

        $('#AccountContent').hide();
        $('#LoanContent').hide();
        $('#RepaymentsContent').show();
        $('#WithdrawalContent').hide();

        $('#btnNotifyBorrower').click(function () {
            UpdateBorrowerWithdrawalStatus(USER_ID_loan_W, function () { });
        });
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

    ///// USERS FRO APPROVAL 
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
                _emailaddress = d[0]['EMAIL_ADDRESS'];
                _CONTACTNO = d[0]['CONTACTNO'];
                $.ajax({
                    url: "Notification.aspx/GetNewAccountImages",
                    type: "POST",
                    data: JSON.stringify({ userid: USER_ID_view }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {


                        var d = JSON.parse(e.d)

                        var defaultImage = "../dist/img/avatar.png";

                        // Set profile picture with default image if the source is null or empty
                        $('#profilePic').attr('src', d[0].PROFILE_IMAGE ? baseUrl + d[0].PROFILE_IMAGE : defaultImage);

                        // Set front face image with default image if the source is null or empty
                        $('#imgFrontFace').attr('src', d[0].FRONTFACE ? baseUrl + d[0].FRONTFACE : defaultImage);
                        $('#lblFrontFace').text(d[0].FRONTFACE ? baseUrl + d[0].FRONTFACE : '');
                        // Set back face image with default image if the source is null or empty
                        $('#imgBackFace').attr('src', d[0].BACKFACE ? baseUrl + d[0].BACKFACE : defaultImage);
                        $('#lblBackFace').text(d[0].BACKFACE ? baseUrl + d[0].BACKFACE : defaultImage);

                        // Set signature image with default image if the source is null or empty
                        $('#imgSignature').attr('src', d[0].SIGNATURE_ ? baseUrl + d[0].SIGNATURE_ : defaultImage);
                        $('#lblSignature').text(d[0].SIGNATURE_ ? baseUrl + d[0].SIGNATURE_ : defaultImage);

                        console.log(d);
                    }
                });
                //});
            }

        });

    });

    ///// LOAN FOR APPROVAL
    $('#tblLoan').on('click', 'td.editor-view', function (e) {
        var tblBorrowers_delete = $('#tblLoan').DataTable();
        var data = tblBorrowers_delete.row($(this).closest('tr')).data();
        USER_ID_loan = data[Object.keys(data)[0]];
        USER_ID = data[Object.keys(data)[1]];

        $('#LoanModal').modal('show');

        $.ajax({
            url: "SharedService.asmx/GetUSelectedserDetail",
            type: "POST",
            data: JSON.stringify({ _USER_ID: USER_ID }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (e) {
                var d = JSON.parse(e.d)
                //console.log(d);
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

                _CONTACTNO = d[0]['CONTACTNO'];
                _emailaddress = d[0]['EMAIL_ADDRESS'];

                $.ajax({
                    url: "Notification.aspx/GetUserLoanDetailsForApproval",
                    type: "POST",
                    data: JSON.stringify({ _LOAN_ID: USER_ID_loan }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        var d = JSON.parse(e.d)
                        console.log(d);
                        $('#lblLoan_Amount').text(d[0]['AMOUNT']);
                        $('#lblInstallment_Plan').text(d[0]['INSTALLMENT_PLAN']);
                        $('#lblMonthsTo_Pay').text(d[0]['MONTHSTOPAY']);
                        $('#lblBranch_Name').text(d[0]['BRANCH']);
                        $('#lblMonthly_Payment').text(d[0]['MONTHLYPAYMENT']);
                        $('#lblNature_of_Work').text(d[0]['NATURE_OF_WORK']);
                        $('#lblMonthly_Gross_Income').text(d[0]['MONTHLY_GROSS']);
                        $('#lblCharacter_Reference').text(d[0]['CHARACTER_REFERENCE']);
                        $('#lblCo-guarantor').text(d[0]['CO_GUARANTOR_NAME']);
                        $('#lblPhone_of_Co-guarantor').text(d[0]['CO_GUARANTOR_NUMBER']);
                    }
                });

                $.ajax({
                    url: "Notification.aspx/GetNewAccountImages",
                    type: "POST",
                    data: JSON.stringify({ userid: USER_ID }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {


                        var d = JSON.parse(e.d)

                        var defaultImage = "../dist/img/avatar.png";

                        // Set profile picture with default image if the source is null or empty
                        $('#profilePic_loan').attr('src', d[0].PROFILE_IMAGE ? baseUrl + d[0].PROFILE_IMAGE : defaultImage);

                        // Set front face image with default image if the source is null or empty
                        $('#imgFrontFace_Loan').attr('src', d[0].FRONTFACE ? baseUrl + d[0].FRONTFACE : defaultImage);
                        $('#lblFrontFace_Loan').attr('href', d[0].FRONTFACE ? baseUrl + d[0].FRONTFACE : '');
                        // Set back face image with default image if the source is null or empty
                        $('#imgBackFace_Loan').attr('src', d[0].BACKFACE ? baseUrl + d[0].BACKFACE : defaultImage);
                        $('#lblBackFace_Loan').attr('href', d[0].BACKFACE ? baseUrl + d[0].BACKFACE : defaultImage);

                        // Set signature image with default image if the source is null or empty
                        $('#imgSignature_Loan').attr('src', d[0].SIGNATURE_ ? baseUrl + d[0].SIGNATURE_ : defaultImage);
                        $('#lblSignature_Loan').attr('href', d[0].SIGNATURE_ ? baseUrl + d[0].SIGNATURE_ : defaultImage);

                        console.log(d);
                    }
                });

            }
        });

    });

    ///// WITHSRAWAL FOR APPROVAL
    $('#tblRepayments').on('click', 'td.editor-view-w', function (e) {
        var tblBorrowers_delete = $('#tblRepayments').DataTable();
        var data = tblBorrowers_delete.row($(this).closest('tr')).data();
        USER_ID_loan_W = data[Object.keys(data)[0]];
        var USER_ID_W = data[Object.keys(data)[1]];
        $('#WithdrawalModal').modal('show');

        $.ajax({
            url: "SharedService.asmx/GetUSelectedserDetail",
            type: "POST",
            data: JSON.stringify({ _USER_ID: USER_ID_W }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (e) {
                var d = JSON.parse(e.d)
                $('#lblName_W').text(d[0]['FIRST_NAME'] + ' ' + d[0]['LAST_NAME']);
                $('#lblAge_W').text(d[0]['AGE'] + ' ');
                $('#lblSex_W').text(d[0]['SEX']);
                $('#lblBusinessName_W').text(d[0]['BUSSINESS_NAME']);
                $('#lblStreet_W').text(d[0]['STREET_NO'] + ' ' + d[0]['BARANGAY']);
                $('#lblCity_W').text(d[0]['CITY']);
                $('#lblProvince_W').text(d[0]['PROVINCE']);
                $('#lblZipcode_W').text(d[0]['ZIPCODE']);
                $('#lblLandline_W').text('N/A');
                $('#lblEmail_W').text(d[0]['EMAIL_ADDRESS']);
                $('#lblContactNo_W').text(d[0]['CONTACTNO']);
                _CONTACTNO = d[0]['CONTACTNO'];
                _emailaddress = d[0]['EMAIL_ADDRESS'];

                $.ajax({
                    url: "Notification.aspx/GetUserLoanDetailsForApproval",
                    type: "POST",
                    data: JSON.stringify({ _LOAN_ID: USER_ID_loan_W }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        var d = JSON.parse(e.d)
                        $('#lblLoan_Amount_W').text(d[0]['AMOUNT']);
                        $('#lblInstallment_Plan_W').text(d[0]['INSTALLMENT_PLAN']);
                        $('#lblMonthsTo_Pay_W').text(d[0]['MONTHSTOPAY']);
                        $('#lblBranch_Name_W').text(d[0]['BRANCH']);
                        $('#lblMonthly_Payment_W').text(d[0]['MONTHLYPAYMENT']);
                        $('#lblNature_of_Work_W').text(d[0]['NATURE_OF_WORK']);
                        $('#lblMonthly_Gross_Income_W').text(d[0]['MONTHLY_GROSS']);
                        $('#lblCharacter_Reference_W').text(d[0]['CHARACTER_REFERENCE']);
                        $('#lblCo-guarantor_W').text(d[0]['CO_GUARANTOR_NAME']);
                        $('#lblPhone_of_Co-guarantor_W').text(d[0]['CO_GUARANTOR_NUMBER']);

                    }
                });
            }
        });
    });
});

function displayWithrawalForApproval() {
    GetUserWithdrawalForApproval(function (e) {
        if ($("#tblRepayments").hasClass("dataTable")) {
            $("#tblRepayments").DataTable().destroy();
        }
        $('#tblRepayments').DataTable({
            data: e,
            columns: [
                {
                    "data": null,
                    "className": "dt-center editor-view-w",
                    "defaultContent": '<i class="glyphicon glyphicon-open" style="cursor: pointer"/> view',
                    "orderable": false
                },
                { "data": "COMPLETE_NAME" },
                { "data": "CREATED_DATE" }
            ]
        });
    });
}

function displayUsersForApproval() {
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
    });
}

function displayLoanForApproval() {

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
    });
}

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
    var output = 'Your Account was successfully Approved!';
    $.ajax({
        url: "Notification.aspx/UpdateCreditLimitForApproval",
        type: "POST",
        data: JSON.stringify({ _USER_ID: _USERID, _AMOUNT: _AMOUNT }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            displayUsersForApproval();
            $('#UserModal').modal('toggle');
            notification("success", "Successfully Approved!");
            GetUserID(output, _emailaddress, function () { });
            SendSMS(_CONTACTNO, output, function () { });
            _emailaddress = '';
            //window.location.replace('Notification.aspx');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function DeclineUser(_USERID, callback) {
    var output = 'Your Account was declined!';
    $.ajax({
        url: "Notification.aspx/DeclineUser",
        type: "POST",
        data: JSON.stringify({ _USER_ID: _USERID }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            displayUsersForApproval();
            $('#UserModal').modal('toggle');
            notification("success", "Successfully Declined!");
            GetUserID(output, _emailaddress, function () { });
            SendSMS(_CONTACTNO, output, function () { });
            _emailaddress = '';
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function DeclineUserLoan(_LOAN_ID, _STATUS, callback) {
    var output = 'Your Loan was declined!';
    $.ajax({
        url: "Notification.aspx/UpdateBorrowerLoanStatus",
        type: "POST",
        data: JSON.stringify({ _LOAN_ID: _LOAN_ID, _STATUS: _STATUS }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            displayLoanForApproval();
            $('#LoanModal').modal('toggle');
            notification("success", "Successfully Declined!");
            GetUserID(output, _emailaddress, function () { });
            SendSMS(_CONTACTNO, output, function () { });
            _emailaddress = '';
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UpdateBorrowerLoanStatus(_LOAN_ID, _STATUS, callback) {
    var output = 'Your Loan was successfully Approved!';
    $.ajax({
        url: "Notification.aspx/UpdateBorrowerLoanStatus",
        type: "POST",
        data: JSON.stringify({ _LOAN_ID: _LOAN_ID, _STATUS: _STATUS }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d);
            displayLoanForApproval();
            $('#LoanModal').modal('toggle');
            notification("success", "Successfully Approved!");
            GetUserID(output, _emailaddress, function () { });
            SendSMS(_CONTACTNO, output, function () { });
            _emailaddress = '';
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UpdateBorrowerWithdrawalStatus(_WITHDRAWAL_ID, callback) {
    var output = 'Your Withdrawal Request was successfully Approved!';
    $.ajax({
        url: "Notification.aspx/UpdateBorrowerWithdrawalStatus",
        type: "POST",
        data: JSON.stringify({ _WITHDRAWAL_ID: _WITHDRAWAL_ID }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d);
            displayWithrawalForApproval();
            $('#WithdrawalModal').modal('toggle');
            notification("success", "Successfully Approved!");
            GetUserID(output, _emailaddress, function () { });
            console.log(_CONTACTNO + ' ' + output);
            SendSMS(_CONTACTNO, output, function () { });
            _emailaddress = '';
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function SendSMS(_contactNo, _AuthenticationCode, callback) {
    $.ajax({
        url: "Notification.aspx/SendSMS",
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
        url: "Notification.aspx/GetUserID",
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