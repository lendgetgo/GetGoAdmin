﻿<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Notification.aspx.cs" Inherits="Notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
    <style>
        .box-header button {
            width: 200px;
        }
        .meow {
            width:100px;
            height:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Notifications</h3>
                </div>
                <div class="box-header">
                    <button type="button" id="btnAccount" class="btn btn-success" style="left: -38px">
                        <i class="ace-icon fa fa-floppy-o bigger-110"></i>&nbsp; Account Verification</button>

                    <button type="button" id="btnLoan" class="btn btn-primary" style="left: -38px">
                        <i class="ace-icon fa fa-floppy-o bigger-110"></i>&nbsp; Loan Verification</button>

                    <button type="button" id="btnWithdrawal" class="btn btn-primary" style="left: -38px">
                        <i class="ace-icon fa fa-floppy-o bigger-110"></i>&nbsp; Withdrawal</button>

                   <%-- <button type="button" id="btnRepayments" class="btn btn-primary" style="left: -38px">
                        <i class="ace-icon fa fa-floppy-o bigger-110"></i>&nbsp; Repayments</button>--%>
                </div>
                <!-- /.box-header -->
                <div class="box-body" id="AccountContent">
                    <table id="tblUsers" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Action</th>
                                <th>Full Name</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                    </table>
                </div>

                <div class="box-body" id="LoanContent" hidden="hidden">
                    <table id="tblLoan" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Action</th>
                                <th>Full Name</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                    </table>
                </div>

                <div class="box-body" id="WithdrawalContent" hidden="hidden">
                    <table id="tblWithdrawal" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Action</th>
                                <th>Full Name</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                    </table>
                </div>

                <div class="box-body" id="RepaymentsContent" hidden="hidden">
                    <table id="tblRepayments" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Action</th>
                                <th>Full Name</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="UserModal" tabindex="-1" role="dialog" aria-labelledby="UserModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">New Account - For Approval</h5>
                </div>

                <div class="modal-body">
                    <%--<div class="content-wrapper">--%>
                    <section class="invoice">


                        <div class="row invoice-info">
                            <div class="col-sm-2 invoice-col">
                                <div class="box-body box-profile">
                                    <img class="profile-user-img img-responsive img-circle " src="../dist/img/user4-128x128.jpg" id="profilePic" alt="User profile picture">
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
                            <div class="col-xs-12" style="display: flex; flex-direction: column">
                                <div>
                                    <label>Max Credit Limit: </label>
                                    <select id="txtCreditLimit">
                                        <option value="3000">3000</option>
                                        <option value="6000">6000</option>
                                        <option value="9000">9000</option>
                                        <option value="12000">12000</option>
                                        <option value="15000">15000</option>
                                    </select>
                                </div>
                                <div style="position: absolute; right: 10px;">
                                    <button type="button" id="btnApproveUser" class="btn btn-success">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; Approve
                                    </button>
                                    <button type="button" id="btnDeclineUser" class="btn btn-danger">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; Decline
                                    </button>
                                </div>
                            </div>
                        </div>
                    </section>

                    <div class="row">
                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Valid ID</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <img src="#" alt="..." class="margin meow" id="imgFrontFace">
                                    <img src="#" alt="..." class="margin meow" id="imgBackFace">
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Signature</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <img src="#" alt="..." class="margin meow" id="imgSignature">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="LoanModal" tabindex="-1" role="dialog" aria-labelledby="LoanModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">GetGo Loan Application Form - For Approval</h5>
                </div>

                <div class="modal-body">
                    <%--<div class="content-wrapper">--%>
                    <section class="invoice">


                        <div class="row invoice-info">
                            <div class="col-sm-2 invoice-col">
                                <div class="box-body box-profile">
                                    <img class="profile-user-img img-responsive img-circle" src="#" alt="User profile picture" id="profilePic_loan">
                                </div>
                            </div>
                            <div class="col-sm-3 invoice-col">
                                <address>
                                    <label id="lblName_Loan"></label>
                                    <br>
                                    <span id="lblBusinessName_Loan"></span>
                                    <br>
                                    <span id="lblSex_Loan"></span>, <span id="lblAge_Loan"></span>years old<br>
                                    <%-- Phone: (804) 123-5432<br>
                                        Email: info@almasaeedstudio.com--%>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 invoice-col">
                                <address>
                                    <span id="lblStreet_Loan"></span>
                                    <br>
                                    <span id="lblCity_Loan"></span>
                                    <br>
                                    <span id="lblProvince_Loan"></span>
                                    <br>
                                    <span id="lblZipcode_Loan"></span>
                                    <br>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 invoice-col">
                                <span id="lblLandline_Loan"></span>
                                <br>
                                <span id="lblEmail_Loan"></span>
                                <br>
                                <span id="lblContactNo_Loan"></span>
                                <br>
                            </div>
                            <!-- /.col -->
                            <div class="col-xs-12" style="display: flex; flex-direction: column">
                                <%--<div>
                                    <label>Max Credit Limit: </label>
                                    <select id="txtCreditLimit_Loan">
                                        <option value="3000">3000</option>
                                        <option value="6000">6000</option>
                                        <option value="9000">9000</option>
                                        <option value="12000">12000</option>
                                        <option value="15000">15000</option>
                                    </select>
                                </div>--%>
                                <div style="position: absolute; right: 10px;">
                                    <button type="button" id="btnApproveUser_Loan" class="btn btn-success">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; Approve Loan Application
                                    </button>
                                    <button type="button" id="btnDeclineUser_Loan" class="btn btn-danger">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; Decline Loan Application
                                    </button>
                                </div>
                                <br />
                            </div>
                        </div>
                    </section>

                    <section class="invoice">
                        <div class="row invoice-info">
                            <div class="col-sm-2 invoice-col">
                                Loan Amount:
                                <br />
                                Installment Plan:
                                <br />
                                Months to Pay:
                                <br />
                                Branch Name:
                                <br />
                                Monthly Payment:
                            </div>

                            <div class="col-sm-4 invoice-col">
                                <span id="lblLoan_Amount"></span>
                                <br />
                                <span id="lblInstallment_Plan"></span>
                                <br />
                                <span id="lblMonthsTo_Pay"></span>
                                <br />
                                <span id="lblBranch_Name"></span>
                                <br />
                                <span id="lblMonthly_Payment"></span>
                            </div>


                            <div class="row invoice-info">
                                <div class="col-sm-2 invoice-col">
                                    Nature of Work:
                                <br />
                                    Monthly Gross Income:
                                <br />
                                    Character Reference:
                                <br />
                                    Co-guarantor:
                                <br />
                                    Phone of Co-guarantor:
                                </div>

                                <div class="col-sm-4 invoice-col">
                                    <span id="lblNature_of_Work"></span>
                                    <br />
                                    <span id="lblMonthly_Gross_Income"></span>
                                    <br />
                                    <span id="lblCharacter_Reference"></span>
                                    <br />
                                    <span id="lblCo-guarantor"></span>
                                    <br />
                                    <span id="lblPhone_of_Co-guarantor"></span>
                                </div>
                            </div>
                        </div>
                    </section>

                    <div class="row">
                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Valid ID</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <a href="#" id="lblFrontFace_Loan" target="_blank"><img src="#" alt="..." class="margin meow" id="imgFrontFace_Loan"></a>
                                    <a href="#" id="lblBackFace_Loan" target="_blank"><img src="#" alt="..." class="margin meow" id="imgBackFace_Loan"></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Signature</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <a href="#" id="lblSignature_Loan" target="_blank"><img src="#" alt="..." class="margin meow" id="imgSignature_Loan"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="WithdrawalModal" tabindex="-1" role="dialog" aria-labelledby="WithdrawalModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">New Account - For Approval</h5>
                </div>

                <div class="modal-body">
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
                                    <label id="lblName_W"></label>
                                    <br>
                                    <span id="lblBusinessName_W"></span>
                                    <br>
                                    <span id="lblSex_W"></span>, <span id="lblAge_W"></span>years old<br>
                                    <%-- Phone: (804) 123-5432<br>
                                        Email: info@almasaeedstudio.com--%>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 invoice-col">
                                <address>
                                    <span id="lblStreet_W"></span>
                                    <br>
                                    <span id="lblCity_W"></span>
                                    <br>
                                    <span id="lblProvince_W"></span>
                                    <br>
                                    <span id="lblZipcode_W"></span>
                                    <br>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 invoice-col">
                                <span id="lblLandline_W"></span>
                                <br>
                                <span id="lblEmail_W"></span>
                                <br>
                                <span id="lblContactNo_W"></span>
                                <br>
                            </div>
                            <!-- /.col -->
                            <div class="col-xs-12" style="display: flex; flex-direction: column">
                                <div style="position: absolute; right: 10px;">
                                    <button type="button" id="btnNotifyBorrower" class="btn btn-success">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; Notify Borrower
                                    </button>
                                    <%--<button type="button" id="btnInProcess" class="btn btn-danger">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; In-Process
                                    </button>--%>
                                </div>
                            </div>
                        </div>
                    </section>

                    <div class="row">
                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Valid ID</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <img src="../../GetGo/UploadedFiles/6386976.png" alt="..." class="margin" id="imgFrontFace_W">
                                    <img src="#" alt="..." class="margin" id="imgBackFace_W">
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Signature</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <img src="#" alt="..." class="margin" id="imgSignature_W">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="RepaymentModal" tabindex="-1" role="dialog" aria-labelledby="RepaymentModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 90% !important">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 1px solid #39a2df; margin: 9px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">Repayment - For Approval</h5>
                </div>

                <div class="modal-body">
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
                                    <label id="lblName_R"></label>
                                    <br>
                                    <span id="lblBusinessName_R"></span>
                                    <br>
                                    <span id="lblSex_R"></span>, <span id="lblAge_R"></span>years old<br>
                                    <%-- Phone: (804) 123-5432<br>
                                        Email: info@almasaeedstudio.com--%>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 invoice-col">
                                <address>
                                    <span id="lblStreet_R"></span>
                                    <br>
                                    <span id="lblCity_R"></span>
                                    <br>
                                    <span id="lblProvince_R"></span>
                                    <br>
                                    <span id="lblZipcode_R"></span>
                                    <br>
                                </address>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 invoice-col">
                                <span id="lblLandline_R"></span>
                                <br>
                                <span id="lblEmail_R"></span>
                                <br>
                                <span id="lblContactNo_R"></span>
                                <br>
                            </div>
                            <!-- /.col -->
                            <div class="col-xs-12" style="display: flex; flex-direction: column">
                                <div style="position: absolute; right: 10px;">
                                    <button type="button" id="btnConfirmPayment" class="btn btn-success">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; Confirm Payment
                                    </button>
                                    <button type="button" id="btnInProcess_R" class="btn btn-danger">
                                        <i class="ace-icon fa fa-check bigger-110"></i>&nbsp; In-Process
                                    </button>
                                </div>
                            </div>
                        </div>
                    </section>

                     <section class="invoice">
                        <div class="row invoice-info">
                            <div class="col-sm-2 invoice-col">
                                Loan Amount:
                                <br />
                                Installment Plan:
                                <br />
                                Months to Pay:
                                <br />
                                Branch Name:
                                <br />
                                Monthly Payment:
                            </div>

                            <div class="col-sm-4 invoice-col">
                                <span id="lblLoan_Amount_W"></span>
                                <br />
                                <span id="lblInstallment_Plan_W"></span>
                                <br />
                                <span id="lblMonthsTo_Pay_W"></span>
                                <br />
                                <span id="lblBranch_Name_W"></span>
                                <br />
                                <span id="lblMonthly_Payment_W"></span>
                            </div>


                            <div class="row invoice-info">
                                <div class="col-sm-2 invoice-col">
                                    Nature of Work:
                                <br />
                                    Monthly Gross Income:
                                <br />
                                    Character Reference:
                                <br />
                                    Co-guarantor:
                                <br />
                                    Phone of Co-guarantor:
                                </div>

                                <div class="col-sm-4 invoice-col">
                                    <span id="lblNature_of_Work_W"></span>
                                    <br />
                                    <span id="lblMonthly_Gross_Income_W"></span>
                                    <br />
                                    <span id="lblCharacter_Reference_W"></span>
                                    <br />
                                    <span id="lblCo-guarantor_W"></span>
                                    <br />
                                    <span id="lblPhone_of_Co-guarantor_W"></span>
                                </div>
                            </div>
                        </div>
                    </section>

                    <div class="row">
                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Valid ID</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <img src="../../GetGo/UploadedFiles/6386976.png" alt="..." class="margin" id="imgFrontFace_W">
                                    <img src="#" alt="..." class="margin" id="imgBackFace_W">
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <div class="box-header">
                                <h3 class="box-title">Signature</h3>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-body">
                                    <img src="#" alt="..." class="margin" id="imgSignature_W">
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
    <script src="../scripts/notification.js"></script>

   
    <script>
        var _ipaddress = "<%= this.ipAddress %>";


    </script>
    <script src="../scripts/ForApproval.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</asp:Content>

