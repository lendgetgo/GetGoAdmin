<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="View_Account.aspx.cs" Inherits="View_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
    <style>
        .datepicker {
            z-index: 9999 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">View Accounts</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="tblUsers" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Position</th>
                                <th>Unique No.</th>
                                <th>Mobile</th>
                                <th>Email</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="Modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">Update Account Details</h5>
                </div>

                <div id="userMaintenance" class="modal-body">
                    <div class="row" id="content">
                        <div class="col-xs-12">

                            <div class="box-body">
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

                                                <div class="col-sm-9" style="display: flex;">
                                                    <input type="text" class="form-control" id="txt63" value="63" disabled="disabled" style="width: 45px !important">
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
                                                    <input type="file" class="custom-file-input" data-classification="PROFILE" id="InputFile_ProfilePhoto">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- ACTION -->
                            <div class="col-xs-12">

                                <div class="box-footer">
                                    <button type="button" id="btnSubmit" class="btn btn-info pull-right">Submit</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/toastr/toastr.min.js"></script>
    <script src="../scripts/userAccount.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
    <script src="../scripts/notification.js"></script>
    <script>
        $(document).ready(function () {
            var USER_ID;
            viewlist();
            function viewlist() {
                $.ajax({
                    url: "View_Account.aspx/GetUserList",
                    type: "POST",
                    data: "{}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        var d = JSON.parse(e.d)
                        console.log(d);
                        if ($("#tblUsers").hasClass("dataTable")) {
                            $("#tblUsers").DataTable().destroy();
                        }
                        $('#tblUsers').DataTable({
                            data: d,
                            columns: [
                                { "data": "CompleteName" },
                                { "data": "USER_ACCESS" },
                                { "data": "USER_ID" },
                                { "data": "CONTACT_NO" },
                                { "data": "EMAIL_ADDRESS" },
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
                            ]
                        });
                    }
                });
            }
            $('#tblUsers').on('click', 'td.editor-delete', function (e) {
                var tblUser = $('#tblUsers').DataTable();
                var data = tblUser.row($(this).closest('tr')).data();
                var USER_ID = data[Object.keys(data)[2]];
                console.log(USER_ID);
                if (confirm("Are you sure you want to delete this data?")) {
                    tblUser.row($(this).closest('tr')).remove().draw();
                    DeleteUser(USER_ID, function () {
                        notification('success', 'Deleted successfully!');
                    });
                }
            });

            $('#tblUsers').on('click', 'td.editor-edit', function (e) {
                $('#Modal').modal('show');
                var tblUser_edit = $('#tblUsers').DataTable();
                var data = tblUser_edit.row($(this).closest('tr')).data();
                USER_ID = data[Object.keys(data)[2]];
                var USER_ACCESS = data[Object.keys(data)[1]];
                var USER_NAME = data[Object.keys(data)[3]];
                var FIRST_NAME = data[Object.keys(data)[5]];
                var MIDDLE_NAME = data[Object.keys(data)[6]];
                var LAST_NAME = data[Object.keys(data)[7]];
                var EXTENSION_NAME = data[Object.keys(data)[8]];
                var EMAIL_ADDRESS = data[Object.keys(data)[9]];
                var REGION = data[Object.keys(data)[10]];
                var PROVINCE = data[Object.keys(data)[11]];
                var CITY = data[Object.keys(data)[12]];
                var PASSWORD = data[Object.keys(data)[13]];
                var AGE = data[Object.keys(data)[14]];
                var DATE_OF_BIRTH = data[Object.keys(data)[15]];
                var SEX = data[Object.keys(data)[16]];
                var CONTACTNO = data[Object.keys(data)[17]];
                var BARANGAY = data[Object.keys(data)[18]];
                var ZIPCODE = data[Object.keys(data)[19]];
                var STREET_NO = data[Object.keys(data)[20]];
                console.log(data);
                $('#slctAccess').val(USER_ACCESS);
                $('#txtUserName').val(USER_NAME);
                $('#txtFirstName').val(FIRST_NAME);
                $('#txtMiddleName').val(MIDDLE_NAME);
                $('#txtLastName').val(LAST_NAME);
                $('#txtExtensionName').val(EXTENSION_NAME);
                $('#txtEmail').val(EMAIL_ADDRESS);
                $('#txtRegion').val(REGION);
                $('#txtProvince').val(PROVINCE);
                $('#txtCity').val(CITY);
                $('#txtPassword').val(PASSWORD);
                $('#txtAge').val(AGE);
                $('#datepicker').val(DATE_OF_BIRTH);
                $('#slctSex').val(SEX);
                $('#txtContactNo').val(CONTACTNO.substring(2));
                $('#txtBarangay').val(BARANGAY);
                $('#txtZipCode').val(ZIPCODE);
                $('#txtStNo').val(STREET_NO);
                //DeleteUser(USER_ID, function () {
                //    notification('success', 'Deleted successfully!');
                //});

            });

            $('#btnSubmit').click(function () {
                $('#Modal').modal('toggle');
                var USER_ACCESS = $('#slctAccess').val();
                var USER_NAME = $('#txtUserName').val();
                var FIRST_NAME = $('#txtFirstName').val();
                var MIDDLE_NAME = $('#txtMiddleName').val();
                var LAST_NAME = $('#txtLastName').val();
                var EXTENSION_NAME = $('#txtExtensionName').val();
                var EMAIL_ADDRESS = $('#txtEmail').val();
                var REGION = $('#txtRegion').val();
                var PROVINCE = $('#txtProvince').val();
                var CITY = $('#txtCity').val();
                var PASSWORD = $('#txtPassword').val();
                var AGE = $('#txtAge').val();
                var DATE_OF_BIRTH = $('#datepicker').val();
                var SEX = $('#slctSex').val();
                var CONTACTNO = $('#txt63').val() + '' + $('#txtContactNo').val();
                var BARANGAY = $('#txtBarangay').val();
                var ZIPCODE = $('#txtZipCode').val();
                var STREET_NO = $('#txtStNo').val();
                var CREATED_BY = '12345';
                /*        var UPDATED_BY = 'ABCDE';*/
                var _request = {
                    USER_ID: USER_ID,
                    USER_ACCESS: USER_ACCESS,
                    USERNAME: USER_NAME,
                    FIRST_NAME: FIRST_NAME,
                    MIDDLE_NAME: MIDDLE_NAME,
                    LAST_NAME: LAST_NAME,
                    EXTENSION_NAME: EXTENSION_NAME,
                    EMAIL_ADDRESS: EMAIL_ADDRESS,
                    CONTACT_NO: CONTACTNO,
                    REGION: REGION,
                    PROVINCE: PROVINCE,
                    CITY: CITY,
                    PASSWORD: PASSWORD,
                    AGE: AGE,
                    DATE_OF_BIRTH: DATE_OF_BIRTH,
                    SEX: SEX,
                    BARANGAY: BARANGAY,
                    ZIPCODE: ZIPCODE,
                    STREET_NO: STREET_NO,
                    CREATED_BY: CREATED_BY,
                };
                $.ajax({

                    url: 'View_Account.aspx/UpdateUserAccount',
                    type: 'POST',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: JSON.stringify({ request: _request }),
                    success: function (e) {
                        var d = JSON.parse(e.d)
                        //SaveAttachment(d[0].USER_ID);
                        viewlist();
                        notification('success', 'Updated successfully!');
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
                notification('success', 'Updated successfully!');
            })
        });

        function DeleteUser(_USERID, callback) {
            $.ajax({
                url: "View_Account.aspx/DeleteUser",
                type: "POST",
                data: JSON.stringify({ _USER_ID: _USERID }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (e) {
                    var d = JSON.parse(e.d)
                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
        }
    </script>
    <%-- <script src="../scripts/userAccount.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>--%>
</asp:Content>

