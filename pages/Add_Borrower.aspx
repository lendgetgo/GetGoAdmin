﻿<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Add_Borrower.aspx.cs" Inherits="Add_Borrower" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
    <style>
        .datepicker {
             z-index:9999 !important;
        }
        input {
            text-transform: capitalize;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" id="content">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Required Fields</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="col-md-6">
                                <div class="form-group" style="display:none">
                                    <label for="inputID" class="col-sm-3 control-label">ID #</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="inputID" placeholder="01">
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
                                    <label for="txtLandlinePhone" class="col-sm-3 control-label">Contact Number</label>

                                    <div class="col-sm-9" style="display:flex;">
                                        <input type="text" class="form-control" id="txt63" value="63" disabled="disabled" style="width: 45px !important">
                                        <input type="text" class="form-control" id="txtLandlinePhone" placeholder="Contact Number">
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
                                      <input type="file" class="custom-file-input" data-classification="PROFILE" id="InputFile_BorrowerPhoto">
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="InputFileSignature" class="col-sm-3 control-label">Signature of Borrower</label>
                                    <div class="col-sm-9">
                                      <input type="file" class="custom-file-input" data-classification="SIGNATURE" id="co_signature">

                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-9">
                                       <p><br /></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtAge" class="col-sm-3 control-label">Age</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtAge" placeholder="Age" disabled="disabled">
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
                                            <option value="Single">Single</option>
                                            <option value="Married">Married</option>
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
                                        <select class="form-control" id="txtBarangay" style="text-transform:uppercase"></select>
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
                                        <input type="file" class="custom-file-input" data-classification="FRONTFACE" id="InputFileValidID">

                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
                                        <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_SIGNATURE" id="InputFile_CoguarantorSignature">
                                        Note: Three signature in one photo
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtBusinessName" class="col-sm-3 control-label">Nature of Work</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="slctNatureOfWork" placeholder="Nature of work">
                                        <%--<select class="form-control select2" id="slctNatureOfWork">
                                            <option selected="selected">Alabama</option>
                                            <option>Alaska</option>
                                            <option>California</option>
                                            <option>Delaware</option>
                                            <option>Tennessee</option>
                                            <option>Texas</option>
                                            <option>Washington</option>
                                        </select>--%>
                                    </div>
                                </div>
                                <div class="form-group" hidden="hidden">
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
                                        <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_VALID_ID" id="InputFile_CoguarantorValidID">
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

        <!-- ACTION -->
        <div class="col-xs-12">

            <div class="box-footer">
                <button type="button" class="btn btn-default" id="btnCancel">Cancel</button>
                <button type="submit" class="btn btn-info pull-right" id="btnSubmit">Submit</button>
            </div>

        </div>

    </div>
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/toastr/toastr.min.js"></script>
    <script src="../scripts/notification.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/borrowers.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/Address.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</asp:Content>

