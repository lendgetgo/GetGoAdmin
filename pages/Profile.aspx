<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Profile</h3>
                </div>
                <div class="box-header">
                    <!-- Profile Image -->
                    <div class="box-body box-profile">
                        <span id="spantxtName" runat="server" class="hidden-xs"></span>
                        <img class="profile-user-img img-responsive img-circle" src="../dist/img/user4-128x128.jpg" id="image_upload_preview" alt="User profile picture" style="margin-left: 50px;">
                    </div>
                </div>

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
            </div>
        </div>
        <!-- ACTION -->
        <div class="col-xs-12">

            <div class="box-footer">
                <button type="button" class="btn btn-default">Cancel</button>
                <button type="button" id="btnSubmit" class="btn btn-info pull-right">Submit</button>
            </div>

        </div>

    </div>
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/toastr/toastr.min.js"></script>
    <script src="../scripts/notification.js"></script>
    <script src="../scripts/borrowers.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>

    <script>
        var _ipaddress = "<%= this.ipAddress %>";
        var USERID = "<%= this.userid %>";
        var baseUrl = "http://" + _ipaddress + "/Getgo/Images/";
        console.log(baseUrl);
        var ProfileImage = $('#image_upload_preview');
        $(() => {

            GetData({
                url: "Profile.aspx/GetSessionValue"
            }).then(e => {
                let data = JSON.parse(e.d);
                console.log(data);
                ProfileImage.attr('src', baseUrl + data[0].PROFILE_PIC);
                /*                ProfileImage.attr('src', baseUrl + "APP231007001/collateral.jpeg");*/
                //USER_ID = data[0].USER_ID;
                var USER_ACCESS = data[0].USER_ACCESS;
                var USER_NAME = data[0].USER_NAME;
                var FIRST_NAME = data[0].FIRST_NAME;
                var MIDDLE_NAME = data[0].MIDDLE_NAME;
                var LAST_NAME = data[0].LAST_NAME;
                var EXTENSION_NAME = data[0].EXTENSION_NAME;
                var EMAIL_ADDRESS = data[0].EMAIL_ADDRESS;
                var REGION = data[0].REGION;
                var PROVINCE = data[0].PROVINCE;
                var CITY = data[0].CITY;
                var PASSWORD = data[0].PASSWORD;
                var AGE = data[0].AGE;
                var DATE_OF_BIRTH = data[0].DATE_OF_BIRTH;
                var SEX = data[0].SEX;
                var CONTACTNO = data[0].CONTACT_NO;
                var BARANGAY = data[0].BARANGAY;
                var ZIPCODE = data[0].ZIPCODE;
                var STREET_NO = data[0].STREET_NO;

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

            });

            $('#btnSubmit').click(function () {
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
                    USER_ID: USERID,
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

                    url: 'Profile.aspx/UpdateUserAccount',
                    type: 'POST',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: JSON.stringify({ request: _request }),
                    success: function (e) {
                        var d = JSON.parse(e.d);
                        notification('success', 'Updated successfully!');
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
               // notification('success', 'Updated successfully!');
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

    </script>
</asp:Content>

