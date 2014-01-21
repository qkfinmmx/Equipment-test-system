<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZZ-Lab-Test.aspx.cs" Inherits="ZZ_Lab_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>转子本体检测</title>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/basejq_menuaction.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var g_data;
            $("#buildbtn").click(function () {
                if ($("#tabsConstantdiv").css("display") == "none") {
                    $.ajax({
                        type: "post",
                        url: "HandAjax_ZZLabTest_m.ashx",
                        data: { v1: $("#value1").val(),
                            v2: $("#value2").val(),
                            v3: $("#value3").val(),
                            v4: $("#value4").val(),
                            v5: $("#value5").val(),
                            v6: $("#value6").val(),
                            v7: $("#value7").val(),
                            v8: $("#value8").val(),
                            c1: $('input[name="check1"]:checked').val(),
                            c2: $('input[name="check2"]:checked').val(),
                            c3: $('input[name="check3"]:checked').val(),
                            c4: $('input[name="check4"]:checked').val()
                        },
                        datatype: "json",
                        success: function (obj) {
                            var data = eval(obj);
                            if (data[0].toString() == "InputScuess") {  //scuess
                                g_data = data;
                                $("#errorMsgdiv").hide();
                                $("#SNLabel").text(data[1].toString());
                                $("#totalspan").text(data[23].toString());
                                $("#checktime").text("检测时间:" + data[2].toString());
                                for (var i = 0; i < 8; i++) {
                                    $("#testresult" + (i + 1).toString()).text(data[3 + i].toString());
                                }
                                for (var i = 0; i < 12; i++) {
                                    $("#subresult" + (i + 1).toString()).text(data[11 + i].toString());
                                }
                                $("#user").text($("#username").text());
                                $("#tabsConstantdiv").show();
                                $("#divrunat").fadeIn(500);

                            }
                            else {  //error
                                $("#errorMsgdiv").show();
                            }
                        }
                    });
                }
                return false;
            });
            $("#ButtonModify").click(function () {
                $("#tabsConstantdiv").hide();
                $("#divrunat").hide();
                return false;
            });
            $("#ButtonPrint").click(function () {
                g_data.push($("#username").text());
                $.ajax({
                    type: "post",
                    url: "HandAjax_Print.ashx",
                    data: {
                        GAjaxData: JSON.stringify(g_data)
                    },
                    datatype: "json",
                    success: function (obj) {
                        var data = eval(obj);
                        if (data[0].toString() == "Success") {
                            var winPrint = window.open(data[1].toString(), "_blank", "", "");
                            winPrint.document.location.reload();
                            winPrint.print();
                        }
                    }
                });
                return false;
            });
        });
    </script>
    <link href="style/bodyStyle.css" rel="stylesheet" type="text/css"/>    
    <link href="style/NacStyle.css" rel="stylesheet" type="text/css" />
    <link href="style/buttonStyle.css" rel="stylesheet" type="text/css" />
