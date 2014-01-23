<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nav-Default.aspx.cs" Inherits="Nav_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统主导航</title>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript" src="js/navmenu.js"></script>
    <script type="text/javascript" src="js/plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="js/subcontent.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".sublinkevent").click(function () {
                $("#maskdiv").fadeIn("slow");
                $("#contentdiv").fadeIn("slow");
            });
        });          
    </script>
    <link href="style/bodyStyle.css" rel="stylesheet" type="text/css"/>    
    <link href="style/NacStyle.css" rel="stylesheet" type="text/css" />
    <link href="style/buttonStyle.css" rel="stylesheet" type="text/css" />
    <link href="js/plugin/jquery.mCustomScrollbar.css" rel="Stylesheet" type="text/css" />
</head>

<body class="mainbody">
    <form id="form1" runat="server">
    <div class="mask" id="maskdiv" style="display: none;"></div>
    <div class="content" id="contentdiv" style="display:none;"> 
        <span id="close" style="font-family: Verdana, Arial, Helvetica, sans-serif;">x</span>
        <div style="height:8px;"></div>
        <div id="funclist" style="text-align:center;"></div>
    </div>
    <div class="Menu" id="NavMenuDIV"> 
    </div>
    <div align="center"> <img src="img/LOGO_Back.png" alt="Logo_Back" /> </div>
    <div class="divcontant">
        <div class="divsolic"></div>
        <div style="float:right">
            <asp:Label ID="Label_INF" runat="server" Text=""></asp:Label>
        </div>
        <div class="divmainheadinf" style="vertical-align:top"> 
            <img src="img/yu_32.png" alt="UserHead-32_img" /> 
            <strong style="vertical-align:top">系统主导航</strong> - 德普施科技测试系统管理域 , 选择您需要的功能 
        </div>
        <div class="detitle">
            <p><strong>德普施科技工作空间</strong></p>
        </div>
        <div style="margin-left:12px;margin-right:12px;">
  	    <div style="float:left;width:49%;border-right:1px dashed #dfdfdf;padding-top:6px;">
    	<div class="category">
        	<a href="Nav-Serve-Inf.aspx"><img src="img/ComPuter_32.png" style="float:left;margin:0 5px 10px 0;" width="32" height="32" border="0">域详细信息 </a>
            <div class="cat-list">
            <table class="bullet-table" cellpadding="0" cellspacing="0">
            <tbody>
            <tr><td>•&nbsp;</td><td><a href="Nav-Serve-Inf.aspx" class="console-bullet-link">配置域 IP 访问规则。</a></td></tr><tr><td>•&nbsp;</td><td><a href="Nav-Serve-Inf.aspx" class="console-bullet-link">创建，修改并删除域事件。</a></td></tr></tbody></table>
            </div>
        </div>
        </div>
        <div style="clear:both"></div>
    <div style="float:left;width:49%;border-right:1px dashed #dfdfdf;padding-top:6px;">
    	<div class="category">
        	<a href="Nav-User-Manage.aspx"><img src="img/UserHead-32.png" style="float:left;margin:0 5px 10px 0;" width="32" height="32" border="0">域用户管理 </a>
            <div class="cat-list">
            <table class="bullet-table" cellpadding="0" cellspacing="0">
            <tbody>
            <tr><td>•&nbsp;</td><td><a href="Nav-User-Manage.aspx" class="console-bullet-link">创建、修改与删除用户账户。</a></td></tr><tr><td>•&nbsp;</td><td><a href="Nav-User-Manage.aspx" class="console-bullet-link">创建、修改与删除存储在数据库中的用户账户。</a></td></tr></tbody></table>
            </div>
        </div>
    </div>
    <div style="clear:both"></div>
    <div style="float:left;width:49%;border-right:1px dashed #dfdfdf;padding-top:6px;">
    	<div class="category">
        	<a href="#" class="sublinkevent"><img src="img/SYSTEM_NOWTIME_32.png" style="float:left;margin:0 5px 10px 0;" width="32" height="32" border="0">测试对象选择 </a>
            <div class="cat-list">
            <table class="bullet-table" cellpadding="0" cellspacing="0">
            <tbody>
            <tr><td>•&nbsp;</td><td><a href="#" class="console-bullet-link sublinkevent">选择需要测试的对象。</a></td></tr><tr><td>•&nbsp;</td><td><a href="#" class="console-bullet-link sublinkevent">生成打印测试对象测试报表。</a></td></tr></tbody></table>
            </div>
        </div>
    </div>
  </div>
  <div style="clear:both;"></div>
  <div class="navend">
    <div style="float:left"> <img src="img/Slice_StartNav.png" alt="StartNav"/> </div>
    <div style="float:left; margin: 4px;">
      <div id="EventJsNav" class="smallbtn" style="cursor:pointer">导航</div>
    </div>
    <div style="float:right;margin: 5px;">
      <div id="EventJsQuit" class="smallbtn" style="cursor:pointer">注销</div>
    </div>
    <div style="float:right"> <img src="img/Slice_End.png" alt="End" /> </div>
  </div>
  <div style="clear:both"></div>
  <div class="border_end"></div>
  <div class="foot">
  <center>地址：武汉市东湖高新技术开发区光谷大道特1号国际企业中心 邮编：430074</center>
  <div style="height:4px"></div>
  <center>电话：027-87797097 服务热线：4006-027-990 传真：027-877797097</center>
  </div>
    </div>
    </form>
</body>
</html>
