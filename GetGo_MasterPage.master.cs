using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace GetGoWeb
{
    public partial class GetGo_MasterPage : System.Web.UI.MasterPage
    {
        private static Maintenance Notif;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Notif = new Maintenance();
                spantxtName.InnerText = Session["UserName"].ToString();
                txtName.InnerText = Session["UserName"].ToString();
            }
            else { Response.Redirect("./Login.aspx"); }
        }
    }
    
}
