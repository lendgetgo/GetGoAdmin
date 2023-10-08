using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Add_Borrower : System.Web.UI.Page
{
    private static Maintenance Borrower;
    protected void Page_Load(object sender, EventArgs e)
    {
        Borrower = new Maintenance();
    }

    [WebMethod]
    public static string AddBorrower(Tables.USER_MASTER request, string LOAN_ID)
    {
        //request.USER_ID = user;
        var data = Borrower.AddBorrower(request, LOAN_ID);
        return JsonConvert.SerializeObject(data);
    }
}
