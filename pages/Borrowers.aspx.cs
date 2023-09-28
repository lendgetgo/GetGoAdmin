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
    private static Dropdown DropDown_maint;
    protected void Page_Load(object sender, EventArgs e)
    {
        Borrower = new Maintenance();
        DropDown_maint = new Dropdown();
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

    [WebMethod]
    public static string GetBorrowerLoan(string _USER_ID)
    {
        var data = Borrower.GetBorrowerLoan(_USER_ID);
        return data;
    }

    [WebMethod]
    public static string GetBorrowerLoanDetails(string _LOAN_ID)
    {
        return Borrower.GetBorrowerLoanDetails(_LOAN_ID);
    }

    [WebMethod]
    public static string GetUserDetail(string EMAIL_ADDRESS)
    {
        return Borrower.GetUserDetail(EMAIL_ADDRESS);
    }


    /// <summary>
    /// DROP DOWN LIST
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public static string GetLoanAmount()
    {
        var data = DropDown_maint.GetLoanAmount();
        return data;
    }

    [WebMethod]
    public static string GetInstallmentPlan()
    {
        var data = DropDown_maint.GetInstallmentPlan();
        return data;
    }

    [WebMethod]
    public static string GetLoanTenure(int PLAN_ID)
    {
        var data = DropDown_maint.GetLoanTenure(PLAN_ID);
        return data;
    }

}