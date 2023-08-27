using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class _Default : System.Web.UI.Page
{
    private static Maintenance Borrower;
    protected void Page_Load(object sender, EventArgs e)
    {
        Borrower = new Maintenance();
    }

    [WebMethod]
    public static string GetBorrowerList()
    {
        var data = Borrower.GetBorrowerList();
        return data;
    }

    [WebMethod]
    public static string DeleteBorrower(string _USER_ID)
    {
        var data = Borrower.DeleteBorrower(_USER_ID);
        return data;
    }


    [WebMethod]
    public static string GetBorrowerDetails(string _USER_ID)
    {
        var data = Borrower.GetBorrowerDetails(_USER_ID);
        return data;
    }

    [WebMethod]
    public static void UpdateBorrowerDetails(Tables.USER_MASTER request)
    {
        Borrower.UpdateBorrowerDetails(request);
    }

    [WebMethod]
    public static string GetInstallmentTypeList()
    {
        var data = Borrower.GetInstallmentTypeList();
        return data;
    }

    [WebMethod]
    public static string AddBorrowerLoan(Tables.TBL_T_USER_LOAN request)
    {
        var data = Borrower.AddBorrowerLoan(request);
        return JsonConvert.SerializeObject(data);
    }

}