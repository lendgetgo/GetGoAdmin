$(document).ready(function () {

    $('#tblBorrowers').DataTable();

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
            }
        });

    })
});