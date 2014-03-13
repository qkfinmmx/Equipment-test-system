using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_Model_HJJC_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ClassCommonFun t_Common = new ClassCommonFun();
        divrunat.InnerHtml = t_Common.GetBodyHtml("HJJC-LAB-TEMPLATE.html");
        LabelTitle.Text = "环境模块模块检验";
        LabelDetail.Text = "- 环境模块模块检验数据录入、及检测报表生成";
    }
}