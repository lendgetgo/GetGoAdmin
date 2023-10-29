using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Vonage;
using Vonage.Request;

/// <summary>
/// Summary description for SharedService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SharedService : System.Web.Services.WebService {

    public static Maintenance maint;
    public SharedService () {

        
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public string GetUSelectedserDetail(string _USER_ID)
    {
        maint = new Maintenance();
        var data = maint.GetUSelectedserDetail(_USER_ID);
        return data;
    }

    [WebMethod]
    public void SendSMS(string ContactNo, string AutheticationCode)
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

}
