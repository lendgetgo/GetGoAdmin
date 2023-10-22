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
using System.Dynamic;
using System.Net;
using System.Net.Mail;

public partial class Notification : System.Web.UI.Page
{
    private static Maintenance User;
    protected void Page_Load(object sender, EventArgs e)
    {
        User = new Maintenance();
    }

    //[WebMethod]
    //public static string GetUSelectedserDetail(string _USER_ID)
    //{
    //    var data = User.GetUSelectedserDetail(_USER_ID);
    //    return data;
    //}

    [WebMethod]
    public static string GetUserListForApproval()
    {
        var data = User.GetUserListForApproval();
        return data;
    }

    [WebMethod]
    public static string GetUserLoanForApproval()
    {
        var data = User.GetUserLoanForApproval();
        return data;
    }
    
    [WebMethod]
    public static string GetUserWithdrawalForApproval()
    {
        var data = User.GetUserWithdrawalForApproval();
        return data;
    }

    [WebMethod]
    public static string GetUserAttachment(string _USER_ID)
    {
        var data = User.GetUserAttachment(_USER_ID);
        return data;
    }
    
    [WebMethod]
    public static void UpdateCreditLimitForApproval(string _USER_ID, string _AMOUNT)
    {
        User.UpdateCreditLimitForApproval(_USER_ID, _AMOUNT);
    }
    
    [WebMethod]
    public static void UpdateBorrowerLoanStatus(string _LOAN_ID, string _STATUS)
    {
        User.UpdateBorrowerLoanStatus(_LOAN_ID, _STATUS);
    }

    [WebMethod]
    public static string CountForApproval()
    {
        var data = User.CountForApproval();
        return data;
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
        string body = "GetGO Verification: " + Vcode;

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