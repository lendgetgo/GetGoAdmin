﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class View_Borrowers_Loan : System.Web.UI.Page
{
    private static Maintenance Loan;
    protected void Page_Load(object sender, EventArgs e)
    {
        Loan = new Maintenance();
    }

}