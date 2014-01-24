<%@ Page Title="运动控制台检测" Language="C#" MasterPageFile="~/MasterTestModel.master" AutoEventWireup="true" CodeFile="Default-Model-YDKZT-Test.aspx.cs" Inherits="Default_Model_YDKZT_Test" %>

<asp:Content ID="Contenthead" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/Ajax_YDKZT.js"></script>
</asp:Content>

<asp:Content ID="Contenttitle" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">
    <strong style="vertical-align: top">
        <asp:Label ID="LabelTitle" runat="server" Text="Label"></asp:Label>
    </strong>  
        <asp:Label ID="LabelDetail" runat="server" Text="- Label"></asp:Label>
</asp:Content>

<asp:Content ID="Contentinputtable" ContentPlaceHolderID="ContentPlaceHolderInputTable" Runat="Server">
    <table border="0" cellspacing="8" cellpadding="0">
    	<tr>
    		<td>直流电机转速</td>
            <td><input type="text" id="value1" class="inputbox" /></td>
            <td>rad/min</td>
    	</tr>
        <tr>
            <td>外观:无磕碰、划痕</td>
            <td>
                <input type="radio" name="check1" value="on" checked />合格
                <input type="radio" name="check1" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:无锈迹、污斑</td>
            <td>
                <input type="radio" name="check2" value="on" checked />合格
                <input type="radio" name="check2" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:标牌牢固</td>
            <td>
                <input type="radio" name="check3" value="on" checked />合格
                <input type="radio" name="check3" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:无毛刺</td>
            <td>
                <input type="radio" name="check4" value="on" checked />合格
                <input type="radio" name="check4" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:指示灯高度一致、开关有弹性、电源插头缺口朝下</td>
            <td>
                <input type="radio" name="check5" value="on" checked />合格
                <input type="radio" name="check5" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:步进电机与直流电机轴平行</td>
            <td>
                <input type="radio" name="check6" value="on" checked />合格
                <input type="radio" name="check6" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>电涡流接近开关、限位开关方向正确无损伤</td>
            <td>
                <input type="radio" name="check7" value="on" checked />合格
                <input type="radio" name="check7" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>正转反转按钮方向正确及指示灯显示位置正确</td>
            <td>
                <input type="radio" name="check8" value="on" checked />合格
                <input type="radio" name="check8" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>光电对管及定位光管信号正常</td>
            <td>
                <input type="radio" name="check9" value="on" checked />合格
                <input type="radio" name="check9" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>完成PID控制实验误差不大于0.1cm</td>
            <td>
                <input type="radio" name="check10" value="on" checked />合格
                <input type="radio" name="check10" value="off" />不合格
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Contentreport" ContentPlaceHolderID="ContentPlaceHolderReport" Runat="Server">
    <div runat="server" id="divrunat" class="divcontantlayer" style="display: none;"></div>
</asp:Content>

