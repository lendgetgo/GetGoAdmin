var currentLocation1 = window.location.href;
var BORROWER_USER_ID;
var BORROWER_NAME;
var _CONTACTNO;
var _emailaddress;
var _CREDIT_LIMIT;
$(document).ready(function () {
    $('#datepicker').datepicker({
        autoclose: true
    })
    if (currentLocation1.includes('Borrowers.aspx')) {
        LoadBorrowerListDatatable();

        $('#tblBorrowers').on('click', 'td.editor-delete', function (e) {
            var tblBorrowers_delete = $('#tblBorrowers').DataTable();
            var data = tblBorrowers_delete.row($(this).closest('tr')).data();
            var USER_ID_delete = data[Object.keys(data)[0]];
            if (confirm("Are you sure you want to delete this data?")) {
                tblBorrowers_delete.row($(this).closest('tr')).remove().draw();
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
            var $datepicker = $('#datepicker');
            $datepicker.datepicker();
            

            GetBorrowerDetails(USER_ID_edit, function (d) {
                console.log(d);
                $('#txtFirstName').val(d[0]['FIRST_NAME']);
                $('#txtMiddleName').val(d[0]['MIDDLE_NAME']);
                $('#txtLastName').val(d[0]['LAST_NAME']);
                $('#txtExtensionName').val(d[0]['EXTENSION_NAME']);
                $('#txtEmail').val(d[0]['EMAIL_ADDRESS']);
                $('#txtLandlinePhone').val(d[0]['CONTACTNO']);
                $("#txtRegion option:contains('" + d[0]['REGION'] + "')").attr('selected', true);
                $("#txtProvince").append(new Option(d[0]['PROVINCE'], d[0]['PROVINCE']));
                //$("#txtProvince option:contains('" + d[0]['PROVINCE'] + "')").attr('selected', true);
                //$("#txtCity option:contains('" + d[0]['CITY'] + "')").attr('selected', true);
                $("#txtCity").append(new Option(d[0]['CITY'], d[0]['CITY']));
                $('#txtAge').val(d[0]['AGE']);
                //$('#datepicker').val(d[0]['DATE_OF_BIRTH']);
                $datepicker.datepicker('setDate', new Date(d[0]['DATE_OF_BIRTH']));
                $('#slctSex').val(d[0]['SEX']);
                $('#txtMaritalStatus').val(d[0]['MARITAL_STATUS']);
                $('#txtSpouseName').val(d[0]['SPOUSE_NAME']);
                //$("#txtBarangay option:contains('" + d[0]['BARANGAY'] + "')").attr('selected', true);
                $("#txtBarangay").append(new Option(d[0]['BARANGAY'], d[0]['BARANGAY']));
                $('#txtZipCode').val(d[0]['ZIPCODE']);
                $('#txtStNo').val(d[0]['STREET_NO']);
                $('#txtBusinessName').val(d[0]['BUSSINESS_NAME']);
                $('#txtMonthlyGrossIncome').val(d[0]['MONTHLY_GROSS']);
                $('#txtCoguarantorName').val(d[0]['CO_GUARANTOR_NAME']);
                $('#slctNatureOfWork').val(d[0]['NATURE_OF_WORK']);
                $('#txtCharacterReference').val(d[0]['CHARACTER_REFERENCE']);
                $('#txtCoguarantorPhoneNumber').val(d[0]['CO_GUARANTOR_NUMBER']);
            });

        });

        $('#btnAddloanModal').on('click', function () {
            $('#datepicker1').datepicker({
                autoclose: true
            })
            GetRemainingCredit(BORROWER_USER_ID, function (e) {
                $('#txtBorrowerName').val(BORROWER_NAME);
                if ($('#btnAddloanModal').text() == "Add Loan") {
                    $('#btnAddloanModal').text("Back");
                    $('#addloan_content').css("display", "block");
                }
                else {
                    $('#btnAddloanModal').text("Add Loan");
                    $('#addloan_content').css("display", "none");
                }
            });
        });

        $('#tblBorrowersLoan').on('click', 'button.btn-status', function (e) {
            var tblBorrowersLoan_view = $('#tblBorrowersLoan').DataTable();
            var data = tblBorrowersLoan_view.row($(this).closest('tr')).data();
            var LOAN_ID = data[Object.keys(data)[0]];
            GetBorrowerLoanDetails(LOAN_ID, function (e) {
                $('#BorrrowerLoanModalDetails').modal('show');
                if ($("#tblBorrowersLoanHeader").hasClass("dataTable")) {
                    $("#tblBorrowersLoanHeader").DataTable().destroy();
                }
                $('#tblBorrowersLoanHeader').DataTable({
                    data: e,
                    dom: 'Blfrtip',
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ],
                    columns: [
                        { "data": "LOAN_ID" },
                        { "data": "COMPLETE_NAME" },
                        { "data": "RELEASED_DATE" },
                        { "data": "START_DATE" },
                        { "data": "INSTALLMENT_PLAN" },
                        { "data": "PROCESSING_FEE" },
                        { "data": "PENALTY" },
                        { "data": "AMOUNT" },
                        { "data": "AMOUNT_PAID" },
                        { "data": "BALANCE" },
                        { "data": "STATUS" }
                    ],
                    columnDefs: [{ "targets": 0, visible: false }],
                    searching: false,
                    info: false,
                    ordering: false,
                    paging: false
                });
            });

            GetBorrowerLoanPlanList(LOAN_ID);
        });

        $('#tblBorrowersLoanDetails').on('click', 'button.btn-pay', function (e) {
            var tblBorrowers_delete = $('#tblBorrowersLoanDetails').DataTable();
            var data = tblBorrowers_delete.row($(this).closest('tr')).data();
            var LOAN_ID_PAYMENT = data[Object.keys(data)[1]];
            var LOAN_ID = data[Object.keys(data)[2]];
            var txtAmounttoPaid = parseFloat($('#txtAmounttoPaid').val());
            var LoanAmount = parseFloat(data[Object.keys(data)[0]]);
            //console.log(txtAmounttoPaid);
            if (txtAmounttoPaid.length <= 0) {
                notification("warning", "Please input Amount to pay!");
            } else {
                if (txtAmounttoPaid <= LoanAmount) {
                    $.ajax({

                        url: 'Borrowers.aspx/repayment',
                        type: 'POST',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        data: JSON.stringify({ LOAN_ID: LOAN_ID_PAYMENT, AmounttoPaid: txtAmounttoPaid }),
                        success: function (e) {
                            var d = JSON.parse(e.d)
                            notification('success', 'Updated successfully!');
                            //SaveAttachment(d[0].USER_ID);
                            $.ajax({

                                url: 'Borrowers.aspx/fullrepayment',
                                type: 'POST',
                                contentType: 'application/json;charset=utf-8',
                                dataType: 'json',
                                data: JSON.stringify({ LOAN_ID: LOAN_ID, LOAN_DETAILS_ID: LOAN_ID_PAYMENT }),
                                success: function (e) {
                                    var d = JSON.parse(e.d)
                                    var output = 'You have successfully paid worth P' + txtAmounttoPaid;
                                    GetBorrowerLoanPlanList(LOAN_ID);
                                    displayUserLoanDetails();
                                    GetUserID(output, _emailaddress, function () { });
                                    console.log(output + ' ' + _CONTACTNO);
                                    SendSMS(_CONTACTNO, output, function () { });
                                },
                                error: function (e) {
                                    console.log(e);
                                }
                            });
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });
                } else {
                    alert("Pay exact or less than amount.");
                }
            }
        });

        $('#btnUpdate').on('click', function () {
            if (confirm("Are you sure you want to update this data?")) {
                var USER_ID = $('#USERID').val();
                var FIRST_NAME = $('#txtFirstName').val();
                var MIDDLE_NAME = $('#txtMiddleName').val();
                var LAST_NAME = $('#txtLastName').val();
                var EXTENSION_NAME = $('#txtExtensionName').val();
                var EMAIL_ADDRESS = $('#txtEmail').val();
                var CONTACTNO = $('#txtLandlinePhone').val();
                var REGION = $('#txtRegion option:selected').text();
                var PROVINCE = $('#txtProvince option:selected').text();
                var CITY = $('#txtCity option:selected').text();
                var AGE = $('#txtAge').val();
                var DATE_OF_BIRTH = $('#datepicker').val();
                var SEX = $('#slctSex').val();
                var MARITAL_STATUS = $('#txtMaritalStatus').val();
                var SPOUSE_NAME = $('#txtSpouseName').val();
                var BARANGAY = $('#txtBarangay option:selected').text();
                var ZIPCODE = $('#txtZipCode').val();
                var STREET_NO = $('#txtStNo').val();
                var BUSSINESS_NAME = $('#txtBusinessName').val();
                var MONTHLY_GROSS = $('#txtMonthlyGrossIncome').val() ? $('#txtMonthlyGrossIncome').val() : 0;
                var CO_GUARANTOR_NAME = $('#txtCoguarantorName').val();
                var NATURE_OF_WORK = $('#slctNatureOfWork').val();
                var CHARACTER_REFERENCE = $('#txtCharacterReference').val();
                var CO_GUARANTOR_NUMBER = $('#txtCoguarantorPhoneNumber').val();
                var CREATED_BY = 'admin';
                var UPDATED_BY = 'admin';
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
                        LoadBorrowerListDatatable();
                    }
                });
            }
        });
    }

    $('#txtLandlinePhone').on('input', function () {
        this.value = this.value.replace(/\D/g, '');
        if ($('#txtLandlinePhone').val().length > 10) {
            alert('invalid number');
            $('#txtLandlinePhone').val('');
        }
    });

    $('#txtCoguarantorPhoneNumber').on('input', function () {
        this.value = this.value.replace(/\D/g, '');
        if ($('#txtCoguarantorPhoneNumber').val().length > 10) {
            alert('invalid number');
            $('#txtCoguarantorPhoneNumber').val('');
        }
    });

    $('#datepicker').on('change', function () {
        $('#datepicker').css('z-index', 9999);
        var now = new Date();   //Current Date
        var past = new Date($('#datepicker').val());  //Date of Birth
        if (past > now) {
            alert('Entered Date is Greater than Current Date');
            return false;
        }
        var nowYear = now.getFullYear();  //Get current year
        var pastYear = past.getFullYear();//Get Date of Birth year

        var age = nowYear - pastYear;  //calculate the difference
        if ((age >= 18) && (age <= 60)) { $('#txtAge').val(age); }
        else { notification("warning", "Cannot file below 18 or above 60 yrs old!"); }
        
    });

    if (currentLocation1.includes('Add_Borrower.aspx')) {
        $('#btnSubmit').on('click', function () {
            var FIRST_NAME = $('#txtFirstName').val();
            var MIDDLE_NAME = $('#txtMiddleName').val();
            var LAST_NAME = $('#txtLastName').val();
            var EXTENSION_NAME = $('#txtExtensionName').val();
            var EMAIL_ADDRESS = $('#txtEmail').val();
            var CONTACTNO = $('#txt63').val() + '' + $('#txtLandlinePhone').val();
            var REGION = $('#txtRegion option:selected').val();
            var PROVINCE = $('#txtProvince option:selected').val();
            var CITY = $('#txtCity option:selected').val();
            var AGE = $('#txtAge').val();
            var DATE_OF_BIRTH = $('#datepicker').val();
            var SEX = $('#slctSex').val();
            var MARITAL_STATUS = $('#txtMaritalStatus').val();
            var SPOUSE_NAME = $('#txtSpouseName').val();
            var BARANGAY = $('#txtBarangay option:selected').val();
            var ZIPCODE = $('#txtZipCode').val();
            var STREET_NO = $('#txtStNo').val();
            var BUSSINESS_NAME = $('#txtBusinessName').val();
            var MONTHLY_GROSS = $('#txtMonthlyGrossIncome').val();
            var CO_GUARANTOR_NAME = $('#txtCoguarantorName').val();
            var NATURE_OF_WORK = $('#slctNatureOfWork').val();
            var CHARACTER_REFERENCE = $('#txtCharacterReference').val();
            var CO_GUARANTOR_NUMBER = $('#txt63').val() + '' + $('#txtCoguarantorPhoneNumber').val();
            //var USER_ID = $('#slctType').val();
            //var USER_ID = $('#txtNatureofCollateral').val();
            //var USER_ID = $('#txtDescription').val();
            //var USER_ID = $('#txtStatus').val();
            //var USER_ID = $('#txtValue').val();
            var CREATED_BY = '12345';
            var UPDATED_BY = 'ABCDE';

            if (($('#txtAge').val().trim() != "") && ($('#txtLandlinePhone').val().trim() != "" )) {
                GetUserDetail_Addborrower(EMAIL_ADDRESS, function () {
                    var _request = {
                        FIRST_NAME: FIRST_NAME,
                        MIDDLE_NAME: MIDDLE_NAME,
                        LAST_NAME: LAST_NAME,
                        EXTENSION_NAME: EXTENSION_NAME,
                        EMAIL_ADDRESS: EMAIL_ADDRESS,
                        CONTACTNO: CONTACTNO,
                        REGION: REGION,
                        PROVINCE: PROVINCE,
                        CITY: CITY,
                        AGE: AGE,
                        DATE_OF_BIRTH: DATE_OF_BIRTH,
                        SEX: SEX,
                        MARITAL_STATUS: MARITAL_STATUS,
                        SPOUSE_NAME: SPOUSE_NAME,
                        BARANGAY: BARANGAY,
                        ZIPCODE: ZIPCODE,
                        STREET_NO: STREET_NO,
                        BUSSINESS_NAME: BUSSINESS_NAME,
                        MONTHLY_GROSS: MONTHLY_GROSS,
                        CO_GUARANTOR_NAME: CO_GUARANTOR_NAME,
                        NATURE_OF_WORK: NATURE_OF_WORK,
                        CHARACTER_REFERENCE: CHARACTER_REFERENCE,
                        CO_GUARANTOR_NUMBER: CO_GUARANTOR_NUMBER,
                        CREATED_BY: CREATED_BY,
                        UPDATED_BY: UPDATED_BY
                    };

                    $.ajax({
                        url: 'Add_Borrower.aspx/AddBorrower2',
                        type: 'POST',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        data: JSON.stringify({ request: _request }),
                        success: function (e) {
                            var d = JSON.parse(e.d)
                            SaveAttachment(d[0].USER_ID);
                            notification('success', 'Save successfully!');
                            //Attachment();
                            $('html, body').animate({ scrollTop: '0px' }, 0);
                            //$('#content').load(' #content > *');
                        }
                    });
                });
            } else { notification("error", "Please fill up all required fields!"); }
        })

        $('#btnUpdate').on('click', function () {
            if (confirm("Are you sure you want to update this data?")) {
                var USER_ID = $('#USERID').val();
                var FIRST_NAME = $('#txtFirstName').val();
                var MIDDLE_NAME = $('#txtMiddleName').val();
                var LAST_NAME = $('#txtLastName').val();
                var EXTENSION_NAME = $('#txtExtensionName').val();
                var EMAIL_ADDRESS = $('#txtEmail').val();
                var CONTACTNO = $('#txt63').val() + '' + $('#txtLandlinePhone').val();
                var REGION = $('#txtRegion option:selected').val();
                var PROVINCE = $('#txtProvince option:selected').val();
                var CITY = $('#txtCity option:selected').val();
                var AGE = $('#txtAge').val();
                var DATE_OF_BIRTH = $('#datepicker').val();
                var SEX = $('#slctSex').val();
                var MARITAL_STATUS = $('#txtMaritalStatus').val();
                var SPOUSE_NAME = $('#txtSpouseName').val();
                var BARANGAY = $('#txtBarangay option:selected').val();
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
                var CREATED_BY = 'admin';
                var UPDATED_BY = 'admin';
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

        var files = $('.custom-file-input');
        $(() => {

        });
        const filesArray = [];

        const SaveAttachment = (userid) => {
            files.each(function (index, fileInput) {
                var formData = new FormData();
                formData.append("file", fileInput.files[0]);
                formData.append("classification", fileInput.getAttribute("data-classification")); // Append the correct classification
                filesArray.push(formData);
            });

            upload(filesArray, userid);
        }
        const upload = (filesArray, userid) => {

            //for (const value of files.values()) {
            //    console.log(value);
            //}
            // Create a new FormData object to store all files
            const allFilesFormData = new FormData();

            // Append each FormData object to the new FormData
            filesArray.forEach(formData => {
                for (const [key, value] of formData.entries()) {
                    allFilesFormData.append(key, value);
                }
            });
            for (const value of allFilesFormData.values()) {
                console.log(value);
            }
            alert("Uploading now to file server ");
            $.ajax({
                type: 'post',
                url: 'Upload.ashx?USERID=' + userid,
                data: allFilesFormData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (e) {
                    console.log(e);
                    alert(e);

                },
                error: function (xhr, status, error) {
                    if (xhr.status === 413) {
                        alert('Request Entity Too Large: The file you are trying to upload is too large.');
                    } else {
                        alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
                    }
                    console.log(xhr, status, error);


                }

            })


        }
    }

    
});

function LoadBorrowerListDatatable() {
    
    LoadBorrowerList(function (e) {
        if ($("#tblBorrowers").hasClass("dataTable")) {
            $("#tblBorrowers").DataTable().destroy();
        }
        var tblBorrowers = $('#tblBorrowers').DataTable({
            dom: 'Blfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
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
                {
                    "data": null,
                    "className": "dt-center editor-view",
                    "defaultContent": '<button type="button" class="btn btn-block btn-success btn-xs">Loans</button>',
                    "orderable": false
                },
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
            columnDefs: [{ "targets": 0, visible: false }, { "targets": 1, visible: false }]
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
            //GetInstallmentTypeList(function (e) {
            //    $("#slctInstallmentType").html("");
            //    $('<option/>', {
            //        value: 'none',
            //        text: 'Please select'
            //    }).appendTo($("#slctInstallmentType"));
            //    for (var i in e) {
            //        $('<option/>', {
            //            value: e[i]['INSTALLMENT_ID'],
            //            text: e[i]['DESCRIPTION']
            //        }).appendTo($("#slctInstallmentType"));
            //    }
            //});

            $('#btnAddLoan').on('click', function () {
                var LOAN_ID;
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
                    success: function (e) {
                        var d = JSON.parse(e.d);
                        LOAN_ID = d[0]['LOAN_ID'];
                        SaveAttachment_loan(USER_ID_edit);
                        $('#AddLoanModal').modal('toggle');
                        notification('success', 'Save successfully!');
                    }
                });

                
            });
        });

    $('#tblBorrowers').on('click', 'td.editor-view', function (e) {
        $('#BorrrowerLoanModal').modal('show');
        var tblBorrowers_Borrowerloan = $('#tblBorrowers').DataTable();
        var data = tblBorrowers_Borrowerloan.row($(this).closest('tr')).data();
        BORROWER_USER_ID = data[Object.keys(data)[0]];
        BORROWER_NAME = data[Object.keys(data)[1]];
        var AGE = data[Object.keys(data)[2]];
        var GENDER = data[Object.keys(data)[3]];
        if (GENDER == 'F') { GENDER = 'FEMALE' } else { GENDER = 'MALE' }

        //console.log(data);


        GetBorrowerDetails(BORROWER_USER_ID, function (b) {
            $('#lblName').text(BORROWER_NAME);
            $('#lblAge').text(AGE);
            $('#lblSex').text(GENDER);
            $('#lblBusinessName').text(b[0]['BUSSINESS_NAME']);
            $('#lblStreet').text(b[0]['STREET_NO'] + ' ' + b[0]['BARANGAY']);
            $('#lblCity').text(b[0]['CITY']);
            $('#lblProvince').text(b[0]['PROVINCE']);
            $('#lblZipcode').text(b[0]['ZIPCODE']);
            $('#lblLandline').text('N/A');
            $('#lblEmail').text(b[0]['EMAIL_ADDRESS']);
            $('#lblContactNo').text(b[0]['CONTACTNO']);
            _CONTACTNO = b[0]['CONTACTNO'];
            _emailaddress = b[0]['EMAIL_ADDRESS'];

            $(() => {

                GetData({
                    url: "Borrowers.aspx/GetSessionValue"
                }).then(e => {
                    let data = JSON.parse(e.d);
                    //console.log(data);
                    ProfileImage.attr('src', baseUrl + data[0].PROFILE_PIC);
                });
            });

            const GetData = (config) => {
                config.type = config.type || "POST";
                config.data = config.data || "";
                return $.ajax({
                    type: config.type,
                    url: config.url,
                    data: config.data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: data => { },
                    error: function (xhr, status, error) {
                        if (xhr.status === 413) {
                            alert('Request Entity Too Large: The file you are trying to upload is too large.');
                        } else {
                            alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
                        }
                        $('#ERROR').text('Error: ' + error);

                    }


                });

            };

            displayUserLoanDetails();

        });

    });

    $('#btnAddLoan').on('click', function () {
        var LOAN_ID;
        var PRODUCT = $('#txtProduct').val();
        var RELEASED_DATE = $('#datepicker1').val();
        //var MATURITY_DATE = $('#')
        var AMOUNT = $('#txtLoanAmount').val();
        var INSTALLMENT_PLAN_TYPE = $('#slctInstallmentType').val();
        var TENURE = $('#txtLoanTenure').val();
        var PROCESSING_FEE = $('#txtProcessingFee').val();
        var INTEREST_RATE = $('#txtInterestRate').val();
        var _LOAN = {};

        _LOAN.USER_ID = BORROWER_USER_ID;
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
            success: function (e) {
                var d = JSON.parse(e.d);
                LOAN_ID = d[0]['LOAN_ID'];
                SaveAttachment_loan(BORROWER_USER_ID);
                $('#AddLoanModal').modal('hide');
                notification('success', 'Save successfully!');
               
                //$('#content').load(' #content > *');
                $.ajax({
                    url: "Borrowers.aspx/GetBorrowerLoan",
                    type: "POST",
                    data: JSON.stringify({ _USER_ID: BORROWER_USER_ID }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        var d = JSON.parse(e.d)

                        if ($("#tblBorrowersLoan").hasClass("dataTable")) {
                            $("#tblBorrowersLoan").DataTable().destroy();
                        }
                        $('#tblBorrowersLoan').DataTable({
                            data: d,
                            dom: 'Blfrtip',
                            buttons: [
                                'copy', 'csv', 'excel', 'pdf', 'print'
                            ],
                            columns: [
                                { "data": "LOAN_ID" },
                                { "data": "COMPLETE_NAME" },
                                { "data": "RELEASED_DATE" },
                                { "data": "START_DATE" },
                                { "data": "INSTALLMENT_PLAN" },
                                { "data": "PROCESSING_FEE" },
                                { "data": "PENALTY" },
                                { "data": "AMOUNT" },
                                { "data": "AMOUNT_PAID" },
                                { "data": "BALANCE" },
                                {
                                    "data": "STATUS",
                                    render: function (data, type, row) {
                                        if (data == 'ONGOING') {
                                            return '<button type="button" class="btn btn-block btn-primary btn-xs btn-status">' + data + '</button>';
                                        }
                                        if (data == 'FULLY PAID') {
                                            return '<button type="button" class="btn btn-block btn-success btn-xs btn-status">' + data + '</button>';
                                        }
                                        if (data == 'APPROVED') {
                                            return '<button type="button" class="btn btn-block btn-info btn-xs btn-status">' + data + '</button>';
                                        }
                                    }
                                },
                            ],
                            columnDefs: [{ "targets": 0, visible: false }]
                        });
                    }
                });
            }
        });
        var files = $('.custom-file-input-loan');
        $(() => {

        });

        const filesArray = [];

        const SaveAttachment_loan = (userid) => {
            files.each(function (index, fileInput) {
                var formData = new FormData();
                formData.append("file", fileInput.files[0]);
                formData.append("classification", fileInput.getAttribute("data-classification")); // Append the correct classification
                filesArray.push(formData);
            });

            upload_loan(filesArray, userid);
        }
        const upload_loan = (filesArray, userid) => {
            // Create a new FormData object to store all files
            const allFilesFormData = new FormData();

            // Append each FormData object to the new FormData
            filesArray.forEach(formData => {
                for (const [key, value] of formData.entries()) {
                    allFilesFormData.append(key, value);
                }
            });
            for (const value of allFilesFormData.values()) {
                console.log(value);
            }
            alert("Uploading now to file server ");
            $.ajax({
                type: 'post',
                url: 'Upload.ashx?USERID=' + userid + '&LOANID=' + LOAN_ID,
                data: allFilesFormData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (e) {
                    console.log(e);
                    alert(e);

                },
                error: function (xhr, status, error) {
                    if (xhr.status === 413) {
                        alert('Request Entity Too Large: The file you are trying to upload is too large.');
                    } else {
                        alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
                    }
                    console.log(xhr, status, error);


                }

            })
        }
    });
}

