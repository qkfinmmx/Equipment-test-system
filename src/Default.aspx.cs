using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void ChangeCode_Click(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, ImageClickEventArgs e)
    {
        //check code
        string t_InputCode = TextBoxInputCode.Text;
        string t_SrcCode = Request.Cookies["yzmcode"].Value;

        if (String.Compare(t_InputCode, t_SrcCode) != 0){
            Session["UserID"] = null;
            TextBoxInputCode.Text = null;
            TextBoxInputPassword.Text = null;
            Response.Write("<Script language='javascript'>alert('验证码错误!');window.top.location.href='Default.aspx';</Script>"); 
            return;
        }

        //check input
        string t_InputUserName, t_InputPassword;
        t_InputUserName = TextBoxInputUserName.Text;
        t_InputPassword = TextBoxInputPassword.Text;
        if (t_InputUserName == "" || t_InputPassword == ""){
            Session["UserID"] = null;
            TextBoxInputCode.Text = null;
            TextBoxInputPassword.Text = null;
            Response.Write("<Script language='javascript'>alert('用户名或密码不能为空!');window.top.location.href='Default.aspx';</Script>"); 
            return;
        }

        //connect sqldatasource
        SqlConnection t_connect;
        string t_sqlconnectstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        try{
            t_connect = new SqlConnection(t_sqlconnectstr);
            t_connect.Open();
        }
        catch (System.Exception ex){
            throw ex;
        }

        //sql query
        string t_sqlcommand = "SELECT * FROM TableUserList WHERE UserName='$usernamevalue$'";
        t_sqlcommand = t_sqlcommand.Replace("$usernamevalue$", t_InputUserName);
        SqlCommand t_Command = new SqlCommand(t_sqlcommand, t_connect);
        SqlDataAdapter t_sda = new SqlDataAdapter();
        t_sda.SelectCommand = t_Command;
        DataSet ds = new DataSet();
        t_sda.Fill(ds, "NewTable");
        if (ds.Tables["NewTable"].Rows.Count == 0){
            Session["UserID"] = null;
            TextBoxInputCode.Text = null;
            TextBoxInputPassword.Text = null;
            Response.Write("<Script language='javascript'>alert('该用户不存在!');window.top.location.href='Default.aspx';</Script>");
            return;
        }
        string t_sda_password = ds.Tables["NewTable"].Rows[0][2].ToString();
        if (String.Compare(t_sda_password, t_InputPassword) != 0){
            Session["UserID"] = null;
            TextBoxInputCode.Text = null;
            TextBoxInputPassword.Text = null;
            Response.Write("<Script language='javascript'>alert('用户名或密码错误!');window.top.location.href='Default.aspx';</Script>");
            return;
        }
        else{
            Session["UserID"] = t_InputUserName;
            Response.Redirect("Nav-Default.aspx");
        }
    }
}