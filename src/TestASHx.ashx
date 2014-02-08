<%@ WebHandler Language="C#" Class="TestASHx" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class TestASHx : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        /*
        ClassDB tDB = new ClassDB();
        DataTable dt = tDB.GetAllUserForm();
        string str = "";
        for (int i = 0; i < dt.Rows.Count; i++)
            str+=dt.Rows[i][0].ToString();
        context.Response.Write(str);*/
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}