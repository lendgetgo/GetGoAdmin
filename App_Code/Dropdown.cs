using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

/// <summary>
/// Summary description for Dropdown
/// </summary>
public class Dropdown
{
    private string strConn;
    SqlConnection conn;
    private static string conString = ConfigurationManager.AppSettings["connection"];
    public static SqlConnection Create()
    {
        return new SqlConnection(conString);
    }
    public Dropdown()
    {
        this.strConn = System.Configuration.ConfigurationManager.AppSettings["connection"];
        conn = new SqlConnection(strConn);
    }

    public string GetLoanAmount()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_LOAN_AMOUNT", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetInstallmentPlan()
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_INSTALLMENT_PLAN", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }

    public string GetLoanTenure(int PLAN_ID)
    {
        DataTable dt = new DataTable();
        using (var con = new SqlConnection(strConn))
        {
            using (var cmd = new SqlCommand("USP_GET_LOAN_TENURE", con) { CommandType = CommandType.StoredProcedure })
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PLAN_ID", PLAN_ID);
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
            }
        }
        return JsonConvert.SerializeObject(dt);
    }
    
}