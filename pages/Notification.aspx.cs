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
using System.Data.SqlClient;
using System.Net.Sockets;

public partial class Notification : System.Web.UI.Page
{
    private static Maintenance User;
    public string ipAddress;
    protected void Page_Load(object sender, EventArgs e)
    {
        User = new Maintenance();
        ipAddress = "";
        IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
        ipAddress = Convert.ToString(ipHostInfo.AddressList.FirstOrDefault(address => address.AddressFamily == AddressFamily.InterNetwork));
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
    public static string GetUserLoanDetailsForApproval(int _LOAN_ID)
    {
        var data = User.GetUserLoanDetailsForApproval(_LOAN_ID);
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
    public static void DeclineUser(string _USER_ID)
    {
        User.DeclineUser(_USER_ID);
    }
    
    
    [WebMethod]
    public static void UpdateBorrowerLoanStatus(string _LOAN_ID, string _STATUS)
    {
        User.UpdateBorrowerLoanStatus(_LOAN_ID, _STATUS);
    }
    
    [WebMethod]
    public static void UpdateBorrowerWithdrawalStatus(int _WITHDRAWAL_ID)
    {
        User.UpdateBorrowerWithdrawalStatus(_WITHDRAWAL_ID);
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
    [WebMethod]
    public static string GetNewAccountImages(string userid)
    {
        var commandText = @"WITH AttachmentCTE AS (
        SELECT
            a.USER_ID,
            a.USER_ID + '/' + b.DESCRIPTION AS ATTACHMENT,
            b.IMAGE_TYPE
        FROM TBL_M_USER_MASTER_ATTACHMENT AS B WITH (NOLOCK)
        LEFT JOIN TBL_M_USER_MASTER AS A WITH (NOLOCK) ON A.USER_ID = B.USER_ID
        WHERE a.USER_ID = @INPUT
    )

	SELECT  A.[USER_ID],
        P.ATTACHMENT AS PROFILE_IMAGE,
        F.ATTACHMENT AS FRONTFACE,
        B.ATTACHMENT AS BACKFACE,
        S.ATTACHMENT AS SIGNATURE_ FROM TBL_M_USER_MASTER AS A LEFT JOIN AttachmentCTE AS P ON A.USER_ID = P.USER_ID AND P.IMAGE_TYPE = 'PROFILE'
    LEFT JOIN AttachmentCTE AS F ON A.USER_ID = F.USER_ID AND F.IMAGE_TYPE = 'FRONTFACE'
    LEFT JOIN AttachmentCTE AS B ON A.USER_ID = B.USER_ID AND B.IMAGE_TYPE = 'BACKFACE'
    LEFT JOIN AttachmentCTE AS S ON A.USER_ID = S.USER_ID AND S.IMAGE_TYPE = 'SIGNATURE'
	    WHERE a.USER_ID = @INPUT OR a.USERNAME = @INPUT";

        var parameters = new SqlParameter[]
        {
              new SqlParameter("@INPUT", userid)
        };

        var maint = new DynamicAdoNet();
        return JsonConvert.SerializeObject(maint.QueryGetOrPopulate2(commandText, parameters));
    }
}