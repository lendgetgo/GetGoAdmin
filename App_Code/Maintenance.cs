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


    public List<Tables.USER_MASTER> AddBorrower(Tables.USER_MASTER items)
    {
        List<Tables.USER_MASTER> list = new List<Tables.USER_MASTER>();
        try
        {
            using (var connection = Maintenance.Create())
            {
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText = "USP_INSERT_BORROWER_DETAILS";
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
                    command.Parameters.AddWithValue("@CREATED_BY", items.CREATED_BY);
                    command.Parameters.AddWithValue("@UPDATED_BY", items.UPDATED_BY);
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
}