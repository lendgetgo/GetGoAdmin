using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Net;
using System.Net.Sockets;

namespace GetGoWeb
{
    public partial class Home : System.Web.UI.Page
    {
        public static string userid;
        public string ipAddress;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                userid = Session["UserId"].ToString();
                ipAddress = "";
                IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
                ipAddress = Convert.ToString(ipHostInfo.AddressList.FirstOrDefault(address => address.AddressFamily == AddressFamily.InterNetwork));
            }
        }

        [WebMethod]
        public static string GetNewAccountImages()
        {
            var commandText = @"WITH AttachmentCTE AS (
        SELECT
            a.USER_ID,
            a.USER_ID + '/' + b.DESCRIPTION AS ATTACHMENT,
            b.IMAGE_TYPE
        FROM TBL_M_USER_MASTER_ATTACHMENT AS B WITH (NOLOCK)
        LEFT JOIN TBL_M_USER AS A WITH (NOLOCK) ON A.USER_ID = B.USER_ID
        WHERE a.USER_ID = @INPUT
    )

	SELECT  A.[USER_ID],
        P.ATTACHMENT AS PROFILE_IMAGE,
        F.ATTACHMENT AS FRONTFACE,
        B.ATTACHMENT AS BACKFACE,
        S.ATTACHMENT AS SIGNATURE_ FROM TBL_M_USER AS A LEFT JOIN AttachmentCTE AS P ON A.USER_ID = P.USER_ID AND P.IMAGE_TYPE = 'PROFILE'
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
}