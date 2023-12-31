﻿<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Borrowers.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css">

    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.print.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .datepicker-dropdown {
            z-index: 9999 !important;
        }

        input {
            text-transform: capitalize;
        }

        .box-header.with-border {
            background-color: ghostwhite;
        }
    </style>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">View Borrowers</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="tblBorrowers" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>USERID</th>
                                <th></th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Business</th>
                                <th>Mobile</th>
                                <th>City</th>
                                <th>View</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>USERID</th>
                                <th></th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Business</th>
                                <th>Mobile</th>
                                <th>City</th>
                                <th>View</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="borrowerModal" tabindex="-1" role="dialog" aria-labelledby="borrowerModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">Update Borrower Details</h5>
                </div>

                <div id="userMaintenance" class="modal-body">
                    <div class="row" id="content">
                        <div class="col-xs-12">
                            <%--<div class="box">--%>
                            <div class="box-header with-border">
                                <h3 class="box-title">Required Fields</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <form class="form-horizontal">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputID" class="col-sm-3 control-label">USER ID #</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="USERID" placeholder="01" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtFirstName" class="col-sm-3 control-label">First name</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtFirstName" placeholder="First name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtMiddleName" class="col-sm-3 control-label">Middle name</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtMiddleName" placeholder="Middle name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtLastName" class="col-sm-3 control-label">Last name</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtLastName" placeholder="Last name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtExtensionName" class="col-sm-3 control-label">Extension name</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtExtensionName" placeholder="Extension name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtEmail" class="col-sm-3 control-label">Email</label>

                                                <div class="col-sm-9">
                                                    <input type="email" class="form-control" id="txtEmail" placeholder="Email">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtLandlinePhone" class="col-sm-3 control-label">Landline Phone</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtLandlinePhone" placeholder="Landline Phone">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtRegion" class="col-sm-3 control-label">Region</label>

                                                <div class="col-sm-9">
                                                    <%--<input type="text" class="form-control" id="txtRegion" placeholder="Region">--%>
                                                    <select class="form-control" id="txtRegion"></select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtProvince" class="col-sm-3 control-label">Province</label>

                                                <div class="col-sm-9">
                                                    <%--<input type="text" class="form-control" id="txtProvince" placeholder="Province">--%>
                                                    <select class="form-control" id="txtProvince"></select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtLastName" class="col-sm-3 control-label">City</label>

                                                <div class="col-sm-9">
                                                    <%--<input type="text" class="form-control" id="txtCity" placeholder="City">--%>
                                                    <select class="form-control" id="txtCity"></select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="InputFile_BorrowerPhoto" class="col-sm-3 control-label">Borrower Photo</label>
                                                <div class="col-sm-9">
                                                    <input type="file" class="custom-file-input" data-classification="BORROWER_PHOTO" id="borrower_photo">

                                                    <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="InputFileSignature" class="col-sm-3 control-label">Signature of Borrower</label>
                                                <div class="col-sm-9">
                                                    <input type="file" class="custom-file-input" data-classification="CO_SIGNATURE" id="co_signature">

                                                    <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label"></label>
                                                <div class="col-sm-9">
                                                    <p>
                                                        <br />
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtAge" class="col-sm-3 control-label">Age</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtAge" placeholder="Age">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="datepicker" class="col-sm-3 control-label">Date of Birth</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group date">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-calendar"></i>
                                                        </div>
                                                        <input type="text" class="form-control pull-right" id="datepicker">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtAge" class="col-sm-3 control-label">Sex</label>

                                                <div class="col-sm-9">
                                                    <select class="form-control" id="slctSex">
                                                        <option></option>
                                                        <option value="M">Male</option>
                                                        <option value="F">Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtAge" class="col-sm-3 control-label">Marital Status</label>

                                                <div class="col-sm-9">
                                                    <%--<input type="text" class="form-control" id="txtMaritalStatus" placeholder="Marital Status">--%>
                                                    <select class="form-control" id="txtMaritalStatus">
                                                        <option></option>
                                                        <option value="SINGLE">SINGLE</option>
                                                        <option value="MARRIED">MARRIED</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtSpouseName" class="col-sm-3 control-label">Spouse Name</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtSpouseName" placeholder="Spouse Name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtBarangay" class="col-sm-3 control-label">Barangay</label>

                                                <div class="col-sm-9">
                                                    <%--<input type="text" class="form-control" id="txtBarangay" placeholder="Barangay">--%>
                                                    <select class="form-control" id="txtBarangay"></select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtZipCode" class="col-sm-3 control-label">Zipcode</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtZipCode" placeholder="Zipcode">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtStNo" class="col-sm-3 control-label">Street Name, Bldg. House No.</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtStNo" placeholder="Street Name, Bldg. House No.">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="InputFileValidID" class="col-sm-3 control-label">Valid ID of Borrower</label>
                                                <div class="col-sm-9">
                                                    <input type="file" class="custom-file-input" data-classification="BORROWER_VALID_ID" id="borrower_valid_id">

                                                    <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <%--</div>--%>
                        </div>

                        <!-- OTHER FIELDS -->
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Other Fields</h3>
                                </div>

                                <div class="box-body">
                                    <div class="row">
                                        <form class="form-horizontal">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtBusinessName" class="col-sm-3 control-label">Business Name</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtBusinessName" placeholder="Business Name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtMonthlyGrossIncome" class="col-sm-3 control-label">Monthly Gross Income</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtMonthlyGrossIncome" placeholder="Monthly Gross Income">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtCoguarantorName" class="col-sm-3 control-label">Name of Co-guarantor</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtCoguarantorName" placeholder="Co-guarantor Name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="InputFile_CoguarantorSignature" class="col-sm-3 control-label">Signature of Co-guarantor</label>
                                                    <div class="col-sm-9">
                                                        <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_SIGNATURE" id="co_guarantor_signature">
                                                        Note: Three signature in one photo
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtBusinessName" class="col-sm-3 control-label">Nature of Work</label>

                                                    <div class="col-sm-9">
                                                        <%--<select class="form-control select2" id="slctNatureOfWork">
                                                            <option selected="selected">Alabama</option>
                                                            <option>Alaska</option>
                                                            <option>California</option>
                                                            <option>Delaware</option>
                                                            <option>Tennessee</option>
                                                            <option>Texas</option>
                                                            <option>Washington</option>
                                                        </select>--%>
                                                        <input type="text" class="form-control" id="slctNatureOfWork" placeholder="Nature of Work">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtCharacterReference" class="col-sm-3 control-label">Character Reference</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtCharacterReference" placeholder="Character Reference">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtCoguarantorName" class="col-sm-3 control-label">Phone Number of Co-guarantor</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtCoguarantorPhoneNumber" data-inputmask='"mask": "(9999) 999-9999"' placeholder="Coguarantor Phone Number" data-mask>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="InputFile_CoguarantorValidID" class="col-sm-3 control-label">Valid ID of Co-guarantor</label>
                                                    <div class="col-sm-9">
                                                        <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_VALID_ID" id="co_guarantor_valid_id">
                                                        Note: Co-guarantor included in the photo (selfie)
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="modal-footer">


                    <button type="button" id="btnUpdate" class="btn btn-info" style="left: -38px">
                        <i class="ace-icon fa fa-floppy-o bigger-110"></i>&nbsp; Update</button>

                    <button type="button" id="btnReset" class="btn btn-danger" style="left: -25px">
                        <i class="ace-icon fa fa-trash-o bigger-110"></i>&nbsp; Reset</button>

                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="BorrrowerLoanModal" tabindex="-1" role="dialog" aria-labelledby="BorrrowerLoanModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">View Borrower's Loan</h5>
                </div>

                <div class="modal-body" id="Borrower_loan_modal_content">
                    <%--<div class="content-wrapper">--%>
                    <section class="invoice">


                        <div class="row invoice-info">
                            <div class="col-sm-2 invoice-col">
                                <div class="box-body box-profile">
                                    <img class="profile-user-img img-responsive img-circle" src="../dist/img/user4-128x128.jpg" alt="User profile picture" id="image_upload_preview">
                                    <input type="hidden" runat="server" id="txtUserID" />
                                </div>
                            </div>
                            <div class="col-sm-3 invoice-col">
                                <address>
                                    <label id="lblName"></label>
                                    <br>
                                    <span id="lblBusinessName"></span>
                                    <br>
                                    <span id="lblSex"></span>, <span id="lblAge"></span>years old<br>
                                    <%-- Phone: (804) 123-5432<br>
                                        Email: info@almasaeedstudio.com--%>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 invoice-col">
                                <address>
                                    <span id="lblStreet"></span>
                                    <br>
                                    <span id="lblCity"></span>
                                    <br>
                                    <span id="lblProvince"></span>
                                    <br>
                                    <span id="lblZipcode"></span>
                                    <br>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 invoice-col">
                                <span id="lblLandline"></span>
                                <br>
                                <span id="lblEmail"></span>
                                <br>
                                <span id="lblContactNo"></span>
                                <br>
                            </div>
                            <!-- /.col -->
                            <div class="col-xs-12">
                                <button type="button" id="btnAddloanModal" class="btn btn-success pull-right">Add Loan</button>
                            </div>
                        </div>
                    </section>

                    <section class="invoice" id="addloan_content" style="display: none">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Required Fields</h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <form class="form-horizontal">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtBorrowerName" class="col-sm-3 control-label">Borrower Name</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtBorrowerName" disabled>
                                                    </div>
                                                </div>
                                                <div class="form-group" hidden="hidden">
                                                    <label for="txtProduct" class="col-sm-3 control-label">Loan Product</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtProduct" placeholder="Loan Product">
                                                        Note: Input reason for loan
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputID" class="col-sm-3 control-label">Loan Release Date</label>

                                                    <div class="col-sm-9">
                                                        <div class="input-group date">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </div>
                                                            <input type="text" class="form-control pull-right" id="datepicker1">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtLoanAmount" class="col-sm-3 control-label">Loan Amount</label>

                                                    <div class="col-sm-9">
                                                        <select class="form-control select2" id="txtLoanAmount">
                                                        </select>
                                                        <%--<input type="number" class="form-control" id="txtLoanAmount" placeholder="0">--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- REPAYMENT -->
                            <div class="col-xs-12">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Repayment</h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <form class="form-horizontal">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtLoanId" class="col-sm-3 control-label">Installment Plan</label>

                                                    <div class="col-sm-9">
                                                        <select class="form-control select2" id="slctInstallmentType">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtLoanTenure" class="col-sm-3 control-label">Loan Tenure</label>

                                                    <div class="col-sm-9">
                                                        <select class="form-control select2" id="txtLoanTenure">
                                                        </select>
                                                        <%--<input type="text" class="form-control" id="txtLoanTenure" placeholder="Loan Tenure">--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>

                            <!-- FEES -->
                            <div class="col-xs-12">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Fees</h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <form class="form-horizontal">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtProcessingFee" class="col-sm-3 control-label">Processing Fee (10%)</label>

                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="txtProcessingFee" placeholder="0" disabled="disabled">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtInterestRate" class="col-sm-3 control-label">Interest Rate</label>

                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="txtInterestRate" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>


                            <!-- COLLATERAL REGISTER -->
                            <div class="col-xs-12">

                                <div class="box-header with-border">
                                    <h3 class="box-title">Collateral Register</h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <form class="form-horizontal">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtNatureofCollateral" class="col-sm-3 control-label">Nature of Collateral</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtNatureofCollateral" placeholder="Nature of Collateral">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtDescription" class="col-sm-3 control-label">Description</label>

                                                    <div class="col-sm-9">
                                                        <textarea class="form-control" rows="3" id="txtDescription" placeholder="Enter ..."></textarea>
                                                        Note: Indicate other details abput the Collateral. (Ex. year model acquisition of car)
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group" hidden="hidden">
                                                    <label for="txtStatus" class="col-sm-3 control-label">Status</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtStatus" placeholder="Status">
                                                    </div>
                                                </div>

                                                <div class="form-group" hidden="hidden">
                                                    <label for="txtValue" class="col-sm-3 control-label">Value</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtValue" placeholder="Value">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="InputFile_ProofofCollateral" class="col-sm-3 control-label">Attach Proof of Collateral</label>
                                                    <div class="col-sm-9">
                                                        <input type="file" class="custom-file-input-loan" data-classification="COLLATERAL_PHOTO" id="InputFile_ProofofCollateral">
                                                        Note: Borrower included in the photo
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="InputFile_ProofofReceipt" class="col-sm-3 control-label">Attach Proof of Receipt</label>
                                                    <div class="col-sm-9">
                                                        <input type="file" class="custom-file-input-loan" data-classification="PROOF_RECEIPT" id="InputFile_ProofofReceipt">

                                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="btnAddLoan" class="btn btn-info" style="left: -38px">
                                        <i class="ace-icon fa fa-floppy-o bigger-110"></i>&nbsp; Submit</button>
                                </div>
                            </div>
                        </div>
                    </section>


                    <div class="row">
                        <div class="col-xs-12">
                            <%--<div class="box">--%>
                            <div class="box-header">
                                <h3 class="box-title">Loans</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table id="tblBorrowersLoan" class="table table-bordered table-striped" style="width: 100% !important">
                                    <thead>
                                        <tr>
                                            <th>USERID</th>
                                            <th>Name</th>
                                            <th>Released</th>
                                            <th>Start Date</th>
                                            <th>Repayment</th>
                                            <th>Fees</th>
                                            <th>Due</th>
                                            <th>Paid</th>
                                            <th>Balance</th>
                                            <th>Last Repayment</th>
                                            <th>Status</th>
                                            <%--<th>Edit</th>--%>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>USERID</th>
                                            <th>Name</th>
                                            <th>Released</th>
                                            <th>Start Date</th>
                                            <th>Repayment</th>
                                            <th>Fees</th>
                                            <th>Due</th>
                                            <th>Paid</th>
                                            <th>Balance</th>
                                            <th>Last Repayment</th>
                                            <th>Status</th>
                                            <%--<th>Edit</th>--%>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="BorrrowerLoanModalDetails" tabindex="-1" role="dialog" aria-labelledby="BorrrowerLoanModalDetails" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">View Borrower's Loan Details</h5>
                </div>

                <div class="modal-body" id="Borrower_loan_modal_detail_content">

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box-body">
                                <table id="tblBorrowersLoanHeader" class="table table-bordered table-striped" style="width: 100% !important">
                                    <thead>
                                        <tr>
                                            <th>USERID</th>
                                            <th>Name</th>
                                            <th>Released</th>
                                            <th>Start Date</th>
                                            <th>Repayment</th>
                                            <th>Fees</th>
                                            <th>Due</th>
                                            <th>Paid</th>
                                            <th>Balance</th>
                                            <th>Last Repayment</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="box-body" style="text-align: center; background-color: whitesmoke;">
                                <label>Amount to Pay :</label>
                                <input type="text" id="txtAmounttoPaid" />
                            </div>
                            <div class="box-body">
                                <table id="tblBorrowersLoanDetails" class="table table-bordered table-striped" style="width: 100% !important">
                                    <thead>
                                        <tr>
                                            <th>AMOUNT</th>
                                            <th>USERID</th>
                                            <th>Name</th>
                                            <th>Loan #</th>
                                            <th>Collected By</th>
                                            <th>Collection Date</th>
                                            <th>Paid Amount</th>
                                            <th>Status</th>
                                            <th>Repayment</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <%-- <div class="modal fade" id="RepaymentContent" tabindex="-1" role="dialog" aria-labelledby="RepaymentContent" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">Repayment</h5>
                </div>

                <div class="modal-body" id="RepaymentBodyContent">

                    <div class="row">
                        <div class="col-xs-12">
                             <div class="box-body">
                                 <form class="form-horizontal">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtLoanId" class="col-sm-3 control-label">Loan #</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtLoanId" placeholder="0">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtProduct" class="col-sm-3 control-label">Loan Product</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtProduct" placeholder="Loan Product">
                                        Note: Input reason for loan
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputID" class="col-sm-3 control-label">Loan Release Date</label>

                                    <div class="col-sm-9">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" id="datepicker">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtLoanAmount" class="col-sm-3 control-label">Loan Amount</label>

                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="txtLoanAmount" placeholder="0">
                                    </div>
                                </div>
                            </div>
                        </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>--%>
    <%--<script src="../bower_components/jquery/dist/jquery.min.js"></script>--%>
    <script src="../datatable/jquery-3.7.0.js"></script>
    <script src="../bower_components/toastr/toastr.min.js"></script>
    <script type="text/javascript">
        var _ipaddress = "<%= this.ipAddress %>";
        //var baseUrl = "http://" + _ipaddress + "/Getgo/Images/";
        var baseUrl = "http://lendgetgo-001-site1.atempurl.com/UploadedFiles/";
        var ProfileImage = $('#image_upload_preview');
        //$(() => {

        //    GetData({
        //        url: "Borrowers.aspx/GetSessionValue"
        //    }).then(e => {
        //        let data = JSON.parse(e.d);
        //        console.log(data);
        //        ProfileImage.attr('src', baseUrl + data[0].PROFILE_PIC);
        //    });
        //});

        //const GetData = (config) => {
        //    config.type = config.type || "POST";
        //    config.data = config.data || "";
        //    return $.ajax({
        //        type: config.type,
        //        url: config.url,
        //        data: config.data,
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: data => { },
        //        error: function (xhr, status, error) {
        //            if (xhr.status === 413) {
        //                alert('Request Entity Too Large: The file you are trying to upload is too large.');
        //            } else {
        //                alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
        //            }
        //            $('#ERROR').text('Error: ' + error);

        //        }


        //    });

        //};
    </script>
    <script src="../scripts/notification.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/Address.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/borrowers.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/dropdown.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>

    <script src="../datatable/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables.net/js/dataTables.editor.min.js"></script>
    <script src="../datatable/dataTables.bootstrap.min.js"></script>

<%--    <script src="../datatable/dataTables.buttons.min.js"></script>
    <script src="../datatable/buttons.html5.min.js"></script>
    <script src="../datatable/buttons.print.min.js"></script>
    <script src="../datatable/htmlencode.min.js"></script>
    <script src="../datatable/jszip.min.js"></script>
    <script src="../datatable/moment.min.js"></script>
    <script src="../datatable/pdfmake.min.js"></script>
    <script src="../datatable/vfs_fonts.js"></script>--%>
</asp:Content>

