using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Net;
using System.Net.Sockets;

public partial class _Default : System.Web.UI.Page
{
    public static string userid;
    private static Maintenance Borrower;
    private static Dropdown DropDown_maint;
    public string ipAddress;
    protected void Page_Load(object sender, EventArgs e)
    {
        ipAddress = "";
        IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
        ipAddress = Convert.ToString(ipHostInfo.AddressList.FirstOrDefault(address => address.AddressFamily == AddressFamily.InterNetwork));

        Borrower = new Maintenance();
        DropDown_maint = new Dropdown();
        if (Session["UserName"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            userid = Session["UserId"].ToString();
        }
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
    public static string AddBorrowerLoan2(Tables.TBL_T_USER_LOAN request)
    {
        var data = Borrower.AddBorrowerLoan(request);
        return JsonConvert.SerializeObject(data);
    }

    [WebMethod]
    public static string AddBorrowerLoan(Tables.TBL_T_USER_LOAN request)
    {
        string query = "USP_INSERT_BORROWER_LOAN";
        var parameters = new SqlParameter[]
        {

        new SqlParameter("@USER_ID", request.USER_ID),
        new SqlParameter("@PRODUCT", request.PRODUCT),
        new SqlParameter("@RELEASED_DATE", request.RELEASED_DATE),
        //new SqlParameter(e("@MATURITY_DATE", items.MATURITY_DATE);
        new SqlParameter("@AMOUNT", request.AMOUNT),
        new SqlParameter("@INSTALLMENT_ID", request.INSTALLMENT_ID),
        new SqlParameter("@TENURE", request.TENURE),
        new SqlParameter("@PROCESSING_FEE", request.PROCESSING_FEE),
        new SqlParameter("@INTEREST_RATE", request.INTEREST_RATE),

    };

        var data = JsonConvert.SerializeObject(Borrower.QueryGetOrPopulate2(query, parameters));
        return data;
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
    public static string GetBorrowerLoanPlanDetails(string _LOAN_ID)
    {
        return Borrower.GetBorrowerLoanPlanDetails(_LOAN_ID);
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

    //// 
    ///PROFILE PIC
    ///
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
            var commandText = @"SELECT
                                [USER_ACCESS]
                                ,A.[USER_ID]
                                ,[USERNAME]
                                ,[FIRST_NAME]
                                ,[MIDDLE_NAME]
                                ,[LAST_NAME]
                                ,[EXTENSION_NAME]
                                ,[EMAIL_ADDRESS]
                                ,[REGION]
                                ,[PROVINCE]
                                ,[CITY]
                                ,[PASSWORD]
                                ,[AGE]
                                ,[DATE_OF_BIRTH]
                                ,[SEX]
                                ,[CONTACT_NO]
                                ,[BARANGAY]
                                ,[ZIPCODE]
                                ,[STREET_NO]
                                ,B.USER_ID +'/' +B.DESCRIPTION AS PROFILE_PIC
                    FROM [db_Getgo].[dbo].[TBL_M_USER] AS A LEFT JOIN TBL_M_USER_MASTER_ATTACHMENT AS B ON A.USER_ID = B.USER_ID WHERE A.USER_ID = @USERID AND IMAGE_TYPE = 'PROFILE'";
            var data = maint.QueryGetOrPopulate2(commandText, parameters);
            return JsonConvert.SerializeObject(data);
        }
        else
        {
            return "Session expired or not set.";
        }
    }

    ////   
    /// repayment
    /// 
    [WebMethod]
    public static string repayment(int LOAN_ID, string AmounttoPaid)
    {
        var data = Borrower.repayment(LOAN_ID, AmounttoPaid, userid);
        return data;
    }

    [WebMethod]
    public static string fullrepayment(int LOAN_ID, string LOAN_DETAILS_ID)
    {
        var data = Borrower.fullrepayment(LOAN_ID, LOAN_DETAILS_ID);
        return data;
    }
}