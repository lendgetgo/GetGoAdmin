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
}