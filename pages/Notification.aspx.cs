using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Notification : System.Web.UI.Page
{
    private static Maintenance User;
    protected void Page_Load(object sender, EventArgs e)
    {
        User = new Maintenance();
    }

    [WebMethod]
    public static string GetUserDetailForApproval(string _USER_ID)
    {
        var data = User.GetUserDetailForApproval(_USER_ID);
        return data;
    }

    [WebMethod]
    public static string GetUserListForApproval()
    {
        var data = User.GetUserListForApproval();
        return data;
    }

    [WebMethod]
    public static string GetUserLoanForApproval()
    {
        var data = User.GetUserLoanForApproval();
        return data;
    }
    
    [WebMethod]
    public static string GetUserWithdrawalForApproval()
    {
        var data = User.GetUserWithdrawalForApproval();
        return data;
    }

    [WebMethod]
    public static string GetUserAttachment(string _USER_ID)
    {
        var data = User.GetUserAttachment(_USER_ID);
        return data;
    }
    
    [WebMethod]
    public static void UpdateCreditLimitForApproval(string _USER_ID, string _AMOUNT)
    {
        User.UpdateCreditLimitForApproval(_USER_ID, _AMOUNT);
    }

    [WebMethod]
    public static string CountForApproval()
    {
        var data = User.CountForApproval();
        return data;
    }
}