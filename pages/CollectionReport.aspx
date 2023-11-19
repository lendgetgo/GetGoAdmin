<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="CollectionReport.aspx.cs" Inherits="CollectionReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../dist/css/AdminLTE.css" rel="stylesheet" />
    <link href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="../bower_components/morris.js/morris.css" rel="stylesheet" />
    <link href="../bower_components/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
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

    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label>Date range:</label>

                <div class="input-group">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" class="form-control pull-right" id="reservation">
                </div>
                <!-- /.input group -->
            </div>
            <input type='button' id='btn' class="btn btn-success" value='Print Report' onclick='printtag("DivIdToPrint");'>
        </div>
    </div>
    
    <section class="content" id="DivIdToPrint">
        <label><h3>Collection Reports</h3></label>
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

            <div class="col-md-6">
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

            <div class="col-md-6">
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

            <div class="col-md-6">
                <!-- LINE CHART -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title"><b style="color: red">Loan Release</b> - Monthly</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body chart-responsive">
                        <div class="chart" id="Release-chart" style="height: 300px;"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>

            <div class="col-md-6">
                <!-- LINE CHART -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title"><b style="color: red">Loan Collections</b> - Monthly</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body chart-responsive">
                        <div class="chart" id="Collections-chart" style="height: 300px;"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>

            <div class="col-md-6">
                <!-- Bar chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Number of Loans Release - Monthly</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="NumberRelease-chart" style="height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
            </div>

            <div class="col-md-6">
                <!-- Bar chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Number of Fully Paid Loans - Monthly</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="FullyPaid-chart" style="height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
            </div>

            <div class="col-md-6">
                <!-- Donut chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Active Male/Female Borrowers % (All Time)</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="donut-chart" style="height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
            </div>
        </div>
    </section>

    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/raphael/raphael.min.js"></script>
    <script src="../bower_components/morris.js/morris.min.js"></script>

    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../bower_components/fastclick/lib/fastclick.js"></script>
    <script src="../dist/js/adminlte.min.js"></script>

    <script src="../bower_components/moment/min/moment.min.js"></script>
    <script src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <%--<script src="../dist/js/demo.js"></script>
    <script src="../bower_components/Flot/jquery.flot.js"></script>
    <script src="../bower_components/Flot/jquery.flot.resize.js"></script>
    <script src="../bower_components/Flot/jquery.flot.pie.js"></script>
    <script src="../bower_components/Flot/jquery.flot.categories.js"></script>--%>
    <script>
        $(document).ready(function () {
            $('#reservation').daterangepicker();
            $('#reservation').on('change', function () {
                var dt = $('#reservation').val();
                var dtFrom = dt.split('-')[0].trim();
                var dtTo = dt.split('-')[1].trim();

                GetCollectionReports(dtFrom, dtTo, function (d) {
                    $('#lblLoanCount').text(d['Table'][0]['TOTAL_LOAN_COUNT'] ? d['Table'][0]['TOTAL_LOAN_COUNT'] : 0);
                    $('#lblLoanAmount').text('P' + d['Table'][0]['TOTAL_LOAN_AMOUNT'] ? 'P' + d['Table'][0]['TOTAL_LOAN_AMOUNT'] : 0);

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
            GetLoanRelease(function (d) {
                var line = new Morris.Line({
                    element: 'Release-chart',
                    resize: true,
                    data: d,
                    xkey: 'RELEASED_MONTH',
                    ykeys: ['LOAN_AMOUNT'],
                    labels: ['LOAN_AMOUNT'],
                    lineColors: ['#3c8dbc'],
                    parseTime: false,
                    hideHover: 'auto'
                });
            });

            GetLoanCollect(function (d) {
                var line = new Morris.Line({
                    element: 'Collections-chart',
                    resize: true,
                    data: d,
                    xkey: 'COLLECTED_DATE',
                    ykeys: ['AMOUNT_PAID'],
                    labels: ['AMOUNT COLLECT'],
                    lineColors: ['#3c8dbc'],
                    parseTime: false,
                    hideHover: 'auto'
                });
            });

            GetNumberofRelease(function (d) {
                var NumberRelease_data = {
                    //data: [['January', 10], ['February', 8], ['March', 4], ['April', 13], ['May', 17], ['June', 9]],
                    data: d,
                    color: '#3c8dbc'
                }
                $.plot('#NumberRelease-chart', [NumberRelease_data], {
                    grid: {
                        borderWidth: 1,
                        borderColor: '#f3f3f3',
                        tickColor: '#f3f3f3'
                    },
                    series: {
                        bars: {
                            show: true,
                            barWidth: 0.5,
                            align: 'center'
                        }
                    },
                    xaxis: {
                        mode: 'categories',
                        tickLength: 0
                    }
                })
            });

            GetFullyPaid(function (d) {
                var FullyPaid_data = {
                    // data: [['January', 10], ['February', 8], ['March', 4], ['April', 13], ['May', 17], ['June', 9]],
                    data: d,
                    color: '#3c8dbc'
                }
                $.plot('#FullyPaid-chart', [FullyPaid_data], {
                    grid: {
                        borderWidth: 1,
                        borderColor: '#f3f3f3',
                        tickColor: '#f3f3f3'
                    },
                    series: {
                        bars: {
                            show: true,
                            barWidth: 0.5,
                            align: 'center'
                        }
                    },
                    xaxis: {
                        mode: 'categories',
                        tickLength: 0
                    }
                })
            });


            GetActiveBygender(function (d) {
                console.log(d);
                var donutData = [
                    { label: 'Female', data: 10, color: '#3c8dbc' },
                ]
                $.plot('#donut-chart', donutData, {
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            innerRadius: 0.5,
                            label: {
                                show: true,
                                radius: 2 / 3,
                                formatter: labelFormatter,
                                threshold: 0.1
                            }

                        }
                    },
                    legend: {
                        show: false
                    }
                })
            });
            /*
             * END DONUT CHART
             */

            /*
             * Custom Label formatter
             * ----------------------
             */
            function labelFormatter(label, series) {
                return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
                    + label
                    + '<br>'
                    + Math.round(series.percent) + '%</div>'
            }
        });

        function GetCollectionReports(dtFrom, dtTo, callback) {
            $.ajax({
                url: "CollectionReport.aspx/GetCollectionReports",
                type: "POST",
                data: JSON.stringify({ dtFrom: dtFrom, dtTo: dtTo }),
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

        function GetLoanRelease(callback) {
            $.ajax({
                url: "CollectionReport.aspx/GetLoanRelease",
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

        function GetLoanCollect(callback) {
            $.ajax({
                url: "CollectionReport.aspx/GetLoanCollect",
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

        function GetNumberofRelease(callback) {
            $.ajax({
                url: "CollectionReport.aspx/GetNumberofRelease",
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

        function GetFullyPaid(callback) {
            $.ajax({
                url: "CollectionReport.aspx/GetFullyPaid",
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

        function GetActiveBygender(callback) {
            $.ajax({
                url: "CollectionReport.aspx/GetActiveBygender",
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

        function printtag(tagid) {
            var hashid = "#" + tagid;
            var tagname = $(hashid).prop("tagName").toLowerCase();
            var attributes = "";
            var attrs = document.getElementById(tagid).attributes;
            $.each(attrs, function (i, elem) {
                attributes += " " + elem.name + " ='" + elem.value + "' ";
            })
            var divToPrint = $(hashid).html();
            var head = "<html><head>" + $("head").html() + "</head>";
            var allcontent = head + "<body  onload='window.print()' >" + "<" + tagname + attributes + ">" + divToPrint + "</" + tagname + ">" + "</body></html>";
            var newWin = window.open('', 'Print-Window');
            newWin.document.open();
            newWin.document.write(allcontent);
            newWin.document.close();
        }
    </script>
</asp:Content>

