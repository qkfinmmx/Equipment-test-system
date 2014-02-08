using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_Model_TWYDKZ_Lab_B_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ClassCommonFun t_Common = new ClassCommonFun();
        divrunat.InnerHtml = t_Common.GetBodyHtml("TWYDKZ-ST-LAB-TEMPLATE.html");
        LabelTitle.Text = "二维运动控制实验台(步进)本体检验";
        LabelDetail.Text = "- 二维运动控制实验台(步进)本体检验数据录入、及检测报表生成";
    }
}