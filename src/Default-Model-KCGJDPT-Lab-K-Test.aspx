<%@ Page Title="可重构综合机电平台控制箱检验" Language="C#" MasterPageFile="~/MasterTestModel.master" AutoEventWireup="true" CodeFile="Default-Model-KCGJDPT-Lab-K-Test.aspx.cs" Inherits="Default_Model_KCGJDPT_Lab_K_Test" %>

<asp:Content ID="Contenthead" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/Ajax_KCGSYPT_K.js"></script>
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
    		<td>控制箱运行正常无短路现象</td>
            <td>
                <input type="radio" name="check1" value="on" checked />合格
                <input type="radio" name="check1" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>开关指示灯运行正常</td>
            <td>
                <input type="radio" name="check2" value="on" checked />合格
                <input type="radio" name="check2" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>传感器AD端口,限位开关IO口数据读取正常</td>
            <td>
                <input type="radio" name="check3" value="on" checked />合格
                <input type="radio" name="check3" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>电机控制端口控制信号正常</td>
            <td>
                <input type="radio" name="check4" value="on" checked />合格
                <input type="radio" name="check4" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>电磁阀端口控制信号正常</td>
            <td>
                <input type="radio" name="check5" value="on" checked />合格
                <input type="radio" name="check5" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>芯片程序运行正常</td>
            <td>
                <input type="radio" name="check6" value="on" checked />合格
                <input type="radio" name="check6" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>外观:没有明显划痕、碰伤污垢、变形、色差、丝印清晰</td>
            <td>
                <input type="radio" name="check7" value="on" checked />合格
                <input type="radio" name="check7" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>外观:螺丝不得有松动，打花，生锈，断裂</td>
            <td>
                <input type="radio" name="check8" value="on" checked />合格
                <input type="radio" name="check8" value="off" />不合格
            </td>
    	</tr>
    </table>
</asp:Content>

<asp:Content ID="Contentreport" ContentPlaceHolderID="ContentPlaceHolderReport" Runat="Server">
    <div runat="server" id="divrunat" class="divcontantlayer" style="display: none;"></div>
</asp:Content>

