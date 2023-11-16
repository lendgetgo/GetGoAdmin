using System;
using System.Web.Services;
public partial class CollectionReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetCollectionReports()
    {
        var Borrower = new Maintenance();
        var data = Borrower.GetCollectionReports();
        return data;
    }
    
    [WebMethod]
    public static string GetLoanRelease()
    {
        var report = new Maintenance();
        var data = report.GetLoanRelease();
        return data;
    }
    
    [WebMethod]
    public static string GetLoanCollect()
    {
        var report = new Maintenance();
        var data = report.GetLoanCollect();
        return data;
    }
}