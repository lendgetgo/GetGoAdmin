using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//using Microsoft.ApplicationBlocks.Data;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Maintenance
/// </summary>
public class Maintenance
{
    private string strConn;
    SqlConnection conn;
    private static string conString = ConfigurationManager.AppSettings["connection"];
    public static SqlConnection Create()
    {
        return new SqlConnection(conString);
    }
    public Maintenance()
    {
        this.strConn = System.Configuration.ConfigurationManager.AppSettings["connection"];
        conn = new SqlConnection(strConn);
    }

    public string GetUserAccess(string _EMAILADDRESS, string _PASSWORD)
    {
        DataTable dt = new DataTable();
        try
        {
            using (var con = new SqlConnection(strConn))
            {   
                using (var cmd = new SqlCommand("USP_GET_USER_ACCESS", con) { CommandType = CommandType.StoredProcedure })
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EMAIL_ADDRESS", _EMAILADDRESS);
                    cmd.Parameters.AddWithValue("@PASSWORD", _PASSWORD);
                    using (var da = new SqlDataAdapter(cmd))
                        da.Fill(dt);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetContactNo(string _EMAILADDRESS)
    {
        DataTable dt = new DataTable();
        try
        {
            using (var con = new SqlConnection(strConn))
            {
                using (var cmd = new SqlCommand("USP_GET_CONTACT_NUMBER", con) { CommandType = CommandType.StoredProcedure })
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EMAIL_ADDRESS", _EMAILADDRESS);
                    using (var da = new SqlDataAdapter(cmd))
                        da.Fill(dt);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetUserDetail(string _EMAILADDRESS)
    {
        DataTable dt = new DataTable();
        try
        {
            using (var con = new SqlConnection(strConn))
            {
                using (var cmd = new SqlCommand("USP_GET_CONTACT_NUMBER", con) { CommandType = CommandType.StoredProcedure })
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EMAIL_ADDRESS", _EMAILADDRESS);
                    using (var da = new SqlDataAdapter(cmd))
                        da.Fill(dt);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return JsonConvert.SerializeObject(dt);
    }


    public string GetBorrowerList()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_BORROWERS_LIST", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string DeleteBorrower(string _USER_ID)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_DELETE_BORROWER", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@USER_ID", _USER_ID);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string DeleteUser(string _USER_ID)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("UPDATE [TBL_M_USER] SET ACTIVEFLAG = 0 WHERE USER_ID = @USER_ID", con) {  })
            {
                cmd.Parameters.AddWithValue("@USER_ID", _USER_ID);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetBorrowerDetails(string _USER_ID)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_BORROWER_DETAILS", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@USER_ID", _USER_ID);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetInstallmentTypeList()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_INSTALLMENT_TYPE_LIST", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetLoanList()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_LOAN_LIST", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetBorrowerLoan(string _USER_ID)
    {
        DataTable dt = new DataTable();
        try
        {
            using (var con = new SqlConnection(strConn))
            {
                using (var cmd = new SqlCommand("USP_GET_BORROWER_LOAN", con) { CommandType = CommandType.StoredProcedure })
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USER_ID", _USER_ID);
                    using (var da = new SqlDataAdapter(cmd))
                        da.Fill(dt);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetUSelectedserDetail(string _USER_ID)
    {
        DataTable dt = new DataTable();
        try
        {
            using (var con = new SqlConnection(strConn))
            {
                using (var cmd = new SqlCommand("USP_GET_BORROWER_DETAILS", con) { CommandType = CommandType.StoredProcedure })
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USER_ID", _USER_ID);
                    using (var da = new SqlDataAdapter(cmd))
                        da.Fill(dt);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetBorrowerLoanDetails(string _LOAN_ID)
    {
        DataTable dt = new DataTable();
        try
        {
            using (var con = new SqlConnection(strConn))
            {
                using (var cmd = new SqlCommand("USP_GET_BORROWER_LOAN_DETAILS", con) { CommandType = CommandType.StoredProcedure })
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@LOAN_ID", _LOAN_ID);
                    using (var da = new SqlDataAdapter(cmd))
                        da.Fill(dt);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetBorrowerLoanPlanDetails(string _LOAN_ID)
    {
        DataTable dt = new DataTable();
        try
        {
            using (var con = new SqlConnection(strConn))
            {
                using (var cmd = new SqlCommand("USP_GET_BORROWER_LOAN_PLAN_DETAILS", con) { CommandType = CommandType.StoredProcedure })
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@LOAN_ID", _LOAN_ID);
                    using (var da = new SqlDataAdapter(cmd))
                        da.Fill(dt);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return JsonConvert.SerializeObject(dt);
    }

    

    public string GetUserList()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_USER_LIST", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetUserListForApproval()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_USER_MASTER_FOR_APPROVAL", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetUserLoanForApproval()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_USER_MASTER_LOAN_FOR_APPROVAL", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetUserLoanDetailsForApproval(int _LOAN_ID)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_USER_MASTER_LOAN_DETAILS", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LOAN_ID", _LOAN_ID);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
            con.Dispose();
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetUserWithdrawalForApproval()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_USER_MASTER_WITHDRAWAL_FOR_APPROVAL", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetUserAttachment(string _USER_ID)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_USER_MASTER_ATTACHMENT", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@USER_ID", _USER_ID);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string CountForApproval()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_COUNT_FOR_APPROVAL", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public List<Tables.TBL_T_USER_LOAN> AddBorrowerLoan(Tables.TBL_T_USER_LOAN items)
    {
        List<Tables.TBL_T_USER_LOAN> list = new List<Tables.TBL_T_USER_LOAN>();
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_INSERT_BORROWER_LOAN";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@USER_ID", items.USER_ID);
                    command.Parameters.AddWithValue("@PRODUCT", items.PRODUCT);
                    command.Parameters.AddWithValue("@RELEASED_DATE", items.RELEASED_DATE);
                    //command.Parameters.AddWithValue("@MATURITY_DATE", items.MATURITY_DATE);
                    command.Parameters.AddWithValue("@AMOUNT", items.AMOUNT);
                    command.Parameters.AddWithValue("@INSTALLMENT_ID", items.INSTALLMENT_ID);
                    command.Parameters.AddWithValue("@TENURE", items.TENURE);
                    command.Parameters.AddWithValue("@PROCESSING_FEE", items.PROCESSING_FEE);
                    command.Parameters.AddWithValue("@INTEREST_RATE", items.INTEREST_RATE);
                    command.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
        return list;
    }


    public List<Tables.USER_MASTER> AddBorrower(Tables.USER_MASTER request, object returnParameter)
    {
        List<Tables.USER_MASTER> list = new List<Tables.USER_MASTER>();
        try
        {
            string returnValue;
            using (var connection = Maintenance.Create())
            {
                //using (var command = connection.CreateCommand())
                using (SqlCommand command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_INSERT_BORROWER_DETAILS";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@USER_ID", request.USER_ID);
                    command.Parameters.AddWithValue("@FIRST_NAME", request.FIRST_NAME);
                    command.Parameters.AddWithValue("@MIDDLE_NAME", request.MIDDLE_NAME);
                    command.Parameters.AddWithValue("@LAST_NAME", request.LAST_NAME);
                    command.Parameters.AddWithValue("@EXTENSION_NAME", request.EXTENSION_NAME);
                    command.Parameters.AddWithValue("@AGE", request.AGE);
                    command.Parameters.AddWithValue("@DATE_OF_BIRTH", request.DATE_OF_BIRTH);
                    command.Parameters.AddWithValue("@SEX", request.SEX);
                    command.Parameters.AddWithValue("@MARITAL_STATUS", request.MARITAL_STATUS);
                    command.Parameters.AddWithValue("@SPOUSE_NAME", request.SPOUSE_NAME);
                    command.Parameters.AddWithValue("@USERNAME", request.USERNAME);
                    command.Parameters.AddWithValue("@PASSWORD", request.PASSWORD);
                    command.Parameters.AddWithValue("@EMAIL_ADDRESS", request.EMAIL_ADDRESS);
                    command.Parameters.AddWithValue("@CONTACTNO", request.CONTACTNO);
                    command.Parameters.AddWithValue("@COMPANY_NAME", request.COMPANY_NAME);
                    command.Parameters.AddWithValue("@REGION", request.REGION);
                    command.Parameters.AddWithValue("@PROVINCE", request.PROVINCE);
                    command.Parameters.AddWithValue("@CITY", request.CITY);
                    command.Parameters.AddWithValue("@BARANGAY", request.BARANGAY);
                    command.Parameters.AddWithValue("@STREET_NO", request.STREET_NO);
                    command.Parameters.AddWithValue("@ZIPCODE", request.ZIPCODE);
                    command.Parameters.AddWithValue("@BUSSINESS_NAME", request.BUSSINESS_NAME);
                    command.Parameters.AddWithValue("@NATURE_OF_WORK", request.NATURE_OF_WORK);
                    command.Parameters.AddWithValue("@MONTHLY_GROSS", request.MONTHLY_GROSS);
                    command.Parameters.AddWithValue("@CHARACTER_REFERENCE", request.CHARACTER_REFERENCE);
                    command.Parameters.AddWithValue("@CO_GUARANTOR_NAME", request.CO_GUARANTOR_NAME);
                    command.Parameters.AddWithValue("@CO_GUARANTOR_NUMBER", request.CO_GUARANTOR_NUMBER);
                    command.Parameters.AddWithValue("@CREATED_BY", request.CREATED_BY);
                    command.Parameters.AddWithValue("@UPDATED_BY", request.UPDATED_BY);
                    command.ExecuteNonQuery();
                    returnValue = (string)returnParameter.ToString();
                }
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
        return list;
    }
    int indentity = 0;
    public int AddUser(Tables.TBL_M_USER request)
    {
        //List<int> list = new List<int>();
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_INSERT_USER";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@USER_ACCESS", request.USER_ACCESS);
                    command.Parameters.AddWithValue("@USER_ID", request.USER_ID);
                    command.Parameters.AddWithValue("@FIRST_NAME", request.FIRST_NAME);
                    command.Parameters.AddWithValue("@MIDDLE_NAME", request.MIDDLE_NAME);
                    command.Parameters.AddWithValue("@LAST_NAME", request.LAST_NAME);
                    command.Parameters.AddWithValue("@EXTENSION_NAME", request.EXTENSION_NAME);
                    command.Parameters.AddWithValue("@AGE", request.AGE);
                    command.Parameters.AddWithValue("@DATE_OF_BIRTH", request.DATE_OF_BIRTH);
                    command.Parameters.AddWithValue("@SEX", request.SEX);
                    command.Parameters.AddWithValue("@USERNAME", request.USERNAME);
                    command.Parameters.AddWithValue("@PASSWORD", request.PASSWORD);
                    command.Parameters.AddWithValue("@EMAIL_ADDRESS", request.EMAIL_ADDRESS);
                    command.Parameters.AddWithValue("@CONTACTNO", request.CONTACT_NO);
                    command.Parameters.AddWithValue("@REGION", request.REGION);
                    command.Parameters.AddWithValue("@PROVINCE", request.PROVINCE);
                    command.Parameters.AddWithValue("@CITY", request.CITY);
                    command.Parameters.AddWithValue("@BARANGAY", request.BARANGAY);
                    command.Parameters.AddWithValue("@STREET_NO", request.STREET_NO);
                    command.Parameters.AddWithValue("@ZIPCODE", request.ZIPCODE);
                    command.Parameters.AddWithValue("@PROFILE_PIC", "TEST");
                    command.ExecuteNonQuery();

                    command.CommandType = CommandType.Text;
                    command.Parameters.Clear();
                    command.CommandText = "SELECT @@IDENTITY";
                    indentity = Convert.ToInt32(command.ExecuteScalar());

                    connection.Close();
                }
                connection.Close();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
        return indentity;
    }
    #region HonyoPyonot
    public DataTable QueryGetOrPopulate2(string query, SqlParameter[] parameters)
    {
        using (var conn = Maintenance.Create())
        {
            DataTable dataTable = new DataTable();
            SqlTransaction transaction = null;

            try
            {
                conn.Open();
                transaction = conn.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand(query, conn, transaction))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddRange(parameters);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(dataTable);
                    }
                }
                transaction.Commit();
            }
            catch (SqlException ex)
            {
                if (transaction != null) transaction.Rollback();
               
                throw ex;
            }
            catch (Exception ex)
            {
                if (transaction != null) transaction.Rollback();
            
                throw ex;
            }

            return dataTable;
        }
    }
    public string QueryInsertOrUpdateAdoNet(string query, SqlParameter[] parameters)
    {
        using (var conn = Maintenance.Create())
        {
            SqlTransaction trans = null;
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                using (SqlCommand cmd = new SqlCommand(query, conn, trans))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddRange(parameters);

                    cmd.ExecuteNonQuery();
                }

                trans.Commit();
                return "Success";
            }
            catch (SqlException ex)
            {
                if (trans != null) trans.Rollback();
       
                return ex.Message;
            }
            catch (Exception ex)
            {
                if (trans != null) trans.Rollback();
 
                return ex.Message;
            }
        }
    }
    #endregion

    public void UpdateBorrowerDetails(Tables.USER_MASTER items)
    {
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_UPDATE_BORROWER_DETAILS";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@USER_ID", items.USER_ID);
                    command.Parameters.AddWithValue("@FIRST_NAME", items.FIRST_NAME);
                    command.Parameters.AddWithValue("@MIDDLE_NAME", items.MIDDLE_NAME);
                    command.Parameters.AddWithValue("@LAST_NAME", items.LAST_NAME);
                    command.Parameters.AddWithValue("@EXTENSION_NAME", items.EXTENSION_NAME);
                    command.Parameters.AddWithValue("@AGE", items.AGE);
                    command.Parameters.AddWithValue("@DATE_OF_BIRTH", items.DATE_OF_BIRTH);
                    command.Parameters.AddWithValue("@SEX", items.SEX);
                    command.Parameters.AddWithValue("@MARITAL_STATUS", items.MARITAL_STATUS);
                    command.Parameters.AddWithValue("@SPOUSE_NAME", items.SPOUSE_NAME);
                    command.Parameters.AddWithValue("@USERNAME", items.USERNAME);
                    command.Parameters.AddWithValue("@PASSWORD", items.PASSWORD);
                    command.Parameters.AddWithValue("@EMAIL_ADDRESS", items.EMAIL_ADDRESS);
                    command.Parameters.AddWithValue("@CONTACTNO", items.CONTACTNO);
                    command.Parameters.AddWithValue("@COMPANY_NAME", items.COMPANY_NAME);
                    command.Parameters.AddWithValue("@REGION", items.REGION);
                    command.Parameters.AddWithValue("@PROVINCE", items.PROVINCE);
                    command.Parameters.AddWithValue("@CITY", items.CITY);
                    command.Parameters.AddWithValue("@BARANGAY", items.BARANGAY);
                    command.Parameters.AddWithValue("@STREET_NO", items.STREET_NO);
                    command.Parameters.AddWithValue("@ZIPCODE", items.ZIPCODE);
                    command.Parameters.AddWithValue("@BUSSINESS_NAME", items.BUSSINESS_NAME);
                    command.Parameters.AddWithValue("@NATURE_OF_WORK", items.NATURE_OF_WORK);
                    command.Parameters.AddWithValue("@MONTHLY_GROSS", items.MONTHLY_GROSS);
                    command.Parameters.AddWithValue("@CHARACTER_REFERENCE", items.CHARACTER_REFERENCE);
                    command.Parameters.AddWithValue("@CO_GUARANTOR_NAME", items.CO_GUARANTOR_NAME);
                    command.Parameters.AddWithValue("@CO_GUARANTOR_NUMBER", items.CO_GUARANTOR_NUMBER);
                    command.Parameters.AddWithValue("@UPDATED_BY", items.UPDATED_BY);
                    command.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public string UpdateUserAccount(Tables.TBL_M_USER request)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("UPDATE [TBL_M_USER] SET " +
                "USER_ACCESS=@USER_ACCESS, " +
                "FIRST_NAME=@FIRST_NAME, " +
                "MIDDLE_NAME=@MIDDLE_NAME,  " +
                "LAST_NAME=@LAST_NAME," +
                "EXTENSION_NAME=@EXTENSION_NAME," +
                "AGE=@AGE," +
                "DATE_OF_BIRTH=@DATE_OF_BIRTH," +
                "SEX=@SEX," +
                "USERNAME=@USERNAME," +
                "PASSWORD=@PASSWORD," +
                "EMAIL_ADDRESS=@EMAIL_ADDRESS," +
                "CONTACT_NO=@CONTACTNO," +
                "REGION=@REGION," +
                "PROVINCE=@PROVINCE," +
                "CITY=@CITY," +
                "BARANGAY=@BARANGAY," +
                "STREET_NO=@STREET_NO," +
                "ZIPCODE=@ZIPCODE," +
                "PROFILE_PIC=@PROFILE_PIC WHERE USER_ID = @USER_ID", con) { })
            {
                cmd.Parameters.AddWithValue("@USER_ID", request.USER_ID);
                cmd.Parameters.AddWithValue("@USER_ACCESS", request.USER_ACCESS);
                cmd.Parameters.AddWithValue("@FIRST_NAME", request.FIRST_NAME);
                cmd.Parameters.AddWithValue("@MIDDLE_NAME", request.MIDDLE_NAME);
                cmd.Parameters.AddWithValue("@LAST_NAME", request.LAST_NAME);
                cmd.Parameters.AddWithValue("@EXTENSION_NAME", request.EXTENSION_NAME);
                cmd.Parameters.AddWithValue("@AGE", request.AGE);
                cmd.Parameters.AddWithValue("@DATE_OF_BIRTH", request.DATE_OF_BIRTH);
                cmd.Parameters.AddWithValue("@SEX", request.SEX);
                cmd.Parameters.AddWithValue("@USERNAME", request.USERNAME);
                cmd.Parameters.AddWithValue("@PASSWORD", request.PASSWORD);
                cmd.Parameters.AddWithValue("@EMAIL_ADDRESS", request.EMAIL_ADDRESS);
                cmd.Parameters.AddWithValue("@CONTACTNO", request.CONTACT_NO);
                cmd.Parameters.AddWithValue("@REGION", request.REGION);
                cmd.Parameters.AddWithValue("@PROVINCE", request.PROVINCE);
                cmd.Parameters.AddWithValue("@CITY", request.CITY);
                cmd.Parameters.AddWithValue("@BARANGAY", request.BARANGAY);
                cmd.Parameters.AddWithValue("@STREET_NO", request.STREET_NO);
                cmd.Parameters.AddWithValue("@ZIPCODE", request.ZIPCODE);
                cmd.Parameters.AddWithValue("@PROFILE_PIC", request.USER_ID);
                HttpContext.Current.Session["UserName"] = request.FIRST_NAME + ' ' + request.LAST_NAME;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string repayment(int LOAN_ID, string AmounttoPaid, string userid)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("DECLARE @loanAmount Decimal(18,2) SET @loanAmount = (SELECT AMOUNT FROM [TBL_T_BORROWER_LOAN_PLAN_DETAILS] WHERE LOAN_DETAILS_ID = @LOAN_ID)" +
                "DECLARE @AmountPaid Decimal(18,2) SET @AmountPaid = (SELECT AMOUNT_PAID FROM [TBL_T_BORROWER_LOAN_PLAN_DETAILS] WHERE LOAN_DETAILS_ID = @LOAN_ID)" +
                " UPDATE [TBL_T_BORROWER_LOAN_PLAN_DETAILS] SET COLLECTED_BY = @USER_ID" +
                ", COLLECTED_DATE = GETDATE()" +
                ", AMOUNT_PAID = @AmounttoPaid + @AmountPaid" +
                ", BALANCE = (CASE WHEN CAST(@AmounttoPaid AS DECIMAL(18,2)) >= @loanAmount THEN 0 ELSE @loanAmount-(@AmounttoPaid + @AmountPaid) END)" +
                //", AMOUNT_PAID = (SELECT AMOUNT FROM [db_Getgo].[dbo].[TBL_T_BORROWER_LOAN_PLAN_DETAILS] WHERE LOAN_DETAILS_ID = @LOAN_ID)" +
                ", IS_COMPLETE = (CASE WHEN (CAST(@AmounttoPaid AS DECIMAL(18,2)) + @AmountPaid) >= @loanAmount THEN 1 ELSE 0 END) WHERE LOAN_DETAILS_ID = @LOAN_ID", con) { })
            {
                cmd.Parameters.AddWithValue("@LOAN_ID", LOAN_ID);
                cmd.Parameters.AddWithValue("@AmounttoPaid", AmounttoPaid);
                cmd.Parameters.AddWithValue("@USER_ID", userid);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string fullrepayment(int LOAN_ID, string LOAN_DETAILS_ID)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand(" DECLARE @LOANCOUNT INT " +
                 " SET @LOANCOUNT = (SELECT COUNT(LOAN_ID) FROM [TBL_T_BORROWER_LOAN_PLAN_DETAILS] WHERE ISNULL(IS_COMPLETE,'False') = 'True' AND LOAN_ID = @LOAN_ID)" +
                 " IF (@LOANCOUNT = 0)" +
                 " BEGIN" +
                 "   UPDATE [TBL_T_USER_LOAN] SET [STATUS] = 'FULLY PAID' WHERE [LOAN_ID] = @LOAN_ID" +
                 " END", con)
            { })
            {
                cmd.Parameters.AddWithValue("@LOAN_ID", LOAN_ID);
                cmd.Parameters.AddWithValue("@LOAN_DETAILS_ID", LOAN_DETAILS_ID);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public void UpdatePassword(string USER_ID, string PASSWORD)
    {
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_UPDATE_PASSWORD";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@USER_ID", USER_ID);
                    command.Parameters.AddWithValue("@PASSWORD", PASSWORD);
                    command.ExecuteNonQuery();
                }
            }
        }
        catch (Exception)
        {

            throw;
        }
    }

    public void UpdateCreditLimitForApproval(string USER_ID, string AMOUNT)
    {
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_UPDATE_CREDIT_LIMIT_FOR_APPROVAL";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@USER_ID", USER_ID);
                    command.Parameters.AddWithValue("@AMOUNT", AMOUNT);
                    command.ExecuteNonQuery();
                }
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    
    public void UpdateBorrowerLoanStatus(string LOAN_ID, string STATUS)
    {
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_UPDATE_BORROWER_LOAN_STATUS";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@LOAN_ID", LOAN_ID);
                    command.Parameters.AddWithValue("@STATUS", STATUS);
                    command.ExecuteNonQuery();
                }
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    
    public void UpdateBorrowerWithdrawalStatus(int WITHDRAWAL_ID)
    {
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_UPDATE_BORROWER_WITHDRAWAL_STATUS";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@WITHDRAWAL_ID", WITHDRAWAL_ID);
                    command.ExecuteNonQuery();
                }
            }
        }
        catch (Exception)
        {

            throw;
        }
    }


    ////
    ///ADDRESS
    ///

    public string GetRegion()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT [REGION_ID],[CODE],[REGION_DESCRIPTION],[REGION_CODE] FROM [TBL_M_REGION]", con) { })
            {
                //cmd.Parameters.AddWithValue("@USER_ID", userid);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetProvince(string REGION_CODE)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT [PROVINCE_ID],[CODE],[PROVINCE_DESCRIPTION],[REGION_CODE],[PROVINCE_CODE] FROM [TBL_M_PROVINCE] WHERE [REGION_CODE] = @REGION_CODE", con) { })
            {
                cmd.Parameters.AddWithValue("@REGION_CODE", REGION_CODE);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetCity(string PROVINCE_CODE)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT [CITY_ID],[CODE],[CITY_DESCRIPTION],[REGION_CODE],[PROVINCE_CODE],[CITY_CODE],[ZIPCODE] FROM [TBL_M_CITY] WHERE [PROVINCE_CODE] = @PROVINCE_CODE", con) { })
            {
                cmd.Parameters.AddWithValue("@PROVINCE_CODE", PROVINCE_CODE);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string DisplayCollateral()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT A.[ID], C.[USER_ID] + '/' + [DESCRIPTION] AS IMAGE_LINK, FIRST_NAME + ' ' + MIDDLE_NAME + ' ' + LAST_NAME AS COMPLETENAME,B.[LOAN_ID],[DESCRIPTION],[TYPE],A.[CREATED_DATE] " +
                     " FROM [TBL_T_USER_LOAN_ATTACHMENT] A" +
                     " LEFT JOIN [TBL_T_USER_LOAN] B" +
                     " ON B.LOAN_ID = A.LOAN_ID" +
                     " LEFT JOIN [TBL_M_USER_MASTER] C" +
                     " ON C.USER_ID = B.USER_ID" +
                     " ORDER BY B.LOAN_ID", con) { })
            {        
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetCollectionReports()
    {
        DataSet dt = new DataSet();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT TOP 1 (COUNT(AMOUNT) OVER (PARTITION BY BRANCH)) AS TOTAL_LOAN_COUNT " +
                    ", FORMAT(SUM(CAST(AMOUNT AS DECIMAL(18, 2))) OVER(PARTITION BY BRANCH), '#,0.00') AS TOTAL_LOAN_AMOUNT " +
                    "FROM [TBL_T_USER_LOAN] " +
                    "WHERE[STATUS] IN('APPROVED', 'FULLY PAID') AND BRANCH = 1 " +
                    
                    "SELECT TOP 1(COUNT(AMOUNT) OVER(PARTITION BY BRANCH)) AS TOTAL_PAID_LOAN_COUNT " +
                    ", FORMAT(SUM(CAST(AMOUNT AS DECIMAL(18, 2))) OVER(PARTITION BY BRANCH), '#,0.00') AS TOTAL_PAID_LOAN_AMOUNT " +
                    "FROM [TBL_T_USER_LOAN] " +
                    "WHERE[STATUS] = 'FULLY PAID' AND BRANCH = 1 " +
                    
                    "SELECT COUNT(LOAN_ID) AS TOTAL_LOAN_DUE " +
                    "FROM [TBL_T_BORROWER_LOAN_PLAN_DETAILS] " +
                    "WHERE DUE_DATE <= GETDATE() AND ISNULL(IS_COMPLETE, 0) = 0" +

                    "SELECT COUNT (LOAN_ID) AS COLLECTED_COUNT " +
                    "FROM [TBL_T_BORROWER_LOAN_PLAN_DETAILS] "+
                    "WHERE COLLECTED_DATE IS NOT NULL " +

                    "SELECT COUNT([USER_ID]) AS BORROWER_COUNT FROM [TBL_M_USER_MASTER] " +

                    "SELECT COUNT(LOAN_ID) AS OPEN_LOANS FROM [TBL_T_USER_LOAN] WHERE [STATUS] = 'APPROVED' " +

                    "SELECT COUNT([USER_ID]) AS ACTIVE_COUNT FROM [TBL_M_USER_MASTER] WHERE ISNULL(ACTIVE_FLAG,1) = 1" +

                    "SELECT FORMAT(SUM(CAST(A.[AMOUNT] AS DECIMAL(18,2)) - CAST(C.AMOUNT AS DECIMAL(18,2))), '#,0.00') AS SAVINGS " +
                    "FROM [TBL_T_USER_LOAN] A " +
                    "LEFT JOIN [TBL_M_LOAN_AMOUNT] C " +
                    "ON C.INTEREST = A.INTEREST_RATE", con) { })
            {
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetLoanRelease()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT CONCAT(DATEPART(MONTH, [RELEASED_DATE]), ' ' , DATENAME(MONTH, DATEADD(MONTH, DATEPART(MONTH, [RELEASED_DATE]), -1))) AS [RELEASED_MONTH] " +
                    ", SUM(CAST([AMOUNT] AS DECIMAL(18, 2))) AS LOAN_AMOUNT " +
                    "FROM [TBL_T_USER_LOAN] " +
                    "WHERE STATUS IN('APPROVED', 'FULLY PAID') " +
                    "GROUP BY DATEPART(MONTH, [RELEASED_DATE])", con)
            { })
            {
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetLoanCollect()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand(" SELECT CONCAT(DATEPART(MONTH, COLLECTED_DATE), ' ' , DATENAME(MONTH, DATEADD(MONTH, DATEPART(MONTH, COLLECTED_DATE), -1))) AS COLLECTED_DATE  " +
                    ",SUM(CAST([AMOUNT_PAID] AS DECIMAL(18,2))) AS [AMOUNT_PAID] " +
                    "FROM [TBL_T_BORROWER_LOAN_PLAN_DETAILS] " +
                    "WHERE COLLECTED_DATE IS NOT NULL " +
                    "GROUP BY DATEPART(MONTH, COLLECTED_DATE)", con)
            { })
            {
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetNumberofRelease()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT DATENAME(MONTH, DATEADD(MONTH, DATEPART(MONTH, [RELEASED_DATE]), -1)) AS [RELEASED_MONTH] " +
                            ", COUNT(CAST([AMOUNT] AS DECIMAL(18, 2))) AS LOAN_AMOUNT " +
                        "FROM [TBL_T_USER_LOAN] " +
                        "WHERE STATUS IN('APPROVED') " +
                        "GROUP BY DATEPART(MONTH, [RELEASED_DATE])", con)
            { })
            {
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetFullyPaid()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT DATENAME(MONTH, DATEADD(MONTH, DATEPART(MONTH, [RELEASED_DATE]), -1)) AS [RELEASED_MONTH] " +
                ", COUNT(CAST([AMOUNT] AS DECIMAL(18, 2))) AS LOAN_AMOUNT " +
                "FROM [TBL_T_USER_LOAN] " +
                "WHERE STATUS IN('FULLY PAID') " +
                "GROUP BY DATEPART(MONTH, [RELEASED_DATE])", con)
            { })
            {
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
    public string GetActiveBygender()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("SELECT COUNT(SEX) AS GENDER FROM [TBL_M_USER] " +
                            "WHERE SEX IS NOT NULL GROUP BY SEX ORDER BY SEX", con)
            { })
            {
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
}