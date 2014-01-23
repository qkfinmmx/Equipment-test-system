using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_Model_YWYD_Lab_K_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ClassCommonFun t_Common = new ClassCommonFun();
        divrunat.InnerHtml = t_Common.GetBodyHtml("YWYDK-LAB-TEMPLATE.html");
        LabelTitle.Text = "一维运动控制实验台控制箱检测";
        LabelDetail.Text = "- 一维运动控制实验台控制箱检测数据录入、及检测报表生成";
    }
}