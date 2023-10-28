using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DynamicAdoNet
/// </summary>
public class DynamicAdoNet
{
    string sqlconn = ConfigurationManager.AppSettings["connection"];
    public string QueryInsertOrUpdateAdoNetText(string query, SqlParameter[] parameters)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            SqlTransaction trans = null;
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                using (SqlCommand cmd = new SqlCommand(query, conn, trans))
                {
                    cmd.CommandType = CommandType.Text;
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
    public DataTable QueryGetOrPopulate2(string query, SqlParameter[] parameters)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            DataTable dataTable = new DataTable();
            SqlTransaction transaction = null;

            try
            {
                conn.Open();
                transaction = conn.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand(query, conn, transaction))
                {
                    cmd.CommandType = CommandType.Text;
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
}