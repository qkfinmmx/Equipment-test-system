using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_Model_YDKZT_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ClassCommonFun t_Common = new ClassCommonFun();
        divrunat.InnerHtml = t_Common.GetBodyHtml("YDKZT-LAB-TEMPLATE.html");
        LabelTitle.Text = "运动控制实验台检测";
        LabelDetail.Text = "- 运动控制实验台检测数据录入、及检测报表生成";
    }
}