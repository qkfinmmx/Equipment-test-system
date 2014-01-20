<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>德普施科技设备检测入库系统登录</title>
    <link href="style/Default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:10px;background-color:#60605E;">
    <form id="form1" runat="server">
        <center><img src="img/LOGO_Back.png" alt="LOGO_Back" /></center>
        <div class="clear"> 
        </div>
        <div class="MediaDiv">
            <div class="DialogDiv">
                <div class="DialogTitle"> 请输入您的用户名及密码进行登录 </div>
                <div class="DIalogDivFram">
                    <div>
                        <div class="DialogPjName"> 用户名 </div>
                        <div class="DialogPjInputBox">
                            <asp:TextBox ID="TextBoxInputUserName" runat="server" CssClass="inputUsername"></asp:TextBox>
                        </div>
                    </div>
            <div class="clear"> </div>
            <div>
                <div class="DialogPjName"> 密码</div>
                <div class="DialogPjInputBox">
                    <asp:TextBox ID="TextBoxInputPassword" runat="server" CssClass="inputPassword" 
                        TextMode="Password"></asp:TextBox>
                </div>
            </div>
      <div class="clear"> </div>
      <div>
        <div class="DialogPjName"> 验证码 </div>
        <div class="codeVerfy">
        <asp:TextBox ID="TextBoxInputCode" runat="server" CssClass="inputCode" />
        <asp:ImageButton ID="yzm" runat="server" ImageUrl="VerifyCode.aspx" /> 
        <div class="clear"></div>
        <div style="height:30px; font-family: 微软雅黑; font-size: 14px;">
            <asp:LinkButton ID="ChangeCode" runat="server" Text="看不清楚？换一个验证码" 
                OnClick="ChangeCode_Click" CssClass="codeRefresh" Font-Size="10pt" 
                ForeColor="#597AB3" /> 
        </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="buttonDiv">
      <center>
      <asp:ImageButton ID="LoginButton" runat="server" 
              ImageUrl="~/img/button.png" onclick="LoginButton_Click" />
      </center>
      </div>
    </div>
    <div style="padding-top:60px;padding-left:25px;">
        <img src="img/Slice_Ge.png" alt="Slice_Ge" />
       <div> <p> 
           <span style="margin-left:85px; color: rgb(118, 128, 135); font-family: Simsun; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;  display: inline !important; float: none;">
        地址：武汉市东湖高新技术开发区光谷大道特1号国际企业中心 邮编：430074</span>
        <br 
            style="color: rgb(118, 128, 135); font-family: Simsun; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; " />
        <span style="margin-left:105px;color: rgb(118, 128, 135); font-family: Simsun; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none;">
        电话：027-87797097 服务热线：4006-027-990 传真：027-877797097</span></p></div>
    </div>
  </div>
</div>
</form>
</body>
</html>
