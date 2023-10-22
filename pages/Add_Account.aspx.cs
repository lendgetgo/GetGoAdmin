using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
    public static string AddUserAccount2(Tables.TBL_M_USER request)
    {
        string query = "USP_INSERT_USER";
        var parameters = new SqlParameter[]
        {
        new SqlParameter("@USER_ACCESS", request.USER_ACCESS),
        new SqlParameter("@USER_ID", request.USER_ID),
        new SqlParameter("@FIRST_NAME", request.FIRST_NAME),
        new SqlParameter("@MIDDLE_NAME", request.MIDDLE_NAME),
        new SqlParameter("@LAST_NAME", request.LAST_NAME),
        new SqlParameter("@EXTENSION_NAME", request.EXTENSION_NAME),
        new SqlParameter("@AGE", request.AGE),
        new SqlParameter("@DATE_OF_BIRTH", request.DATE_OF_BIRTH),
        new SqlParameter("@SEX", request.SEX),
        new SqlParameter("@USERNAME", request.USERNAME),
        new SqlParameter("@PASSWORD", request.PASSWORD),
        new SqlParameter("@EMAIL_ADDRESS", request.EMAIL_ADDRESS),
        new SqlParameter("@CONTACTNO", request.CONTACT_NO),
        new SqlParameter("@REGION", request.REGION),
        new SqlParameter("@PROVINCE", request.PROVINCE),
        new SqlParameter("@CITY", request.CITY),
        new SqlParameter("@BARANGAY", request.BARANGAY),
        new SqlParameter("@STREET_NO", request.STREET_NO),
        new SqlParameter("@ZIPCODE", request.ZIPCODE),
        new SqlParameter("@PROFILE_PIC", "TEST"),

        };

        var data = JsonConvert.SerializeObject(User_Maint.QueryGetOrPopulate2(query, parameters));
        return data;
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