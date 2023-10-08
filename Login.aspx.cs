using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Vonage;
using Vonage.Request;

public partial class Login : System.Web.UI.Page
{
    private static Maintenance User_Access;
    protected void Page_Load(object sender, EventArgs e)
    {
        User_Access = new Maintenance();

        if (!this.Page.IsPostBack)
        { 
            Session["UserID"] = "";
            Session["UserName"] = "";
        }
    }

    public class serializeData
    {
        public string strUser { get; set; }
    }

    [WebMethod]
    public static string GetUserAccess(string EMAIL_ADDRESS, string PASSWORD)
    {
        var data = User_Access.GetUserAccess(EMAIL_ADDRESS, PASSWORD);
        var serialData = ((JArray)JsonConvert.DeserializeObject(data)).Values<JObject>().ToList<JObject>();
        //var strUser = serialData.ToList<JObject>();
        var getstrUser = serialData[0]["FIRST_NAME"].ToString() + ' ' + serialData[0]["LAST_NAME"].ToString();
        HttpContext.Current.Session["UserName"] = getstrUser;
        return data;
    }

    [WebMethod]
    public static string GetContactNo(string EMAIL_ADDRESS)
    {
        return User_Access.GetContactNo(EMAIL_ADDRESS);
    }

    [WebMethod]
    public static void UpdatePassword(string _USER_ID, string _PASSWORD)
    {
        User_Access.UpdatePassword(_USER_ID, _PASSWORD);
    }

    //[WebMethod]
    //public static void SendSMS(string ContactNo, string AutheticationCode)
    //{
    //    var credentials = Credentials.FromApiKeyAndSecret("9657c1eb", "OesGLMO1YuMy2Mip");

    //    var VonageClient = new VonageClient(credentials);
    //    var response = VonageClient.SmsClient.SendAnSms(new Vonage.Messaging.SendSmsRequest()
    //    {
    //        To = ContactNo,
    //        From = "GetGo",
    //        Text = AutheticationCode
    //    });
    //}
}