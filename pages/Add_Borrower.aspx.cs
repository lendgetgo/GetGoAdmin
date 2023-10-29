using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Add_Borrower : System.Web.UI.Page
{
    private static Maintenance Borrower;
    protected void Page_Load(object sender, EventArgs e)
    {
        Borrower = new Maintenance();
    }

    //[WebMethod]
    //public static string AddBorrower(Tables.USER_MASTER request, string LOAN_ID)
    //{
    //    //request.USER_ID = user;
    //    var data = Borrower.AddBorrower(request, LOAN_ID);
    //    return JsonConvert.SerializeObject(data);
    //}

    [WebMethod]
    public static string AddBorrower2(Tables.USER_MASTER request)
    {
        string query = "USP_INSERT_BORROWER_DETAILS";
        var parameters = new SqlParameter[]
        {
            //new SqlParameter("@USER_ACCESS", request.USER_ACCESS),
            new SqlParameter("@USER_ID", request.USER_ID),
            new SqlParameter("@FIRST_NAME", request.FIRST_NAME),
            new SqlParameter("@MIDDLE_NAME", request.MIDDLE_NAME),
            new SqlParameter("@LAST_NAME", request.LAST_NAME),
            new SqlParameter("@EXTENSION_NAME", request.EXTENSION_NAME),
            new SqlParameter("@AGE", request.AGE),
            new SqlParameter("@DATE_OF_BIRTH", request.DATE_OF_BIRTH),
            new SqlParameter("@SEX", request.SEX),
            new SqlParameter("@MARITAL_STATUS", request.MARITAL_STATUS),
            new SqlParameter("@SPOUSE_NAME", request.SPOUSE_NAME),
            new SqlParameter("@USERNAME", request.USERNAME),
            new SqlParameter("@PASSWORD", request.PASSWORD),
            new SqlParameter("@EMAIL_ADDRESS", request.EMAIL_ADDRESS),
            new SqlParameter("@CONTACTNO", request.CONTACTNO),
            new SqlParameter("@COMPANY_NAME", request.COMPANY_NAME),
            new SqlParameter("@REGION", request.REGION),
            new SqlParameter("@PROVINCE", request.PROVINCE),
            new SqlParameter("@CITY", request.CITY),
            new SqlParameter("@BARANGAY", request.BARANGAY),
            new SqlParameter("@STREET_NO", request.STREET_NO),
            new SqlParameter("@ZIPCODE", request.ZIPCODE),
            new SqlParameter("@BUSSINESS_NAME", request.BUSSINESS_NAME),
            new SqlParameter("@NATURE_OF_WORK", request.NATURE_OF_WORK),
            new SqlParameter("@MONTHLY_GROSS", request.MONTHLY_GROSS),
            new SqlParameter("@CHARACTER_REFERENCE", request.CHARACTER_REFERENCE),
            new SqlParameter("@CO_GUARANTOR_NAME", request.CO_GUARANTOR_NAME),
            new SqlParameter("@CO_GUARANTOR_NUMBER", request.CO_GUARANTOR_NUMBER),
            new SqlParameter("@CREATED_BY", request.CREATED_BY),
            new SqlParameter("@UPDATED_BY", request.UPDATED_BY)
        };

        var data = JsonConvert.SerializeObject(Borrower.QueryGetOrPopulate2(query, parameters));
        return data;
    }

    [WebMethod]
    public static string GetUserDetail(string EMAIL_ADDRESS)
    {
        return Borrower.GetUserDetail(EMAIL_ADDRESS);
    }
}
