<%@ Page Title="可重构机电平台本体检验" Language="C#" MasterPageFile="~/MasterTestModel.master" AutoEventWireup="true" CodeFile="Default-Model-KCGJDPT-Lab-B-Test.aspx.cs" Inherits="Default_Model_KCGJDPT_Lab_B_Test" %>

<asp:Content ID="Contenthead" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/Ajax_KCGJDPT_B.js"></script>
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
    		<td>接口板运行正常无短路现象</td>
            <td>
                <input type="radio" name="check1" value="on" checked />合格
                <input type="radio" name="check1" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>接口端子24V供电正常</td>
            <td>
                <input type="radio" name="check2" value="on" checked />合格
                <input type="radio" name="check2" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>步进电机驱动器接线正确,参数设置正确</td>
            <td>
                <input type="radio" name="check3" value="on" checked />合格
                <input type="radio" name="check3" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>限位开关及传感器工作正常,安装位置符合标准</td>
            <td>
                <input type="radio" name="check4" value="on" checked />合格
                <input type="radio" name="check4" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>电磁阀气缸连接正确</td>
            <td>
                <input type="radio" name="check5" value="on" checked />合格
                <input type="radio" name="check5" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>气缸运行正常安装位置符合标准</td>
            <td>
                <input type="radio" name="check6" value="on" checked />合格
                <input type="radio" name="check6" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>平台运动机构运行顺畅</td>
            <td>
                <input type="radio" name="check7" value="on" checked />合格
                <input type="radio" name="check7" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>电机运行方向速度符合标准</td>
            <td>
                <input type="radio" name="check8" value="on" checked />合格
                <input type="radio" name="check8" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>单平台程序运行符合标准</td>
            <td>
                <input type="radio" name="check9" value="on" checked />合格
                <input type="radio" name="check9" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>多平台运动符合标准</td>
            <td>
                <input type="radio" name="check10" value="on" checked />合格
                <input type="radio" name="check10" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>外观:没有明显划痕、碰伤污垢、变形、色差、丝印清晰</td>
            <td>
                <input type="radio" name="check11" value="on" checked />合格
                <input type="radio" name="check11" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>外观:螺丝不得有松动，打花，生锈，断裂</td>
            <td>
                <input type="radio" name="check12" value="on" checked />合格
                <input type="radio" name="check12" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>外观:封条整齐无毛边,封盖无破损</td>
            <td>
                <input type="radio" name="check13" value="on" checked />合格
                <input type="radio" name="check13" value="off" />不合格
            </td>
    	</tr>
    </table>
</asp:Content>

<asp:Content ID="Contentreport" ContentPlaceHolderID="ContentPlaceHolderReport" Runat="Server">
    <div runat="server" id="divrunat" class="divcontantlayer" style="display: none;"></div>
</asp:Content>

