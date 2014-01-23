<%@ WebHandler Language="C#" Class="HandMenuNav" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class HandMenuNav : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        List<string> NavDom = new List<string>();
        NavDom.Add(convertLink("主导航", "img/webnav_24.png", "Nav-Default.aspx"));
        NavDom.Add(convertLink("域详细信息", "img/ComPuter_24.png", "Nav-Serve-Inf.aspx"));
        NavDom.Add(convertLink("域用户管理", "img/UserHead-24.png", "Nav-User-Manage.aspx"));
        NavDom.Add(convertLinkJavascript("测试对象选择", "img/SYSTEM_NOWTIME_24.png", "$('.Menu').css('display', 'none');$('#maskdiv').fadeIn(100);$('#contentdiv').fadeIn(100);"));

        JavaScriptSerializer jsonout = new JavaScriptSerializer();
        string jsonout_str = jsonout.Serialize(NavDom);
        context.Response.Write(jsonout_str);
    }
    
    private string convertLink(string title,string imgurl,string linkurl){
        string template = "<div class=\"Menu_One\"><div class=\"Menu_Float1\"><img src=\"$IMGURL$\" /></div><a class=\"Menu_Float2\" href=\"$URL$\">$TITLE$</a></div>";
        template = template.Replace("$TITLE$", title);
        template = template.Replace("$IMGURL$", imgurl);
        template = template.Replace("$URL$", linkurl);
        return template;
    }
    
    private string convertLinkJavascript(string title,string imgurl,string javascript){
        string template = "<div class=\"Menu_One\"><div class=\"Menu_Float1\"><img src=\"$IMGURL$\" alt=\"UserManage\" /></div><div class=\"Menu_Float2\" onclick=\"$javacode$\">$TITLE$</div></div>";
        template = template.Replace("$TITLE$", title);
        template = template.Replace("$IMGURL$", imgurl);
        template = template.Replace("$javacode$", javascript);
        return template;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}