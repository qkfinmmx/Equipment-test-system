<%@ WebHandler Language="C#" Class="HandAjax_YDKZT" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class HandAjax_YDKZT : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string value1str = Convert.ToString(context.Request.Params["v1"]);
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

        List<string> TDataSend = new List<string>();

        ClassYDKZTLabTest tYDKZTLab = new ClassYDKZTLabTest(value1str, checkstrlist);
        switch(tYDKZTLab.rtvInitVal()){
            case -1:
                TDataSend.Add("InputError");
                break;
            case 1:
                TDataSend.Add("Success");
                TDataSend.Add(tYDKZTLab.GetSNCode());
                TDataSend.Add(tYDKZTLab.GetCheckTime());
                TDataSend.Add(tYDKZTLab.rtTotalResult());
                foreach(string s in tYDKZTLab.rtTestData())
                    TDataSend.Add(s);
                foreach(string s in tYDKZTLab.rtResultData())
                    TDataSend.Add(s);
                break;
            default:
                TDataSend.Add("InputError");
                break;
        }

        JavaScriptSerializer jsonserial = new JavaScriptSerializer();
        string jsonstr = jsonserial.Serialize(TDataSend);
        context.Response.Write(jsonstr);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}