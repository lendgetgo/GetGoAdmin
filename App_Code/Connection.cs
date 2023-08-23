using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

class Connection
{
    private string ConnectionString = "";
    /// <summary>
    /// Use for query with return single data table
    /// </summary>
    /// <param name="conn">Connection</param>
    /// <param name="sql">Query</param>
    /// <param name="dt">DataTable that handles the return value</param>
    public void ExecuteReader(SqlConnection conn, string sql, DataTable dt)
    {
        try
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            //FileStreamer.AddText(string.Format("{{Type:\"QueryError\",Message:\"{1}\",Connection:\"{0}\",Query:\"{2}\"}}", conn.ConnectionString, ex.Message, sql));
            throw ex;
        }
    }
    /// <summary>
    /// Use for Query with return multiple data consolidated in dataset
    /// </summary>
    /// <param name="conn">Connection</param>
    /// <param name="sql">Query</param>
    /// <param name="ds">DataSet that handles the return value</param>
    public void ExecuteReader(SqlConnection conn, string sql, DataSet ds)
    {
        try
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(ds);
            conn.Close();
        }
        catch (Exception ex)
        {
            //FileStreamer.AddText(string.Format("{{Type:\"QueryError\",Message:\"{1}\",Connection:\"{0}\",Query:\"{2}\"}}", conn.ConnectionString, ex.Message, sql));
            throw ex;
        }
    }
    /// <summary>
    /// For Executing non return value query. Commonly used for executing Insert/Update/Delete
    /// </summary>
    /// <param name="conn">Connection</param>
    /// <param name="sql">Query</param>
    public void ExecuteNonQuery(SqlConnection conn, string sql)
    {
        try
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            //FileStreamer.AddText(string.Format("{{Type:\"QueryError\",Message:\"{1}\",Connection:\"{0}\",Query:\"{2}\"}}", conn.ConnectionString, ex.Message, sql));
            throw ex;
        }
    }
    /// <summary>
    /// To Execute the stored procedure with return value as data table
    /// </summary>
    /// <param name="conn">Connection</param>
    /// <param name="dt">DataTable that handles the return value</param>
    /// <param name="sp">StoredProcedure name</param>
    /// <param name="param">Parameters to be send in procedure</param>
    public void ExecuteSP(SqlConnection conn,
        DataTable dt,
        string sp,
        Dictionary<string, string> param = null)
    {
        try
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand(sp, conn);
            if (param != null)
            {
                foreach (var item in param)
                {
                    cmd.Parameters.AddWithValue(item.Key, item.Value);
                }
            }
            cmd.CommandType = CommandType.StoredProcedure;
            da.SelectCommand = cmd;
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            ///FileStreamer.AddText(string.Format("{{Type:\"QueryError\",Message:\"{1}\",Connection:\"{0}\",Query:\"{2}\"}}", conn.ConnectionString, ex.Message, sp));
            throw ex;
        }
    }
    /// <summary>
    /// To Execute the stored procedure with return value as dataset
    /// </summary>
    /// <param name="conn">Connection</param>
    /// <param name="ds">DataSet that handles the return value</param>
    /// <param name="sp">StoredProcedure name</param>
    /// <param name="param">Parameters to be send in procedure</param>
    public void ExecuteSP(SqlConnection conn,
        DataSet ds,
        string sp,
        Dictionary<string, string> param = null)
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sp, conn);
            if (param != null)
            {
                foreach (var item in param)
                {
                    cmd.Parameters.AddWithValue(item.Key, item.Value);
                }
            }
            cmd.CommandType = CommandType.StoredProcedure;
            da.SelectCommand = cmd;
            da.Fill(ds);
            conn.Close();
        }
        catch (Exception ex)
        {
            //FileStreamer.AddText(string.Format("{{Type:\"QueryError\",Message:\"{1}\",Connection:\"{0}\",Query:\"{2}\"}}", conn.ConnectionString, ex.Message, sp));
            throw ex;
        }
    }
    /// <summary>
    /// To setup the connection settings
    /// </summary>
    /// <param name="ConnectionString"></param>
    /// <returns></returns>
    public SqlConnection SetConnectionSettings(string ConnectionString)
    {
        SqlConnection conn = new SqlConnection(ConnectionString);
        this.ConnectionString = ConnectionString;
        return conn;
    }
    /// <summary>
    /// To setup the connection settings. It will capture the connection based on the settings in the application
    /// </summary>
    /// <returns>It will return the connection settings for the database</returns>
    public SqlConnection SetConnectionSettings()
    {
        SqlConnection conn = new SqlConnection(ConfigProp.ConnectionString);
        return conn;
    }
    /// <summary>
    /// To test the connection of database
    /// </summary>
    /// <param name="ConnectionString"></param>
    /// <returns>True if it can connect</returns>
    public Boolean CanConnect(string ConnectionString)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            conn.Close();
            return true;
        }
        catch (Exception ex)
        {
            //FileStreamer.AddText(string.Format("{{Type:\"ConnectionError\",Message:\"{0}\",ConnectionString:\"{1}\"}}",ex.Message, ConnectionString));
            throw ex;
        }
    }
    /// <summary>
    /// Create Update Query
    /// </summary>
    /// <param name="TableName">Tablename to update</param>
    /// <param name="Param">Fields to be update</param>
    /// <param name="PK">Primary key and its value</param>
    /// <returns>Query for update</returns>
    public string CreateUpdateQuery(string TableName, Dictionary<string, string> Param, KeyValuePair<string, string> PK)
    {
        List<string> UnEditable = new List<string>();
        List<string> NotEmptySave = new List<string>();
        UnEditable.Add("JobOrderID");
        UnEditable.Add("JobOrderNo");
        UnEditable.Add("JobOrderStatus");
        UnEditable.Add("RequestedDate");
        UnEditable.Add("RequestedBy");
        UnEditable.Add("FacilitiesJobOrderType");
        UnEditable.Add("EstCostID");
        UnEditable.Add("FacilitiesBookValue");
        UnEditable.Add("FacilitiesCheckedBy");
        UnEditable.Add("FacilitiesCategory");
        UnEditable.Add("FacilitiesRemarks");
        UnEditable.Add("FacilitiesTargetAssessDate");
        UnEditable.Add("FacilitiesTargetCompleteDate");
        UnEditable.Add("FacilitiesAnalyzedBy");
        UnEditable.Add("FacilitiesAnalyzedDate");
        UnEditable.Add("RFQFinalContractorID");
        UnEditable.Add("RFQTotalAmountUSD");
        NotEmptySave.Add("LocationLayoutAttach");
        NotEmptySave.Add("ActualPhotoAttach");
        NotEmptySave.Add("ExpenseSurveyAttach");
        string sql = string.Format("UPDATE [dbo].[{0}] SET", TableName);
        List<string> fields = new List<string>();
        foreach (var item in Param)
        {
            if (item.Key != PK.Key && !UnEditable.Contains(item.Key))
            {
                string val = item.Value.ToString().Trim() == "" ? "null" : string.Format("'{0}'", item.Value);
                if (NotEmptySave.Contains(item.Key))
                {
                    if (val != "null")
                    {
                        fields.Add(string.Format("{0} = {1}", item.Key, val));
                    }
                }
                else
                {
                    if (IsDate(item.Value))
                    {
                        val = string.Format("'{0}'", DateTime.Parse(item.Value).ToString("yyyy-MM-dd"));
                    }
                    fields.Add(string.Format("{0} = {1}", item.Key, val));
                }
            }
        }
        sql = string.Format("{0} {1} WHERE {2} = '{3}'", sql, string.Join(",", fields), PK.Key, PK.Value);
        return sql;
    }
    public string CreateInsertQuery(string TableName, Dictionary<string, string> Param, string PKName)
    {
        List<string> cols = new List<string>();
        List<string> vals = new List<string>();
        foreach (var item in Param)
        {
            if (item.Key != PKName)
            {
                cols.Add(item.Key);
                if (IsDate(item.Value) && item.Key != "RequestedDate")
                {
                    vals.Add(string.Format("'{0}'", DateTime.Parse(item.Value).ToString("yyyy-MM-dd")));
                }
                else
                {
                    vals.Add(item.Value.ToString().Trim() == "" ? "null" : string.Format("'{0}'", item.Value));
                }
            }
        }
        return string.Format("INSERT INTO [dbo].[{0}]({1}) VALUES ({2})", TableName, string.Join(",", cols), string.Join(",", vals));
    }
    public static bool IsDate(Object obj)
    {
        string strDate = obj.ToString();
        try
        {
            DateTime dt = DateTime.Parse(strDate);
            return true;
        }
        catch
        {
            return false;
        }
    }
}

