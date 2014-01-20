using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nav_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Write("<Script language='javascript'>window.top.location.href='Default.aspx';</Script>");
        else{
            string INF_STR = "<p>欢迎,<em>$Label$</em>登陆系统! </p>";
            INF_STR = INF_STR.Replace("$Label$", Session["UserID"].ToString());
            Label_INF.Text = INF_STR;
        }
    }
}