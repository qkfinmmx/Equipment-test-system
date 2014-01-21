<%@ WebHandler Language="C#" Class="HandAjax_ZZLabTest_m" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;

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
/// }
/// </summary>

public class HandAjax_ZZLabTest_m : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string value1str = Convert.ToString(context.Request.Params["v1"]);
        string value2str = Convert.ToString(context.Request.Params["v2"]);
        string value3str = Convert.ToString(context.Request.Params["v3"]);
        string value4str = Convert.ToString(context.Request.Params["v4"]);
        string value5str = Convert.ToString(context.Request.Params["v5"]);
        string value6str = Convert.ToString(context.Request.Params["v6"]);
        string value7str = Convert.ToString(context.Request.Params["v7"]);
        string value8str = Convert.ToString(context.Request.Params["v8"]);

        string check1str = Convert.ToString(context.Request.Params["c1"]);
        string check2str = Convert.ToString(context.Request.Params["c2"]);

        List<string> StrdataSend = new List<string>();
        
        ClassZZLabTest_c ZZTest = new ClassZZLabTest_c(value1str, value2str, value3str, value4str,
            value5str, value6str, value7str, value8str,
            check1str, check2str);
        
        switch(ZZTest.GetInitRtv()){
            case -1:{//-1:输入不合法
                StrdataSend.Add("InputError");
                break;
            }
            case 0:{//0:不合格
                StrdataSend.Add("InputScuess");
                StrdataSend.Add(ZZTest.GetSNCode());
                StrdataSend.Add(ZZTest.GetCheckTime());
                foreach (string s in ZZTest.GetTestResult()){
                    StrdataSend.Add(s);
                }
                foreach(string s in ZZTest.GetResult()){
                    StrdataSend.Add(s);
                }
                StrdataSend.Add(ZZTest.GetTotalResult());
                break;
            }
            case 1:{//1:合格
                StrdataSend.Add("InputScuess");
                StrdataSend.Add(ZZTest.GetSNCode());
                StrdataSend.Add(ZZTest.GetCheckTime());
                foreach (string s in ZZTest.GetTestResult()){
                    StrdataSend.Add(s);
                }
                foreach (string s in ZZTest.GetResult()){
                    StrdataSend.Add(s);
                }
                StrdataSend.Add(ZZTest.GetTotalResult());
                break;
            }
            default: { StrdataSend.Add("InputError"); break; }
        }
        
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