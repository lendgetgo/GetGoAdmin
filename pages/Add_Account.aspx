<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Add_Account.aspx.cs" Inherits="Add_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" id="content">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Required Fields</h3>
                </div>
<%--                <div class="box-header">
                    <!-- Profile Image -->
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="../dist/img/user4-128x128.jpg" alt="User profile picture">
                    </div>
                    
                </div>--%>
                <div class="box-body" >
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="slctAccess" class="col-sm-3 control-label">User Access</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="slctAccess">
                                            <option value="Admin">Administrator</option>
                                            <option value="Approver">Approver</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtUserName" class="col-sm-3 control-label">Username</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtUserName">
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
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-9">
                                        <%--<input type="text" class="form-control">--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtPassword" class="col-sm-3 control-label">Password</label>

                                    <div class="col-sm-9">
                                        <input type="Password" class="form-control" id="txtPassword">
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
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtAge" class="col-sm-3 control-label"></label>

                                    <div class="col-sm-9">
                                        <%--<input type="text" class="form-control">--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtContactNo" class="col-sm-3 control-label">Contact Number</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtContactNo" placeholder="Contact Number">
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
                                    <label for="slctAccess" class="col-sm-3 control-label">Profile Picture</label>
                                    <div class="col-sm-9">
                                        <input type="file" class="custom-file-input" data-classification="PROFILE_PHOTO" id="InputFile_ProfilePhoto">
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
                <button type="submit" class="btn btn-default">Cancel</button>
                <button type="submit" id="btnSubmit" class="btn btn-info pull-right">Submit</button>
            </div>

        </div>

    </div>

    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/toastr/toastr.min.js"></script>
    <script src="../scripts/userAccount.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/notification.js"></script>
</asp:Content>