function displayUserLoanDetails() {
    $.ajax({
        url: "Borrowers.aspx/GetBorrowerLoan",
        type: "POST",
        data: JSON.stringify({ _USER_ID: BORROWER_USER_ID }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            if ($("#tblBorrowersLoan").hasClass("dataTable")) {
                $("#tblBorrowersLoan").DataTable().destroy();
            }
            $('#tblBorrowersLoan').DataTable({
                data: d,
                dom: 'Blfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ],
                columns: [
                    { "data": "LOAN_ID" },
                    { "data": "COMPLETE_NAME" },
                    { "data": "RELEASED_DATE" },
                    { "data": "START_DATE" },
                    { "data": "INSTALLMENT_PLAN" },
                    { "data": "PROCESSING_FEE" },
                    { "data": "PENALTY" },
                    { "data": "AMOUNT" },
                    { "data": "AMOUNT_PAID" },
                    { "data": "BALANCE" },
                    {
                        "data": "STATUS",
                        render: function (data, type, row) {
                            if (data == 'ONGOING') {
                                return '<button type="button" class="btn btn-block btn-primary btn-xs btn-status">' + data + '</button>';
                            }
                            if (data == 'FULLY PAID') {
                                return '<button type="button" class="btn btn-block btn-success btn-xs btn-status">' + data + '</button>';
                            }
                            if (data == 'APPROVED') {
                                return '<button type="button" class="btn btn-block btn-info btn-xs btn-status">' + data + '</button>';
                            }
                        }
                    },
                ],
                columnDefs: [{ "targets": 0, visible: false }]
            });
        }
    });
}