</head>
<body class="mainbody" oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <form id="form1" runat="server">
    <div class="Menu">
        <div class="Menu_One">
            <div class="Menu_Float1">
                <img src="img/webnav_24.png" alt="Computer" /></div>
            <div class="Menu_Float2" id="navend_1">
                主导航</div>
        </div>
        <div class="Menu_One">
            <div class="Menu_Float1">
                <img src="img/ComPuter_24.png" alt="Computer" /></div>
            <div class="Menu_Float2" id="navend_2">
                域详细信息</div>
        </div>
        <div class="Menu_One">
            <div class="Menu_Float1">
                <img src="img/UserHead-24.png" alt="UserManage" /></div>
            <div class="Menu_Float2" id="navend_3">
                域用户管理</div>
        </div>
        <div class="Menu_One">
            <div class="Menu_Float1">
                <img src="img/SYSTEM_NOWTIME_24.png" alt="UserManage" /></div>
            <div class="Menu_Float2" id="navend_4">
                测试对象选择</div>
        </div>
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
                                外观:无磕碰、划痕
                            </td>
                            <td>
                                <input type="radio" name="check1" value="on" checked>正常</input><input type="radio"
                                    name="check1" value="off">不正常</input>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                外观:无锈迹、污斑
                            </td>
                            <td>
                                <input type="radio" name="check2" value="on" checked>正常</input><input type="radio"
                                    name="check2" value="off">不正常</input>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                外观:标牌牢固
                            </td>
                            <td>
                                <input type="radio" name="check3" value="on" checked>正常</input><input type="radio"
                                    name="check3" value="off">不正常</input>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                外观:无毛刺
                            </td>
                            <td>
                                <input type="radio" name="check4" value="on" checked>正常</input><input type="radio"
                                    name="check4" value="off">不正常</input>
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
            <div id="divrunat" class="divcontantlayer" style="display: none;">
                <!--startprint-->
                <center>
                    <table id="tablePrint" cellspacing="0" width="100%" style="font-family: '微软雅黑'; font-size: 12px;">
                        <tbody>
                            <tr>
                                <td colspan="5" align="center">
                                    <img src="img/DepushLOGO.png" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <h3 align="center">
                                        公司通过ISO9001质量体系认证</h3>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <h1 align="center">
                                        转子实验台本体检验报告</h1>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <h3 align="center" style="margin-bottom: 24px;">
                                        DRZZSY Mechanical Construction Inspection Report</h3>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" height="30" class="tdclass">
                                    <span class="spandiv">出厂编号(S/N):</span>
                                </td>
                                <td colspan="4" class="tdclass">
                                    <span class="spandiv" id="SNLabel">$SNLabel$</span>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" height="30" class="tdclass">
                                    <span class="spandiv">序号</span>
                                </td>
                                <td align="center" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">测试项目</span></div>
                                </td>
                                <td align="center" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">技术要求</span></div>
                                </td>
                                <td align="center" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">测试结果</span></div>
                                </td>
                                <td align="center" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">结论</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        1</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">转子转动速度峰值</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">大于等于2800rad/min</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult1">$1测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult1">$1结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        2</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">无偏振振动加速度</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">小于0.8mm/(s*s)</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult2">$2测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult2">$2结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        3</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">无偏振振动速度</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">小于0.3mm/s</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult3">$3测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult3">$3结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        4</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">1号偏振点振动加速度</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">大于1.5mm/(s*s)</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult4">$4测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult4">$4结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        5</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">1号偏振点振动速度</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">大于5.2mm/s</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult5">$5测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult5">$5结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        6</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">无偏振基准频率(2000rad/min)</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">处于高频区域</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult6">$6测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult6">$6结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        7</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">1号偏振点基准频率(2000rad/min)</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">33.3Hz(5%偏离)</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult7">$7测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult7">$7结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        8</div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">1号偏振点基频FFT大小(2000rad/min)</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv">不小于50</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="testresult8">$8测试结果$</span></div>
                                </td>
                                <td class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult8">$8结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="4" class="tdclass">
                                    <div align="center">
                                        外观</div>
                                </td>
                                <td colspan="3" class="tdclass">
                                    <div align="center">
                                        无磕碰、划痕</div>
                                </td>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult9">$9结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdclass">
                                    <div align="center">
                                        无锈迹、污斑</div>
                                </td>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult10">$A结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdclass">
                                    <div align="center">
                                        标牌牢固</div>
                                </td>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult11">$B结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdclass">
                                    <div align="center">
                                        无毛刺</div>
                                </td>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="subresult12">$C结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        结论:</div>
                                </td>
                                <td colspan="4" class="tdclass">
                                    <div align="center">
                                        <span class="spandiv" id="totalspan">$总体结论$</span></div>
                                </td>
                            </tr>
                            <tr>
                                <td height="26" class="tdclass">
                                    <div align="center">
                                        检验员:</div>
                                </td>
                                <td colspan="2" class="tdclass">
                                    <span class="spandiv" id="user"></span>
                                </td>
                                <td colspan="2" class="tdclass">
                                    <span class="spandiv" id="checktime">$检验时间$</span>
                                </td>
                            </tr>
                            <tr>
                                <td height="50px">
                                    <div align="center">
                                        负责人签字:</div>
                                </td>
                                <td colspan="4">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </center>
                <!--endprint-->
            </div>
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
                    </tr>
                </table>
            </center>
        </div>
        <div style="clear: both; height: 8px;">
        </div>
        <div class="navend">
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
