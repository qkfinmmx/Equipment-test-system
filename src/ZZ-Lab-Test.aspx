﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZZ-Lab-Test.aspx.cs" Inherits="ZZ_Lab_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>转子本体检测</title>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript" src="js/Ajax_ZZLabTest.js"></script>
    <script type="text/javascript" src="js/subcontent.js"></script>
    <script type="text/javascript" src="js/navmenu.js"></script>
    <link href="style/bodyStyle.css" rel="stylesheet" type="text/css"/>    
    <link href="style/NacStyle.css" rel="stylesheet" type="text/css" />
    <link href="style/buttonStyle.css" rel="stylesheet" type="text/css" />
</head>
<body class="mainbody" oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <form id="form1" runat="server">
    <div class="mask" id="maskdiv" style="display: none;"></div>
    <div class="content" id="contentdiv" style="display:none;"> 
        <span id="close" style="font-family: Verdana, Arial, Helvetica, sans-serif;">x</span>
        <div id="funclist" style="text-align:center">
        </div>
    </div>
    <div class="Menu" id="NavMenuDIV"> 
    </div>
    <div align="center">
        <img src="img/LOGO_Back.png" alt="Logo_Back" />
    </div>
    <div class="divcontant">
        <div class="divsolic">
        </div>
        <div style="float: right">
            <p>
                欢迎,<em><span id="username">Label</span></em>登陆系统!
            </p>
        </div>
        <div class="divmainheadinf" style="vertical-align: top">
            <img src="img/wheel_32.png" alt="UserHead-32_img" />
            <strong style="vertical-align: top">转子本体检测</strong> - 转子本体检测数据录入、及检测报表生成
        </div>
        <div style="clear: both">
        </div>
        <div class="tabsConstant">
            <div class="divcontantlayer">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                转子转动速度峰值
                            </td>
                            <td>
                                <input type="text" id="value1" class="inputbox" />
                            </td>
                            <td>
                                rad/min
                            </td>
                        </tr>
                        <tr>
                            <td>
                                无偏振振动加速度
                            </td>
                            <td>
                                <input type="text" id="value2" class="inputbox" />
                            </td>
                            <td>
                                mm/(s*s)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                无偏振振动速度
                            </td>
                            <td>
                                <input type="text" id="value3" class="inputbox" />
                            </td>
                            <td>
                                mm/s
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1号偏振点振动加速度
                            </td>
                            <td>
                                <input type="text" id="value4" class="inputbox" />
                            </td>
                            <td>
                                mm/(s*s)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1号偏振点振动速度
                            </td>
                            <td>
                                <input type="text" id="value5" class="inputbox" />
                            </td>
                            <td>
                                mm/s
                            </td>
                        </tr>
                        <tr>
                            <td>
                                无偏振基准频率(2000rad/min)
                            </td>
                            <td>
                                <input type="text" id="value6" class="inputbox" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1号偏振点基准频率(2000rad/min)
                            </td>
                            <td>
                                <input type="text" id="value7" class="inputbox" />
                            </td>
                            <td>
                                Hz
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1号偏振点基频FFT大小(2000rad/min)
                            </td>
                            <td>
                                <input type="text" id="value8" class="inputbox" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                外观:没有明显划痕、碰伤污垢、变形、色差
                            </td>
                            <td>
                                <input type="radio" name="check1" value="on" checked />正常
                                <input type="radio" name="check1" value="off" />不正常
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                外观:螺丝没有松动、打花、生锈、断裂
                            </td>
                            <td>
                                <input type="radio" name="check2" value="on" checked />正常
                                <input type="radio" name="check2" value="off" />不正常
                            </td>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="margin-top: 8px;">
                <div id="errorMsgdiv" style="display: none;">
                    <center>
                        <span style="color: Red; margin-bottom: 5px;">请检查输入数据的格式 !</span></center>
                </div>
                <center>
                    <button class="button blue" id="buildbtn" style="margin-left: auto; margin-right: auto;
                        font-family: '微软雅黑'">
                        提交生成报表</button>
                </center>
            </div>
        </div>
        <div id="tabsConstantdiv" class="tabsConstant" style="display: none; border-top-style: none;">
            <div runat="server" id="divrunat" class="divcontantlayer" style="display: none;"></div>
            <center>
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="3" height="12">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button class="button blue" id="ButtonPrint" style="margin-left: auto; margin-right: auto;
                                font-family: '微软雅黑'">
                                打印报表</button>
                        </td>
                        <td width="50">
                        </td>
                        <td>
                            <button class="button blue" id="ButtonModify" style="margin-left: auto; margin-right: auto;
                                font-family: '微软雅黑'">
                                修改报表</button>
                        </td>
                        <td width="50">
                        </td>
                        <td>
                            <button class="button blue" id="ButtonFinish" style="margin-left: auto; margin-right: auto;
                                font-family: '微软雅黑'">
                                完成检测</button>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        <div style="clear: both; height: 8px;">
        </div>
        <div class="navend" >
            <div style="float: left">
                <img src="img/Slice_StartNav.png" alt="StartNav" />
            </div>
            <div style="float: left; margin: 4px;">
                <div id="EventJsNav" class="smallbtn" style="cursor: pointer">
                    导航</div>
            </div>
            <div style="float: right; margin: 5px;">
                <div id="EventJsQuit" class="smallbtn" style="cursor: pointer">
                    注销</div>
            </div>
            <div style="float: right">
                <img src="img/Slice_End.png" alt="End" />
            </div>
        </div>
        <div style="clear: both">
        </div>
        <div class="border_end">
        </div>
        <div class="foot">
            <center>
                地址：武汉市东湖高新技术开发区光谷大道特1号国际企业中心 邮编：430074</center>
            <div style="height: 4px">
            </div>
            <center>
                电话：027-87797097 服务热线：4006-027-990 传真：027-877797097</center>
        </div>
    </div>
    </form>
</body>
</html>
