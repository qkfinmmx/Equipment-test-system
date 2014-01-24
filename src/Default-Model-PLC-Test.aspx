<%@ Page Title="PLC实验箱检验" Language="C#" MasterPageFile="~/MasterTestModel.master" AutoEventWireup="true" CodeFile="Default-Model-PLC-Test.aspx.cs" Inherits="Default_Model_PLC_Test" %>

<asp:Content ID="Contenthead" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/Ajax_PLC.js"></script>
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
    		<td>实验箱无短路现象</td>
            <td>
                <input type="radio" name="check1" value="on" checked />合格
                <input type="radio" name="check1" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>24V电压输出正常</td>
            <td>
                <input type="radio" name="check2" value="on" checked />合格
                <input type="radio" name="check2" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>输入、输出开关点接线牢固</td>
            <td>
                <input type="radio" name="check3" value="on" checked />合格
                <input type="radio" name="check3" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>输入、输出对应指示灯工作正常</td>
            <td>
                <input type="radio" name="check4" value="on" checked />合格
                <input type="radio" name="check4" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>220V开关动作顺畅</td>
            <td>
                <input type="radio" name="check5" value="on" checked />合格
                <input type="radio" name="check5" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>显示屏USB接口通讯正常</td>
            <td>
                <input type="radio" name="check6" value="on" checked />合格
                <input type="radio" name="check6" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>显示屏COM口通讯正常</td>
            <td>
                <input type="radio" name="check7" value="on" checked />合格
                <input type="radio" name="check7" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>外观:没有明显划痕、碰伤污垢、变形、色差</td>
            <td>
                <input type="radio" name="check8" value="on" checked />合格
                <input type="radio" name="check8" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>外观:锁扣提手完好无破损</td>
            <td>
                <input type="radio" name="check9" value="on" checked />合格
                <input type="radio" name="check9" value="off" />不合格
            </td>
    	</tr>
    </table>
</asp:Content>

<asp:Content ID="Contentreport" ContentPlaceHolderID="ContentPlaceHolderReport" Runat="Server">
    <div runat="server" id="divrunat" class="divcontantlayer" style="display: none;"></div>
</asp:Content>

