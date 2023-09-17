<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Borrowers.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
    <link href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                                    <input type="text" class="form-control" id="txtRegion" placeholder="Region">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtProvince" class="col-sm-3 control-label">Province</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtProvince" placeholder="Province">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtLastName" class="col-sm-3 control-label">City</label>

                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="txtCity" placeholder="City">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="InputFile_BorrowerPhoto" class="col-sm-3 control-label">Borrower Photo</label>
                                                <div class="col-sm-9">
                                                    <input type="file" id="InputFile_BorrowerPhoto">

                                                    <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="InputFileSignature" class="col-sm-3 control-label">Signature of Borrower</label>
                                                <div class="col-sm-9">
                                                    <input type="file" id="InputFileSignature">

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
                                                    <input type="text" class="form-control" id="txtMaritalStatus" placeholder="Marital Status">
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
                                                    <input type="text" class="form-control" id="txtBarangay" placeholder="Barangay">
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
                                                    <input type="file" id="InputFileValidID">

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
                                                        <input type="file" id="InputFile_CoguarantorSignature">
                                                        Note: Three signature in one photo
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtBusinessName" class="col-sm-3 control-label">Nature of Work</label>

                                                    <div class="col-sm-9">
                                                        <select class="form-control select2" id="slctNatureOfWork">
                                                            <option selected="selected">Alabama</option>
                                                            <option>Alaska</option>
                                                            <option>California</option>
                                                            <option>Delaware</option>
                                                            <option>Tennessee</option>
                                                            <option>Texas</option>
                                                            <option>Washington</option>
                                                        </select>
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
                                                        <input type="file" id="InputFile_CoguarantorValidID">
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

                        <!-- COLLATERAL REGISTER -->
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Collateral Register</h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <form class="form-horizontal">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="selectType" class="col-sm-3 control-label">Type</label>

                                                    <div class="col-sm-9">
                                                        <select class="form-control select2" id="slctType">
                                                            <option selected="selected">Alabama</option>
                                                            <option>Alaska</option>
                                                            <option>California</option>
                                                            <option>Delaware</option>
                                                            <option>Tennessee</option>
                                                            <option>Texas</option>
                                                            <option>Washington</option>
                                                        </select>
                                                    </div>
                                                </div>
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
                                                <div class="form-group">
                                                    <label for="txtStatus" class="col-sm-3 control-label">Status</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtStatus" placeholder="Status">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtValue" class="col-sm-3 control-label">Value</label>

                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="txtValue" placeholder="Value">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="InputFile_ProofofCollateral" class="col-sm-3 control-label">Attach Proof of Collateral</label>
                                                    <div class="col-sm-9">
                                                        <input type="file" id="InputFile_ProofofCollateral">
                                                        Note: Borrower included in the photo
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="InputFile_ProofofReceipt" class="col-sm-3 control-label">Attach Proof of Receipt</label>
                                                    <div class="col-sm-9">
                                                        <input type="file" id="InputFile_ProofofReceipt">

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

    <div class="modal fade" id="AddLoanModal" tabindex="-1" role="dialog" aria-labelledby="AddLoanModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">Add Loan</h5>
                </div>

                <div class="modal-body" id="add_loan_modal_content">
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
                            <div class="box">
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
                        </div>

                        <!-- FEES -->
                        <div class="col-xs-12">
                            <div class="box">
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
                                                        <input type="number" class="form-control" id="txtInterestRate" placeholder="0" disabled="disabled">
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


                    <button type="button" id="btnAddLoan" class="btn btn-info" style="left: -38px">
                        <i class="ace-icon fa fa-floppy-o bigger-110"></i>&nbsp; Submit</button>

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
                                    <img class="profile-user-img img-responsive img-circle" src="../dist/img/user4-128x128.jpg" alt="User profile picture">
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
                                <button type="button" id="btnAddloanModal" class="btn btn-success pull-right">
                                    <i class="glyphicon glyphicon-plus-sign"></i> Add Loan
                                </button>
                            </div>
                        </div>
                    </section>

                    <%--</div>--%>




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
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>USERID</th>
                                            <th>Name</th>
                                            <th>Released</th>
                                            <th>Maturity</th>
                                            <th>Repayment</th>
                                            <th>Due</th>
                                            <th>Paid</th>
                                            <th>Balance</th>
                                            <th>Last Repayment</th>
                                            <th>Status</th>
                                            <th>Edit</th>
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
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/toastr/toastr.min.js"></script>
    <script src="../scripts/notification.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/borrowers.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/dropdown.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</asp:Content>

