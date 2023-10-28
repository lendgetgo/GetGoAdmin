using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetSessionValue()
    {
        if (HttpContext.Current.Session["UserId"] != null)
        {
            string userid = HttpContext.Current.Session["UserId"].ToString();

            var maint = new DynamicAdoNet();
            var parameters = new SqlParameter[] 
            {
             new SqlParameter("@USERID", userid)
            };
            var commandText = @"SELECT * FROM TBL_M_USER WHERE USER_ID = @USERID";
            var data = maint.QueryGetOrPopulate2(commandText, parameters);
            return JsonConvert.SerializeObject(data);
        }
        else
        {
            return "Session expired or not set.";
        }
    }

}