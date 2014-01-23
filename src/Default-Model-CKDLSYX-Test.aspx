<%@ Page Title="测控电路实验箱检测" Language="C#" MasterPageFile="~/MasterTestModel.master" AutoEventWireup="true" CodeFile="Default-Model-CKDLSYX-Test.aspx.cs" Inherits="Default_Model_CKDLSYX_Test" %>

<asp:Content ID="Contenthead" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/Ajax_CKDLSYX.js"></script>
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
    		<td>±12V、±5V电压正常</td>
            <td>
                <input type="radio" name="check2" value="on" checked />合格
                <input type="radio" name="check2" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>信号发生器工作正常,频率幅值调节正常</td>
            <td>
                <input type="radio" name="check3" value="on" checked />合格
                <input type="radio" name="check3" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>差动放大器单元工作正常</td>
            <td>
                <input type="radio" name="check4" value="on" checked />合格
                <input type="radio" name="check4" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>电阻链分相细分单元工作正常</td>
            <td>
                <input type="radio" name="check5" value="on" checked />合格
                <input type="radio" name="check5" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>幅度调制解调单元工作正常</td>
            <td>
                <input type="radio" name="check6" value="on" checked />合格
                <input type="radio" name="check6" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>精密全波整流单元工作正常</td>
            <td>
                <input type="radio" name="check7" value="on" checked />合格
                <input type="radio" name="check7" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>调频及鉴频单元工作正常</td>
            <td>
                <input type="radio" name="check8" value="on" checked />合格
                <input type="radio" name="check8" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>移相电桥单元工作正常</td>
            <td>
                <input type="radio" name="check9" value="on" checked />合格
                <input type="radio" name="check9" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>脉宽调制单元工作正常</td>
            <td>
                <input type="radio" name="check10" value="on" checked />合格
                <input type="radio" name="check10" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>分频器、锁相环单元工作正常</td>
            <td>
                <input type="radio" name="check11" value="on" checked />合格
                <input type="radio" name="check11" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>开关电容滤波单元工作正常</td>
            <td>
                <input type="radio" name="check12" value="on" checked />合格
                <input type="radio" name="check12" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>开关式全波相敏检波单元工作正常</td>
            <td>
                <input type="radio" name="check13" value="on" checked />合格
                <input type="radio" name="check13" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>开关式调制单元工作正常</td>
            <td>
                <input type="radio" name="check14" value="on" checked />合格
                <input type="radio" name="check14" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>信号运算放大和电压比较单元工作正常</td>
            <td>
                <input type="radio" name="check15" value="on" checked />合格
                <input type="radio" name="check15" value="off" />不合格
            </td>
    	</tr>
        <tr>
    		<td>信号输出正常</td>
            <td>
                <input type="radio" name="check16" value="on" checked />合格
                <input type="radio" name="check16" value="off" />不合格
            </td>
    	</tr>
        <tr>
            <td>外观:没有明显划痕、碰伤污垢、变形、色差</td>
            <td>
                <input type="radio" name="check17" value="on" checked />合格
                <input type="radio" name="check17" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:锁扣提手完好无破损</td>
            <td>
                <input type="radio" name="check18" value="on" checked />合格
                <input type="radio" name="check18" value="off" />不合格
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Contentreport" ContentPlaceHolderID="ContentPlaceHolderReport" Runat="Server">
    <div runat="server" id="divrunat" class="divcontantlayer" style="display: none;"></div>
</asp:Content>

