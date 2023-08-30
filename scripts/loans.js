var currentLocation1 = window.location.href;

$(document).ready(function () {

    $('#datepicker').datepicker({
        autoclose: true
    })
    if (currentLocation1.includes("View_Loan.aspx")) {

        GetLoanList(function (e) {
            if ($("#tblLoan").hasClass("dataTable")) {
                $("#tblLoan").DataTable().destroy();
            }
            $('#tblLoan').DataTable({
                data: e,
                columns: [
                    { "data": "LOAN_ID" },
                    { "data": "CompleteName" },
                    { "data": "RELEASED_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "STATUS" },
                    {
                        "data": null,
                        "className": "dt-center editor-edit",
                        "defaultContent": '<i class="glyphicon glyphicon-edit" style="cursor: pointer"/>',
                        "orderable": false
                    },
                ],
                columnDefs: [{ "targets": 0, visible: false }]
            });

        });
    }

    if (currentLocation1.includes('View_Borrower_Loan.aspx')) {
        GetBorrowerLoan(function (e) {
            if ($("#tblBorrowersLoan").hasClass("dataTable")) {
                $("#tblBorrowersLoan").DataTable().destroy();
            }
            $('#tblBorrowersLoan').DataTable({
                data: e,
                columns: [
                    { "data": "LOAN_ID" },
                    { "data": "CompleteName" },
                    { "data": "RELEASED_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "MATURITY_DATE" },
                    { "data": "STATUS" },
                    {
                        "data": null,
                        "className": "dt-center editor-edit",
                        "defaultContent": '<i class="glyphicon glyphicon-edit" style="cursor: pointer"/>',
                        "orderable": false
                    },
                ],
                columnDefs: [{ "targets": 0, visible: false }]
            });

        });
    }
});

function GetLoanList(callback) {
    $.ajax({
        url: "View_Loan.aspx/GetLoanList",
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

function GetBorrowerLoan(callback) {
    $.ajax({
        url: "View_Borrower_Loan.aspx/GetBorrowerLoan",
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