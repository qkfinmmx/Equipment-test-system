using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_Model_SRXSX_Lab_K_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ClassCommonFun t_Common = new ClassCommonFun();
        divrunat.InnerHtml = t_Common.GetBodyHtml("SRXSX-K-LAB-TEMPLATE.html");
        LabelTitle.Text = "双容型水箱控制箱检验";
        LabelDetail.Text = "- 双容型水箱控制箱检验数据录入、及检测报表生成";
    }
}