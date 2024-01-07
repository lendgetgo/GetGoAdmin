using System;
using System.Web.Services;
public partial class CollectionReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetCollectionReports(DateTime dtFrom, DateTime dtTo)
    {
        var Borrower = new Maintenance();
        var data = Borrower.GetCollectionReports(dtFrom, dtTo);
        return data;
    }
    
    [WebMethod]
    public static string GetLoanRelease(DateTime dtFrom, DateTime dtTo)
    {
        var report = new Maintenance();
        var data = report.GetLoanRelease(dtFrom, dtTo);
        return data;
    }
    
    [WebMethod]
    public static string GetLoanCollect(DateTime dtFrom, DateTime dtTo)
    {
        var report = new Maintenance();
        var data = report.GetLoanCollect(dtFrom, dtTo);
        return data;
    }
    
    [WebMethod]
    public static string GetNumberofRelease(DateTime dtFrom, DateTime dtTo)
    {
        var report = new Maintenance();
        var data = report.GetNumberofRelease(dtFrom, dtTo);
        return data;
    }
    
    [WebMethod]
    public static string GetFullyPaid(DateTime dtFrom, DateTime dtTo)
    {
        var report = new Maintenance();
        var data = report.GetFullyPaid(dtFrom, dtTo);
        return data;
    }
    
    [WebMethod]
    public static string GetActiveBygender()
    {
        var report = new Maintenance();
        var data = report.GetActiveBygender();
        return data;
    }

    [WebMethod]
    public static string GetAdvancePayment()
    {
        var report = new Maintenance();
        var data = report.GetAdvancePayment();
        return data;
    }

    [WebMethod]
    public static string GetLatePayment()
    {
        var report = new Maintenance();
        var data = report.GetLatePayment();
        return data;
    }
}