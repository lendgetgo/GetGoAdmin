$(document).ready(function () {

    LoadBorrowerListDatatable();

    $('#datepicker').datepicker({
        autoclose: true
    })

    $('#btnSubmit').on('click', function () {
        var FIRST_NAME = $('#txtFirstName').val();
        var MIDDLE_NAME = $('#txtMiddleName').val();
        var LAST_NAME = $('#txtLastName').val();
        var EXTENSION_NAME = $('#txtExtensionName').val();
        var EMAIL_ADDRESS = $('#txtEmail').val();
        var CONTACTNO = $('#txtLandlinePhone').val();
        var REGION = $('#txtRegion').val();
        var PROVINCE = $('#txtProvince').val();
        var CITY = $('#txtCity').val();
        var AGE = $('#txtAge').val();
        var DATE_OF_BIRTH = $('#datepicker').val();
        var SEX = $('#slctSex').val();
        var MARITAL_STATUS = $('#txtMaritalStatus').val();
        var SPOUSE_NAME = $('#txtSpouseName').val();
        var BARANGAY = $('#txtBarangay').val();
        var ZIPCODE = $('#txtZipCode').val();
        var STREET_NO = $('#txtStNo').val();
        var BUSSINESS_NAME = $('#txtBusinessName').val();
        var MONTHLY_GROSS = $('#txtMonthlyGrossIncome').val();
        var CO_GUARANTOR_NAME = $('#txtCoguarantorName').val();
        var NATURE_OF_WORK = $('#slctNatureOfWork').val(); 
        var CHARACTER_REFERENCE = $('#txtCharacterReference').val();
        var CO_GUARANTOR_NUMBER = $('#txtCoguarantorPhoneNumber').val();
        //var USER_ID = $('#slctType').val();
        //var USER_ID = $('#txtNatureofCollateral').val();
        //var USER_ID = $('#txtDescription').val();
        //var USER_ID = $('#txtStatus').val();
        //var USER_ID = $('#txtValue').val();
        var CREATED_BY = '12345';
        var UPDATED_BY = 'ABCDE';
        var _request = {};

        _request.FIRST_NAME = FIRST_NAME;
        _request.MIDDLE_NAME = MIDDLE_NAME;
        _request.LAST_NAME = LAST_NAME;
        _request.EXTENSION_NAME = EXTENSION_NAME;
        _request.EMAIL_ADDRESS = EMAIL_ADDRESS;
        _request.CONTACTNO = CONTACTNO;
        _request.REGION = REGION;
        _request.PROVINCE = PROVINCE;
        _request.CITY = CITY;
        _request.AGE = AGE;
        _request.DATE_OF_BIRTH = DATE_OF_BIRTH;
        _request.SEX = SEX;
        _request.MARITAL_STATUS = MARITAL_STATUS;
        _request.SPOUSE_NAME = SPOUSE_NAME;
        _request.BARANGAY = BARANGAY;
        _request.ZIPCODE = ZIPCODE;
        _request.STREET_NO = STREET_NO;
        _request.BUSSINESS_NAME = BUSSINESS_NAME;
        _request.MONTHLY_GROSS = MONTHLY_GROSS;
        _request.CO_GUARANTOR_NAME = CO_GUARANTOR_NAME;
        _request.NATURE_OF_WORK = NATURE_OF_WORK;
        _request.CHARACTER_REFERENCE = CHARACTER_REFERENCE;
        _request.CO_GUARANTOR_NUMBER = CO_GUARANTOR_NUMBER;
        _request.CREATED_BY = CREATED_BY;
        _request.UPDATED_BY = UPDATED_BY;

        $.ajax({
            url: 'Add_Borrower.aspx/AddBorrower',
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

    $('#btnUpdate').on('click', function () {
        if (confirm("Are you sure you want to update this data?")) {
            var USER_ID = $('#USERID').val();
            var FIRST_NAME = $('#txtFirstName').val();
            var MIDDLE_NAME = $('#txtMiddleName').val();
            var LAST_NAME = $('#txtLastName').val();
            var EXTENSION_NAME = $('#txtExtensionName').val();
            var EMAIL_ADDRESS = $('#txtEmail').val();
            var CONTACTNO = $('#txtLandlinePhone').val();
            var REGION = $('#txtRegion').val();
            var PROVINCE = $('#txtProvince').val();
            var CITY = $('#txtCity').val();
            var AGE = $('#txtAge').val();
            var DATE_OF_BIRTH = $('#datepicker').val();
            var SEX = $('#slctSex').val();
            var MARITAL_STATUS = $('#txtMaritalStatus').val();
            var SPOUSE_NAME = $('#txtSpouseName').val();
            var BARANGAY = $('#txtBarangay').val();
            var ZIPCODE = $('#txtZipCode').val();
            var STREET_NO = $('#txtStNo').val();
            var BUSSINESS_NAME = $('#txtBusinessName').val();
            var MONTHLY_GROSS = $('#txtMonthlyGrossIncome').val();
            var CO_GUARANTOR_NAME = $('#txtCoguarantorName').val();
            var NATURE_OF_WORK = $('#slctNatureOfWork').val();
            var CHARACTER_REFERENCE = $('#txtCharacterReference').val();
            var CO_GUARANTOR_NUMBER = $('#txtCoguarantorPhoneNumber').val();
            //var USER_ID = $('#slctType').val();
            //var USER_ID = $('#txtNatureofCollateral').val();
            //var USER_ID = $('#txtDescription').val();
            //var USER_ID = $('#txtStatus').val();
            //var USER_ID = $('#txtValue').val();
            var CREATED_BY = '12345';
            var UPDATED_BY = 'ABCDE';
            var _request = {};

            _request.USER_ID = USER_ID;
            _request.FIRST_NAME = FIRST_NAME;
            _request.MIDDLE_NAME = MIDDLE_NAME;
            _request.LAST_NAME = LAST_NAME;
            _request.EXTENSION_NAME = EXTENSION_NAME;
            _request.EMAIL_ADDRESS = EMAIL_ADDRESS;
            _request.CONTACTNO = CONTACTNO;
            _request.REGION = REGION;
            _request.PROVINCE = PROVINCE;
            _request.CITY = CITY;
            _request.AGE = AGE;
            _request.DATE_OF_BIRTH = DATE_OF_BIRTH;
            _request.SEX = SEX;
            _request.MARITAL_STATUS = MARITAL_STATUS;
            _request.SPOUSE_NAME = SPOUSE_NAME;
            _request.BARANGAY = BARANGAY;
            _request.ZIPCODE = ZIPCODE;
            _request.STREET_NO = STREET_NO;
            _request.BUSSINESS_NAME = BUSSINESS_NAME;
            _request.MONTHLY_GROSS = MONTHLY_GROSS;
            _request.CO_GUARANTOR_NAME = CO_GUARANTOR_NAME;
            _request.NATURE_OF_WORK = NATURE_OF_WORK;
            _request.CHARACTER_REFERENCE = CHARACTER_REFERENCE;
            _request.CO_GUARANTOR_NUMBER = CO_GUARANTOR_NUMBER;
            _request.CREATED_BY = CREATED_BY;
            _request.UPDATED_BY = UPDATED_BY;

            $.ajax({
                url: 'Borrowers.aspx/UpdateBorrowerDetails',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ request: _request }),
                success: function (e) {
                    notification('success', 'Updated successfully!');
                    $('html, body').animate({ scrollTop: '0px' }, 0);
                    $('#borrowerModal').modal('toggle');
                    LoadBorrowerListDatatable();
                }
            });
        }
    })
});

function LoadBorrowerListDatatable() {
    LoadBorrowerList(function (e) {
        if ($("#tblBorrowers").hasClass("dataTable")) {
            $("#tblBorrowers").DataTable().destroy();
        }
        var tblBorrowers = $('#tblBorrowers').DataTable({
            data: e,
            columns: [
                { "data": "USER_ID" },
                {
                    "data": null,
                    "className": "dt-center editor-plus",
                    "defaultContent": '<i class="glyphicon glyphicon-plus-sign" style="cursor: pointer"/>',
                    "orderable": false
                },
                { "data": "CompleteName" },
                { "data": "AGE" },
                { "data": "SEX" },
                { "data": "BUSSINESS_NAME" },
                { "data": "CONTACTNO" },
                { "data": "CITY" },
                { "data": "ID" },
                { "data": "ID" },
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
            ],
            columnDefs: [{ "targets": 0, visible: false }]
        });

        $('#tblBorrowers').on('click', 'td.editor-delete', function (e) {
            var tblBorrowers_delete = $('#tblBorrowers').DataTable();
            var data = tblBorrowers_delete.row($(this).closest('tr')).data();
            var USER_ID_delete = data[Object.keys(data)[0]];
            if (confirm("Are you sure you want to delete this data?")) {
                tblBorrowers.row($(this).closest('tr')).remove().draw();
                DeleteBorrower(USER_ID_delete, function () {
                    notification('success', 'Deleted successfully!');
                });
            }
        });

        $('#tblBorrowers').on('click', 'td.editor-edit', function (e) {
            var tblBorrowers_edit = $('#tblBorrowers').DataTable();
            var data = tblBorrowers_edit.row($(this).closest('tr')).data();
            var USER_ID_edit = data[Object.keys(data)[0]];

            $('#borrowerModal').modal('show');
            $('#USERID').val(USER_ID_edit);
            GetBorrowerDetails(USER_ID_edit, function (d) {
                $('#txtFirstName').val(d[0]['FIRST_NAME']);
                $('#txtMiddleName').val(d[0]['MIDDLE_NAME']);
                $('#txtLastName').val(d[0]['LAST_NAME']);
                $('#txtExtensionName').val(d[0]['EXTENSION_NAME']);
                $('#txtEmail').val(d[0]['EMAIL_ADDRESS']);
                $('#txtLandlinePhone').val(d[0]['CONTACTNO']);
                $('#txtRegion').val(d[0]['REGION']);
                $('#txtProvince').val(d[0]['PROVINCE']);
                $('#txtCity').val(d[0]['CITY']);
                $('#txtAge').val(d[0]['AGE']);
                $('#datepicker').val(d[0]['DATE_OF_BIRTH']);
                $('#slctSex').val(d[0]['SEX']);
                $('#txtMaritalStatus').val(d[0]['MARITAL_STATUS']);
                $('#txtSpouseName').val(d[0]['SPOUSE_NAME']);
                $('#txtBarangay').val(d[0]['BARANGAY']);
                $('#txtZipCode').val(d[0]['ZIPCODE']);
                $('#txtStNo').val(d[0]['STREET_NO']);
                $('#txtBusinessName').val(d[0]['BUSINESS_NAME']);
                $('#txtMonthlyGrossIncome').val(d[0]['MONTHLY_GROSS']);
                $('#txtCoguarantorName').val(d[0]['CO_GUARANTOR_NAME']);
                $('#slctNatureOfWork').val(d[0]['NATURE_OF_WORK']);
                $('#txtCharacterReference').val(d[0]['CHARACTER_REFERENCE']);
                $('#txtCoguarantorPhoneNumber').val(d[0]['CO_GUARANTOR_NUMBER']);
            });

        });

        $('#tblBorrowers').on('click', 'td.editor-plus', function (e) {
            $('#AddLoanModal').modal('show');
            $('#datepicker1').datepicker({
                autoclose: true
            })
            var tblBorrowers_Addloan = $('#tblBorrowers').DataTable();
            var data = tblBorrowers_Addloan.row($(this).closest('tr')).data();
            var USER_ID_edit = data[Object.keys(data)[0]];
            var name = data[Object.keys(data)[1]];
            $('#txtBorrowerName').val(name);
            GetInstallmentTypeList(function (e) {
                $("#slctInstallmentType").html("");
                $('<option/>', {
                    value: 'none',
                    text: 'Please select'
                }).appendTo($("#slctInstallmentType"));
                for (var i in e) {
                    $('<option/>', {
                        value: e[i]['INSTALLMENT_ID'],
                        text: e[i]['DESCRIPTION']
                    }).appendTo($("#slctInstallmentType"));
                }
            });

            $('#btnAddLoan').on('click', function () {
                var PRODUCT = $('#txtProduct').val();
                var RELEASED_DATE = $('#datepicker1').val();
                //var MATURITY_DATE = $('#')
                var AMOUNT = $('#txtLoanAmount').val();
                var INSTALLMENT_PLAN_TYPE = $('#slctInstallmentType').val();
                var TENURE = $('#txtLoanTenure').val();
                var PROCESSING_FEE = $('#txtProcessingFee').val();
                var INTEREST_RATE = $('#txtInterestRate').val();
                var _LOAN = {};

                _LOAN.USER_ID = USER_ID_edit;
                _LOAN.PRODUCT = PRODUCT;
                _LOAN.RELEASED_DATE = RELEASED_DATE;
                _LOAN.AMOUNT = AMOUNT;
                _LOAN.INSTALLMENT_ID = INSTALLMENT_PLAN_TYPE;
                _LOAN.TENURE = TENURE;
                _LOAN.PROCESSING_FEE = PROCESSING_FEE;
                _LOAN.INTEREST_RATE = INTEREST_RATE;

                $.ajax({
                    url: 'Borrowers.aspx/AddBorrowerLoan',
                    type: 'POST',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: JSON.stringify({ request: _LOAN }),
                    success: function () {
                        $('#AddLoanModal').modal('toggle');
                        notification('success', 'Save successfully!');
                        //$('#content').load(' #content > *');
                    }
                });
            });
        });
    });
}

function LoadBorrowerList(callback) {
    $.ajax({
        url: "Borrowers.aspx/GetBorrowerList",
        type: "POST",
        data: '{}',
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

function DeleteBorrower(_USERID ,callback) {
    $.ajax({
        url: "Borrowers.aspx/DeleteBorrower",
        type: "POST",
        data: JSON.stringify({ _USER_ID: _USERID }),
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

function GetBorrowerDetails(_USERID, callback) {
    $.ajax({
        url: "Borrowers.aspx/GetBorrowerDetails",
        type: "POST",
        data: JSON.stringify({ _USER_ID: _USERID }),
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

function GetInstallmentTypeList(callback) {
    $.ajax({
        url: "Borrowers.aspx/GetInstallmentTypeList",
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