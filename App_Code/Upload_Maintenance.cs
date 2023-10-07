using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

using Dapper;
using System.Configuration;
/// <summary>
/// Summary description for Upload_Maintenance
/// </summary>
public class Upload_Maintenance
{
    private static string conString = ConfigurationManager.AppSettings["connection"];
    public string QueryInsertOrUpdateText(string query, object parameters = null)
    {
        SqlTransaction trans = null;
        try
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();
                trans = conn.BeginTransaction();
                conn.Execute(query, parameters, trans);

                trans.Commit();
                //var response = new { message = "success" };
                return "success";
            }
        }
        catch (SqlException ex)
        {
            trans.Rollback();

            return ex.Message;

        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
}
