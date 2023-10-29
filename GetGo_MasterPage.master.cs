using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Net;
using System.Net.Sockets;

namespace GetGoWeb
{
    public partial class GetGo_MasterPage : System.Web.UI.MasterPage
    {
        private static Maintenance Notif;
        public string _USER_ID;
        public string ipAddress;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Notif = new Maintenance();
                spantxtName.InnerText = Session["UserName"].ToString();
                txtName.InnerText = Session["UserName"].ToString();
                _USER_ID = Session["UserId"].ToString();

                ipAddress = "";
                IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
                ipAddress = Convert.ToString(ipHostInfo.AddressList.FirstOrDefault(address => address.AddressFamily == AddressFamily.InterNetwork));
            }
            else { Response.Redirect("./Login.aspx"); }
        }
    }
    
}
