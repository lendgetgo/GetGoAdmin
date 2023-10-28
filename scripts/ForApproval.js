var currentLocation1 = window.location.href;
var baseUrl = "http://192.168.1.12/Images/";
$(document).ready(function () {
    $('#btnLoan').on('click', function () {
        $('#btnLoan').removeClass('btn btn-primary').addClass('btn btn-success');
        $('#btnAccount').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnWithdrawal').removeClass('btn btn-success').addClass('btn btn-primary');
        $('#btnRepayments').removeClass('btn btn-success').addClass('btn btn-primary');

        var USER_ID;
        var USER_ID_loan;
        var _STATUS;
        var _CONTACTNO;
        var _emailaddress;
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
                        _CONTACTNO = d[0]['CONTACTNO'];
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
                        
                    }
                });
            });
        });

        $('#LoanContent').show();
        $('#AccountContent').hide();
        $('#RepaymentsContent').hide();
        $('#WithdrawalContent').hide();
        $('#btnApproveUser_Loan').on('click', function () {
            _STATUS = 'APPROVED';
            $('#LoanModal').modal('toggle');
            UpdateBorrowerLoanStatus(USER_ID_loan, _STATUS, function () { });
            var tblBorrowers_delete = $('#tblLoan').DataTable();
            tblBorrowers_delete.row($(this).closest('tr')).remove().draw();
            var output = 'Your Loan ' + USER_ID_loan + ' was successfully Approved!';
            SendSMS(_CONTACTNO, output, function () {
                GetUserID(output, _emailaddress, function () { });
            });
            notification("success", "Successfully Approved!");
            _emailaddress = '';
        });
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

        var USER_ID_loan_W;
        var _CONTACTNO_W;
        var _emailaddress_w;

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

            $('#tblRepayments').on('click', 'td.editor-view-w', function (e) {
                var tblBorrowers_delete = $('#tblRepayments').DataTable();
                var data = tblBorrowers_delete.row($(this).closest('tr')).data();
                USER_ID_loan_W = data[Object.keys(data)[0]];
                var USER_ID_W = data[Object.keys(data)[1]];
                console.log(USER_ID_loan_W);
                $('#WithdrawalModal').modal('show');

                $.ajax({
                    url: "SharedService.asmx/GetUSelectedserDetail",
                    type: "POST",
                    data: JSON.stringify({ _USER_ID: USER_ID_W }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        var d = JSON.parse(e.d)
                        _CONTACTNO_W = d[0]['CONTACTNO'];
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
                        _emailaddress_w = d[0]['EMAIL_ADDRESS'];

                        $.ajax({
                            url: "Notification.aspx/GetUserLoanDetailsForApproval",
                            type: "POST",
                            data: JSON.stringify({ _LOAN_ID: USER_ID_loan_W }),
                            contentType: "application/json;charset=utf-8",
                            dataType: "json",
                            success: function (e) {
                                var d = JSON.parse(e.d)
                                console.log(d);
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

        $('#AccountContent').hide();
        $('#LoanContent').hide();
        $('#RepaymentsContent').show();
        $('#WithdrawalContent').hide();
        $('#btnNotifyBorrower').click(function () {
            $('#WithdrawalModal').modal('toggle');
            UpdateBorrowerWithdrawalStatus(USER_ID_loan_W, function () {
                var tblBorrowers_W = $('#tblRepayments').DataTable();
                tblBorrowers_W.row($(this).closest('tr')).remove().draw();
            });
            var output = 'Your Withdrawal Request was successfully Approved!';
            //SendSMS(_CONTACTNO_W, output, function () {
            console.log(_emailaddress_w);
                GetUserID(output, _emailaddress_w, function () { });
            //});
            notification("success", "Successfully Approved!");
            _emailaddress_w = '';
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
 // meow
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
                            $('#profilePic').attr('src', d[0].PROFILE ? baseUrl + d[0].PROFILE : defaultImage);

                            // Set front face image with default image if the source is null or empty
                            $('#imgFrontFace').attr('src', d[0].FRONTFACE ? baseUrl + d[0].FRONTFACE : defaultImage);

                            // Set back face image with default image if the source is null or empty
                            $('#imgBackFace').attr('src', d[0].BACKFACE ? baseUrl + d[0].BACKFACE : defaultImage);

                            // Set signature image with default image if the source is null or empty
                            $('#imgSignature').attr('src', d[0].SIGNATURE_ ? baseUrl + d[0].SIGNATURE_ : defaultImage);

                            console.log(d);
                        }
                    });
                    //});
                }
                
            });

            //GetUserAttachment(USER_ID_view, function (d) {
            //    var imgsource = "..\..\GetGo\UploadedFiles";
            //    var imgType = d[0]["IMAGE_TYPE"];
            //    if (imgType == 'FRONTFACE') {
            //        $("#imgFrontFace").attr("src", imgsource + "'\'" + d[0]["DESCRIPTION"]);
            //    }
            //    console.log(imgsource);
            //});

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

function UpdateBorrowerLoanStatus(_LOAN_ID, _STATUS, callback) {
    $.ajax({
        url: "Notification.aspx/UpdateBorrowerLoanStatus",
        type: "POST",
        data: JSON.stringify({ _LOAN_ID: _LOAN_ID, _STATUS: _STATUS }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UpdateBorrowerWithdrawalStatus(_WITHDRAWAL_ID, callback) {
    $.ajax({
        url: "Notification.aspx/UpdateBorrowerWithdrawalStatus",
        type: "POST",
        data: JSON.stringify({ _WITHDRAWAL_ID: _WITHDRAWAL_ID }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
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