<%@ WebHandler Language="C#" Class="HandPrintCommon" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Text;
using System.IO;

/// <summary>
/// JSON数据结构
/// {
///     0:SNCode
///     1:检测时间
///     2-(Count-4):结论
///     Count-3:总体结论
///     Count-2:检测员
///     Count-1:模板路径
/// }
/// </summary>

public class HandPrintCommon : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string jsondata = Convert.ToString(context.Request.Params["GAjaxData"]);
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<string> objList = serializer.Deserialize<List<string>>(jsondata);
        string TemplatPath = System.Web.HttpContext.Current.Server.MapPath(objList[objList.Count - 1]);
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
        
        t_str = t_str.Replace("$SNLabel$", objList[0]);
        t_str = t_str.Replace("$检验时间$", "检验时间:"+objList[1]);
        t_str = t_str.Replace("$总体结论$", objList[objList.Count-3]);
        t_str = t_str.Replace("$检验员$", objList[objList.Count - 2]);
        for (int i = 2; i <= objList.Count - 4;i++ ){
            t_str = t_str.Replace("$" + (i - 1).ToString() + "结论$", objList[i]);
        }
        
        try
        {
            string t_fileName = objList[0] + ".html";
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
        
        List<string> ColumnName , value;
        ColumnName = new List<string>();
        value = new List<string>();
        ColumnName.Add("SN序列号");
        ColumnName.Add("检验时间");
        ColumnName.Add("总体结论");
        ColumnName.Add("检验员");
        for(int i = 2;i <= objList.Count-4;i++){
            ColumnName.Add("结论" + (i - 1).ToString());
        }
        value.Add(objList[0]);
        value.Add(objList[1]);
        value.Add(objList[objList.Count - 3]);
        value.Add(objList[objList.Count - 2]);
        for(int i = 2;i <= objList.Count-4;i++){
            value.Add(objList[i]);
        }
        //response DB
        ClassDB tCDB = new ClassDB();
        tCDB.SetTestData(objList[0], ColumnName, value);
        
        //response html
        List<string> listJson = new List<string>();
        listJson.Add("Success");
        listJson.Add("Report-html\\" + objList[0] + ".html");
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