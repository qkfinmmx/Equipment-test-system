<%@ WebHandler Language="C#" Class="HandAjax_Print" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Text;
using System.IO;
using System.Net;

/// <summary>
/// JSON数据结构
/// {
///     count:24
///     0:输入是否合法 (InputScuess InputError)
///     1:SNCode
///     2:检测时间
///     3-10:测试结果
///     11-20:结论
///     21:总体结论
///     22:用户名
/// }
/// </summary>
/// 
public class HandAjax_Print : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string jsondata = Convert.ToString(context.Request.Params["GAjaxData"]);
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<string> objList = serializer.Deserialize<List<string>>(jsondata);
        string TemplatPath = System.Web.HttpContext.Current.Server.MapPath("ZZ-LAB-TEMPLATE.html");
        Encoding Ecode = Encoding.GetEncoding("utf-8");
        StreamReader t_sr = null;
        StreamWriter t_sw = null;
        string t_str;
        try{
            t_sr = new StreamReader(TemplatPath, Ecode);
            t_str = t_sr.ReadToEnd();
        }
        catch (Exception ex){
            throw ex;
        }
        finally{
            t_sr.Close();
        }

        t_str = t_str.Replace("$SNLabel$", objList[1]);
        t_str = t_str.Replace("$总体结论$", objList[21]);
        t_str = t_str.Replace("$检验员$", objList[22]);
        t_str = t_str.Replace("$检验时间$", objList[2]);
        for (int i = 0; i < 8;i++ ){
            t_str = t_str.Replace("$" + (i + 1).ToString() + "测试结果$", objList[i + 3]);
        }
        for (int i = 0; i < 10;i++ ){
            t_str = t_str.Replace("$" + (i + 1).ToString() + "结论$", objList[i + 11]);
        }

        try
        {
            string t_fileName = objList[1] + ".html";
            t_sw = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("Report-html\\") + t_fileName, false, Ecode);
            t_sw.Write(t_str);
            t_sw.Flush();
        }
        catch (System.Exception ex)
        {
            throw ex;
        }
        finally
        {
            t_sw.Close();
        }

        List<string> listJson = new List<string>();
        listJson.Add("Success");
        listJson.Add("Report-html\\" + objList[1] + ".html");
        JavaScriptSerializer jsonserial_out = new JavaScriptSerializer();
        string str_jsonserial_out = jsonserial_out.Serialize(listJson);
        context.Response.Write(str_jsonserial_out);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}