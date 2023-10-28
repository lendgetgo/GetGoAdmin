﻿using Newtonsoft.Json;
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
                    FROM [db_Getgo].[dbo].[TBL_M_USER] AS A LEFT JOIN TBL_M_USER_MASTER_ATTACHMENT AS B ON A.USER_ID = B.USER_ID WHERE A.USER_ID = @USERID";
            var data = maint.QueryGetOrPopulate2(commandText, parameters);
            return JsonConvert.SerializeObject(data);
        }
        else
        {
            return "Session expired or not set.";
        }
    }

}