function GetBorrowerLoanPlanList(LOAN_ID) {
    GetBorrowerLoanPlanDetails(LOAN_ID, function (e) {
        console.log(e);
        if ($("#tblBorrowersLoanDetails").hasClass("dataTable")) {
            $("#tblBorrowersLoanDetails").DataTable().destroy();
        }
        $('#tblBorrowersLoanDetails').DataTable({
            data: e,
            dom: 'Blfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            columns: [
                { "data": "AMOUNT" },
                { "data": "LOAN_DETAILS_ID" },
                { "data": "COMPLETE_NAME" },
                { "data": "LOAN_ID" },
                //{ "data": "METHOD" },
                { "data": "COLLECTED_BY" },
                { "data": "COLLECTED_DATE" },
                { "data": "AMOUNT_PAID" },
                { "data": "STATUS" },
                {
                    "data": "STATUS",
                    render: function (data, type, row) {
                        if (data == 'PAID') {
                            return "COMPLETED";
                        }
                        else {
                            return '<button type="button" class="btn btn-block btn-success btn-xs btn-pay"> PAY? </button>';
                        }
                    }
                },
            ],
            columnDefs: [{ "targets": 0, visible: false }, { "targets": 1, visible: false }]
        });
    });
}

function GetUserDetail(emailAddress, callback) {
    $.ajax({
        url: "Borrowers.aspx/GetUserDetail",
        type: "POST",
        data: JSON.stringify({ EMAIL_ADDRESS: emailAddress }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            if (callback !== undefined) {
                if (d.length == 0) {
                    callback(d);
                }
                else {
                    notification("warning", "Email Already exist!");
                }
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetUserDetail_Addborrower(emailAddress, callback) {
    $.ajax({
        url: "Add_Borrower.aspx/GetUserDetail",
        type: "POST",
        data: JSON.stringify({ EMAIL_ADDRESS: emailAddress }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            if (callback !== undefined) {
                if (d.length == 0) {
                    callback(d);
                }
                else {
                    notification("warning", "Email Already exist!");
                }
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
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
            var d = JSON.parse(e.d);
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

function GetBorrowerLoanDetails(_LOANID, callback) {
    $.ajax({
        url: "Borrowers.aspx/GetBorrowerLoanDetails",
        type: "POST",
        data: JSON.stringify({ _LOAN_ID: _LOANID }),
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

function GetBorrowerLoanPlanDetails(_LOANID, callback) {
    $.ajax({
        url: "Borrowers.aspx/GetBorrowerLoanPlanDetails",
        type: "POST",
        data: JSON.stringify({ _LOAN_ID: _LOANID }),
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

function SendSMS(_contactNo, _AuthenticationCode, callback) {
    $.ajax({
        url: "Borrowers.aspx/SendSMS",
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
        url: "Borrowers.aspx/GetUserID",
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

function GetRemainingCredit(USER_ID_CREDIT, callback) {
    $.ajax({
        url: "Borrowers.aspx/GetRemainingCredit",
        type: "POST",
        data: JSON.stringify({ _USER_ID: USER_ID_CREDIT }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            _CREDIT_LIMIT = parseFloat(d[0]['REMAINING_CREDIT']);
            //console.log(d[0]['REMAINING_CREDIT']);
            if (callback !== undefined) {
                if (_CREDIT_LIMIT > 3000) {
                    callback(d);
                }
                else {
                    notification("warning", "Cannot file loan!, You only have P" + _CREDIT_LIMIT + "!");
                }
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
