using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_Model_PLC_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ClassCommonFun t_Common = new ClassCommonFun();
        divrunat.InnerHtml = t_Common.GetBodyHtml("PLCSYX-LAB-TEMPLATE.html");
        LabelTitle.Text = "PLC实验箱检验";
        LabelDetail.Text = "- PLC实验箱检验数据录入、及检测报表生成";
    }
}