<%@ Page Title="转子实验台调速箱检测" Language="C#" MasterPageFile="~/MasterTestModel.master" AutoEventWireup="true" CodeFile="Default-Model-ZZ-Lab-T-Test.aspx.cs" Inherits="Default_Model_ZZ_Lab_T_Test" %>

<asp:Content ID="Contenthead" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/Ajax_ZZLabTTest.js"></script>
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
    		<td>220V开关启动正常</td>
            <td>
                <input type="radio" name="check1" value="on" checked />合格
                <input type="radio" name="check1" value="off" />不合格
            </td>
    	</tr>
        <tr>
            <td>数码管显示正常</td>
            <td>
                <input type="radio" name="check2" value="on" checked />合格
                <input type="radio" name="check2" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>调速器切换开关工作正常,转子控制转向正确</td>
            <td>
                <input type="radio" name="check3" value="on" checked />合格
                <input type="radio" name="check3" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>编码器速度测量误差小于5%</td>
            <td>
                <input type="radio" name="check4" value="on" checked />合格
                <input type="radio" name="check4" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>控制速度达到3000rad/min以上</td>
            <td>
                <input type="radio" name="check5" value="on" checked />合格
                <input type="radio" name="check5" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:没有明显划痕、碰伤污垢、变形、色差</td>
            <td>
                <input type="radio" name="check6" value="on" checked />合格
                <input type="radio" name="check6" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:螺丝没有松动、打花、生锈、断裂</td>
            <td>
                <input type="radio" name="check7" value="on" checked />合格
                <input type="radio" name="check7" value="off" />不合格
            </td>
        </tr>
        <tr>
            <td>外观:面板贴膜整齐</td>
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
