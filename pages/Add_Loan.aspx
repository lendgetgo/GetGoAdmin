<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Add_Loan.aspx.cs" Inherits="Add_Loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Required Fields</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtLoanId" class="col-sm-3 control-label">Loan #</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtLoanId" placeholder="0">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtProduct" class="col-sm-3 control-label">Loan Product</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtProduct" placeholder="Loan Product">
                                        Note: Input reason for loan
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputID" class="col-sm-3 control-label">Loan Release Date</label>

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
                                    <label for="txtLoanAmount" class="col-sm-3 control-label">Loan Amount</label>

                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="txtLoanAmount" placeholder="0">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- REPAYMENT -->
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Repayment</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtLoanId" class="col-sm-3 control-label">Installment Plan</label>

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
                                </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtLoanTenure" class="col-sm-3 control-label">Loan Tenure</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtLoanTenure" placeholder="Loan Tenure">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- FEES -->
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Fees</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtProcessingFee" class="col-sm-3 control-label">Processing Fee (10%)</label>

                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="txtProcessingFee" placeholder="0">
                                    </div>
                                </div>
                                </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtInterestRate" class="col-sm-3 control-label">Interest Rate</label>

                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="txtInterestRate" placeholder="0">
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
    <script src="../scripts/loans.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</asp:Content>

