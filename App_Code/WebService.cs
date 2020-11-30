using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

[WebService(Namespace = "https://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService :  System.Web.Services.WebService {

    public WebService() {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string hello() {
        return "Hello World";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Info> GetInfo()
    {
        List<Info> result = new List<Info>();
        DataTable dtInfo = new DataTable();
        dtInfo = db_SQLServer.ExecuteReaderSP("PRO_GET_CONTACT").Tables[0];
        foreach (DataRow item in dtInfo.AsEnumerable())
        {
            result.Add(new Info()
            {
                phoneNo = Convert.ToString(item["phoneNo"]),
                email = Convert.ToString(item["email"]),                
            });
        }
        return result;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Client> GetClientInfo()
    {
        List<Client> result = new List<Client>();
        DataTable dtInfo = new DataTable();
        dtInfo = db_SQLServer.ExecuteReaderSP("PRO_GET_MESSAGES").Tables[0];
        foreach (DataRow item in dtInfo.AsEnumerable())
        {
            result.Add(new Client()
            {
                clientID = Convert.ToInt32(item["ID"]),
                clientName = Convert.ToString(item["CLIENT_NAME"]),
                clientEmail = Convert.ToString(item["CLIENT_EMAIL"]),
                clientPhone = Convert.ToString(item["CLIENT_PHONE"]),
                clientMessage = Convert.ToString(item["CLIENT_MESSAGE"]),
                REG_DATE = Convert.ToString(item["MESSAGE_DATE"]),
            });
        }
        return result;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] SendMessage(string clName, string clEmail, string clPhone, string clMessage)
    {
        string[] result = new string[] { };
        result = db_SQLServer.ExecuteSPWithParameters("PRO_GET_CLIENT_INFO",
            new string[] { "@in_CLIENT_NAME", "@in_CLIENT_EMAIL", "@in_CLIENT_PHONE", "@in_CLIENT_MESSAGE" },
            new string[] { clName, clEmail, clPhone, clMessage },
            new string[] { "@out_MESSAGE" }
            );
        return result;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] DeleteMsg(int msgID)
    {
        string[] result = new string[] { };
        result = db_SQLServer.ExecuteSPWithParameters("PRO_DELETE_MESSAGE",
            new string[] { "@in_ID" },
            new string[] { Convert.ToString(msgID) },
            new string[] { "@out_MESSAGE" }
            );
        return result;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] UpdateInfo(string phoneNo, string email)
    {
        string[] result = new string[] { };
        result = db_SQLServer.ExecuteSPWithParameters("PRO_UPDATE_INFO ",
            new string[] { "@in_PHONE", "@in_EMAIL" },
            new object[] { phoneNo, email },
            new string[] { "@out_MESSAGE" }
            );
        return result;
    }

}
