using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Sockets;
using System.Web.Services;

public partial class Collateral : System.Web.UI.Page
{
    public string ipAddress;
    protected void Page_Load(object sender, EventArgs e)
    {
        ipAddress = "";
        IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
        ipAddress = Convert.ToString(ipHostInfo.AddressList.FirstOrDefault(address => address.AddressFamily == AddressFamily.InterNetwork));
    }

    [WebMethod]
    public static string DisplayCollateral()
    {
        var maint = new Maintenance();
        var data = maint.DisplayCollateral();
        return data;
    }
}