using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
        var str = data.Trim('[',']');
        if (str.Length > 0)
        {
            var serialData = ((JArray)JsonConvert.DeserializeObject(data)).Values<JObject>().ToList<JObject>();
            var getstrUser = serialData[0]["FIRST_NAME"].ToString() + ' ' + serialData[0]["LAST_NAME"].ToString();
            var user_id = serialData[0]["USER_ID"].ToString();
            HttpContext.Current.Session["UserName"] = getstrUser;
            HttpContext.Current.Session["UserId"] = user_id;
        }
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

    [WebMethod]
    public static void SendSMS(string ContactNo, string AutheticationCode)
    {
        var credentials = Credentials.FromApiKeyAndSecret("9657c1eb", "OesGLMO1YuMy2Mip");

        var VonageClient = new VonageClient(credentials);
        var response = VonageClient.SmsClient.SendAnSms(new Vonage.Messaging.SendSmsRequest()
        {
            To = ContactNo,
            From = "GetGo",
            Text = AutheticationCode
        });
    }

    [WebMethod]
    public static void GetUserID(string Vcode, string input)
    {
        dynamic response = new ExpandoObject(); // Use dynamic type

        //Email configuration
        string senderEmail = "reijideveloper@gmail.com";
        string senderPassword = "kiwwngslnfrrgfsc";
        string recipientEmail = input;
        string subject = "[GetGO] Please verify your device";
        string body = "GetGO Verification: Your one-time PIN is: " + Vcode + ". Please do not share it.";

        // Create a new SmtpClient instance
        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
        smtpClient.EnableSsl = true;
        smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);

        try
        {
            // Create a new MailMessage instance
            MailMessage mailMessage = new MailMessage(senderEmail, recipientEmail, subject, body);

            // Send the email
            smtpClient.Send(mailMessage);
            var result = Vcode + "|" + input;
            response.details = result; // Assign Vcode to the response
        }
        catch (Exception ex)
        {
            response.error = ex.Message;
        }

    }
}