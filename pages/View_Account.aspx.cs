﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class View_Account : System.Web.UI.Page
{
    private static Maintenance Users;
    protected void Page_Load(object sender, EventArgs e)
    {
        Users = new Maintenance();
    }

    [WebMethod]
    public static string GetUserList()
    { 
        var data = Users.GetUserList();
        return data;
    }
}