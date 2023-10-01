$(document).ready(function () {
    GetLoanAmount(function (e) {
        $("#txtLoanAmount").html("");
        $('<option/>', {
            value: 'none',
            text: 'Please select'
        }).appendTo($("#txtLoanAmount"));
        for (var i in e) {
            $('<option/>', {
                value: e[i]['LOAN_PLAN_ID'],
                text: e[i]['AMOUNT']
            }).appendTo($("#txtLoanAmount"));
        }
        $("#txtLoanAmount").on('change', function () {
            $('#txtProcessingFee').val(e[0]['PROCESS_FEE']);
            $('#txtInterestRate').val(e[0]['INTEREST']);
        });
        GetInstallmentPlan(function (e) {
            $("#slctInstallmentType").html("");
            $('<option/>', {
                value: 'none',
                text: 'Please select'
            }).appendTo($("#slctInstallmentType"));
            for (var i in e) {
                $('<option/>', {
                    value: e[i]['INSTALLMENT_ID'],
                    text: e[i]['INSTALLMENT_PLAN']
                }).appendTo($("#slctInstallmentType"));
            }
            $("#slctInstallmentType").on("change", function () {
                var intPlan_ID = $("#slctInstallmentType").val();
                GetLoanTenure(intPlan_ID, function (e) {
                    $("#txtLoanTenure").html("");
                    $('<option/>', {
                        value: 'none',
                        text: 'Please select'
                    }).appendTo($("#txtLoanTenure"));
                    for (var i in e) {
                        $('<option/>', {
                            value: e[i]['TENURE'],
                            text: e[i]['TENURE']
                        }).appendTo($("#txtLoanTenure"));
                    }
                });
            });
        });
    });
});

function GetLoanAmount(callback) {
    $.ajax({
        url: "Borrowers.aspx/GetLoanAmount",
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

function GetInstallmentPlan(callback) {
    $.ajax({
        url: "Borrowers.aspx/GetInstallmentPlan",
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

function GetLoanTenure(_PLAN_ID, callback) {
    $.ajax({
        url: "Borrowers.aspx/GetLoanTenure",
        type: "POST",
        data: JSON.stringify({ PLAN_ID: _PLAN_ID }),
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
