<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="View_Loan.aspx.cs" Inherits="View_Loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                    <table id="tblLoan" class="table table-bordered table-striped">
                        <thead>
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
            </div>
        </div>
    </div>

    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../scripts/loans.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</asp:Content>

