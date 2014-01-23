using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
///ClassCommonFun 的摘要说明
/// </summary>
public class ClassCommonFun
{
	public ClassCommonFun(){
		
	}

    public string GetBodyHtml(string htmlpath){
        string Templatepath = HttpContext.Current.Server.MapPath(htmlpath);
        Encoding Ecode = Encoding.GetEncoding("utf-8");
        StreamReader t_sr = null;
        string t_str;
        try{
            t_sr = new StreamReader(Templatepath, Ecode);
            t_str = t_sr.ReadToEnd();
        }
        catch (Exception ex){
            throw ex;
        }
        finally{
            t_sr.Close();
        }
        string startflag = "<body>";
        string endflag = "</body>";
        int t_startindex = t_str.IndexOf(startflag);
        int t_endindex = t_str.IndexOf(endflag);
        return t_str.Substring(t_startindex + startflag.Length, t_endindex - t_startindex - startflag.Length);
    }
}