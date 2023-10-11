using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;


public partial class Add_Account : System.Web.UI.Page
{
    private static Maintenance User_Maint;
    protected void Page_Load(object sender, EventArgs e)
    {
        User_Maint = new Maintenance();
    }

    [WebMethod]
    public static string AddUserAccount(Tables.TBL_M_USER request)
    {
        var data = User_Maint.AddUser(request);
        return JsonConvert.SerializeObject(data);
    }

    [WebMethod]
    public static string GetLoanID(string userid)
    {
        var maint = new Upload_Maintenance();
        var query = @"SELECT TOP 1 USER_ID FROM TBL_T_USER WHERE ID=@ID";
        var paramaters = new
        {
            ID = userid
        };
        var data = JsonConvert.SerializeObject(maint.QueryGetOrPopulateText(query, paramaters));
        return data;
    }
}