<%@ WebHandler Language="C#" Class="HandAjax_HJJC" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class HandAjax_HJJC : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        List<string> checkstrlist = new List<string>();
        checkstrlist.Add(Convert.ToString(context.Request.Params["c1"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c2"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c3"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c4"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c5"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c6"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c7"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c8"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c9"]));
        checkstrlist.Add(Convert.ToString(context.Request.Params["c10"]));

        List<string> StrdataSend = new List<string>();
        ClassCommonJudge tJduge = new ClassCommonJudge(checkstrlist);
        StrdataSend.Add("DRHJJC" + tJduge.GetSNCode());
        StrdataSend.Add(tJduge.GetCheckTime());
        for (int i = 0; i < checkstrlist.Count; i++)
            StrdataSend.Add(tJduge.GetItemResult()[i]);
        StrdataSend.Add(tJduge.GetTotalResult());

        JavaScriptSerializer jsonserial = new JavaScriptSerializer();
        string jsonstr = jsonserial.Serialize(StrdataSend);
        context.Response.Write(jsonstr);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}