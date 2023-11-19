$(document).ready(function () {
    $('#txtLoanAmount').on('click', function () {
        $("#txtLoanAmount").find('option').prop('disabled', false);
        $('#txtLoanAmount').find('option').each(function (i, e) {
            var opt = $(e);
            console.log(opt.text());
            if (opt.text() > _CREDIT_LIMIT) {
                opt.prop('disabled', true);
            }
        })
        console.log(_CREDIT_LIMIT);
    });
    GetLoanAmount(function (e) {
        $("#txtLoanAmount").html("");
        $('<option/>', {
            value: 'none',
            text: 'Please select'
        }).appendTo($("#txtLoanAmount"));
        for (var i in e) {
            $('<option/>', {
                value: e[i]['LOAN_PLAN_ID'],
                text: e[i]['AMOUNT'],
                'data-interest': e[i]['INTEREST'],
                'data-process': e[i]['PROCESS_FEE']
            }).appendTo($("#txtLoanAmount"));
        }
        $("#txtLoanAmount").on('change', function () {
            $('#txtProcessingFee').val($("#txtLoanAmount").find(':selected').data("process"));
            $('#txtInterestRate').val($("#txtLoanAmount").find(':selected').data("interest"));
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
                            value: e[i]['TENURE_ID'],
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
