<%@ WebHandler Language="C#" Class="HandFuncTest" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class HandFuncTest : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        List<string> DOMList = new List<string>();
        DOMList.Add(ConvertDOM("转子实验台-转子本体检测", "Default-Model-ZZ-Lab-Test.aspx"));
        DOMList.Add(ConvertDOM("转子实验台-转子调速箱检测", "Default-Model-ZZ-Lab-T-Test.aspx"));
        DOMList.Add(ConvertDOM("转子实验台-转子模块检测", "Default-Model-ZZ-Lab-M-Test.aspx"));
        DOMList.Add(ConvertDOM("一维运动控制实验台-本体检测", "Default-Model-YWYD-Lab-S-Test.aspx"));
        DOMList.Add(ConvertDOM("一维运动控制实验台-本体控制箱检测", "Default-Model-YWYD-Lab-K-Test.aspx"));
        DOMList.Add(ConvertDOM("便携式数据采集仪检测", "Default-Model-DAQ-Test.aspx"));
        DOMList.Add(ConvertDOM("传感器实验箱检测", "Default-Model-CGQSYX-Test.aspx"));
        DOMList.Add(ConvertDOM("测控电路实验箱检测", "Default-Model-CKDLSYX-Test.aspx"));

        JavaScriptSerializer jsonserial = new JavaScriptSerializer();
        string jsonstr = jsonserial.Serialize(DOMList);
        context.Response.Write(jsonstr);
    }
    
    private string ConvertDOM(string title,string url){
        string template = "<a href=\"$url$\" class=\"button blue\" style=\"margin-left:auto;margin-right:auto;margin-top:8px;font-family:'微软雅黑';width:80%;\">$title$</a>";
        template = template.Replace("$url$", url);
        template = template.Replace("$title$", title);
        return template;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}