<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Borrowers.aspx.cs" Inherits="_Default" %>

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
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Mobile</th>
                                <th>Business</th>
                                <th>City</th>
                                <th>View</th>
                                <th>Status</th>
                                <th>Borrower</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Mathew Batista 759852634</td>
                                <td>27</td>
                                <td>Male</td>
                                <td>99598452189</td>
                                <td>Adapt Solutions</td>
                                <td>Lipa City</td>
                                <td>Loans</td>
                                <td>Active</td>
                                <td>Edit | Delete</td>
                            </tr>
                            <tr>
                                <td>Berna Ong 895263457</td>
                                <td>38</td>
                                <td>Female</td>
                                <td>99598452189</td>
                                <td>Best Services</td>
                                <td>Lipa City</td>
                                <td>Loans</td>
                                <td>Active</td>
                                <td>Edit | Delete</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Mobile</th>
                                <th>Business</th>
                                <th>City</th>
                                <th>View</th>
                                <th>Status</th>
                                <th>Borrower</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <table>
    </table>
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <%--<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>--%>
    <script src="../scripts/borrowers.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</asp:Content>

