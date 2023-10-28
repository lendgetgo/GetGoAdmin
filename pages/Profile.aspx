<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Required Fields</h3>
                </div>
                <div class="box-header">
                    <!-- Profile Image -->
                    <div class="box-body box-profile">
                           <span id="spantxtName" runat="server" class="hidden-xs"></span>
                        <img class="profile-user-img img-responsive img-circle" src="../dist/img/user4-128x128.jpg" id="image_upload_preview" alt="User profile picture">
                    </div>
                </div>
                <div class="box-body">
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="col-md-6">
                                <div class="form-group">
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
                                        <input type="text" class="form-control">
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
                                        <select class="form-control">
                                            <option></option>
                                            <option>Male</option>
                                            <option>Female</option>
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
                                        <select class="form-control select2">
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
                                        <select class="form-control select2">
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

        <!-- ACTION -->
        <div class="col-xs-12">

            <div class="box-footer">
                <button type="submit" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-info pull-right">Submit</button>
            </div>

        </div>

    </div>
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../scripts/borrowers.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>

    <script>
        var USERID;
        var baseUrl = "http://192.168.1.12/Images/";
        var ProfileImage = $('#image_upload_preview');
        $(() => {
      
            GetData({
                url: "Profile.aspx/GetSessionValue"
            }).then(e => {
                let data = JSON.parse(e.d);
                console.log(data);
                ProfileImage.attr('src', baseUrl + data[0].PROFILE_PIC);
/*                ProfileImage.attr('src', baseUrl + "APP231007001/collateral.jpeg");*/

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

