using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Vonage;
using Vonage.Request;

public partial class Login : System.Web.UI.Page
{
    private static Maintenance User_Access;
    protected void Page_Load(object sender, EventArgs e)
    {
        User_Access = new Maintenance();
    }

    [WebMethod]
    public static string GetUserAccess(string EMAIL_ADDRESS, string PASSWORD)
    {
        //if(data.Length > 0)
        //{
        //    data.Count();
        //}
        return User_Access.GetUserAccess(EMAIL_ADDRESS, PASSWORD);
    }

    private void SendSMS()
    {
        var credentials = Credentials.FromApiKeyAndSecret("9657c1eb", "OesGLMO1YuMy2Mip");

        var VonageClient = new VonageClient(credentials);
        var response = VonageClient.SmsClient.SendAnSms(new Vonage.Messaging.SendSmsRequest()
        {
            To = "639182144853",
            From = "OYO MEA",
            Text = "3091801"
        });
    }
}