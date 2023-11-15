<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Collateral.aspx.cs" Inherits="Collateral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" />
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
                    <table id="tblCollateral" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Loan ID</th>
                                <th>Collateral Link</th>
                                <th>Type</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            var _ipaddress = "<%= this.ipAddress %>";
            //var baseUrl = "http://" + _ipaddress + "/Getgo/Images/";
            var baseUrl = "http://lendgetgo-001-site1.atempurl.com/UploadedFiles/";

            DisplayCollateral(function (d) {
                if ($("#tblCollateral").hasClass("dataTable")) {
                    $("#tblCollateral").DataTable().destroy();
                }
                $('#tblCollateral').DataTable({
                    data: d,
                    columns: [
                        { "data": "COMPLETENAME" },
                        { "data": "LOAN_ID" },
                        {
                            "data": "IMAGE_LINK",
                            render: function (data, type, row) {
                                return '<a href="' + baseUrl + data + '" target="blank">' + data + '</a>';
                            } 
                        },
                        { "data": "TYPE" }
                    ]
                });
            });
        });

        function DisplayCollateral(callback) {
            $.ajax({
                url: "Collateral.aspx/DisplayCollateral",
                type: "POST",
                data: "{}",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (e) {
                    var d = JSON.parse(e.d);
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

