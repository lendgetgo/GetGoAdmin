<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="CollectionReport.aspx.cs" Inherits="CollectionReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <style>
        .box-header.with-border {
            background-color: ghostwhite;
        }

        .box-body {
            font-size: large;
        }

        h3.box-title {
            font-size: medium !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Total Loans</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="display: flex; justify-content: space-between;">
                        <span id="lblLoanCount"></span>
                        <span id="lblLoanAmount"></span>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Total Paid Loans</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="box-body" style="display: flex; justify-content: space-between;">
                            <span id="lblLoanPaidCount"></span>
                            <span id="lblLoanPaidAmount"></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Upcoming Due Dates</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="display: flex; justify-content: space-between;">
                        <span id="lblDue"></span>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Advance Payments</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        TEST
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Late Payments</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        TEST
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Collected Payments</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="display: flex; justify-content: space-between;">
                        <span id="lblCollected"></span>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Registered Borrowers</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="display: flex; justify-content: space-between;">
                        <span id="lblBorrowerCount"></span>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Total Savings</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="display: flex; justify-content: space-between;">
                        <span id="lblSAVINGS"></span>
                        
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Open Loans</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="display: flex; justify-content: space-between;">
                        <span id="lblOpenLons"></span>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">No. of Active Borrowers</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" style="display: flex; justify-content: space-between;">
                        <span id="lblActiveCount"></span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            GetCollectionReports(function (d) {
                $('#lblLoanCount').text(d['Table'][0]['TOTAL_LOAN_COUNT']);
                $('#lblLoanAmount').text('P' + d['Table'][0]['TOTAL_LOAN_AMOUNT']);

                $('#lblLoanPaidCount').text(d['Table1'][0]['TOTAL_PAID_LOAN_COUNT']);
                $('#lblLoanPaidAmount').text('P' + d['Table1'][0]['TOTAL_PAID_LOAN_AMOUNT']);

                $('#lblDue').text(d['Table2'][0]['TOTAL_LOAN_DUE']);


                $('#lblCollected').text(d['Table3'][0]['COLLECTED_COUNT']);

                $('#lblBorrowerCount').text(d['Table4'][0]['BORROWER_COUNT']);

                $('#lblOpenLons').text(d['Table5'][0]['OPEN_LOANS']);

                $('#lblActiveCount').text(d['Table6'][0]['ACTIVE_COUNT']);

                $('#lblSAVINGS').text(d['Table7'][0]['SAVINGS']);
            });
        });

        function GetCollectionReports(callback) {
            $.ajax({
                url: "CollectionReport.aspx/GetCollectionReports",
                type: "POST",
                data: "{}",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (e) {
                    var d = JSON.parse(e.d);
                    console.log(d['Table']);
                    if (callback !== undefined) {
                        callback(d);
                    }
                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
        }
    </script>
</asp:Content>

