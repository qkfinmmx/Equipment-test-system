<%@ Page Title="转子实验台本体检测" Language="C#" MasterPageFile="~/MasterTestModel.master" AutoEventWireup="true"
    CodeFile="Default-Model-ZZ-Lab-Test.aspx.cs" Inherits="Default_Model_ZZ_Lab_Test" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="js/Ajax_ZZLabTest.js"></script>
</asp:Content>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="ContentPlaceHolderTitle"
    runat="Server">
    <strong style="vertical-align: top">
        <asp:Label ID="LabelTitle" runat="server" Text="Label"></asp:Label>
    </strong>  
        <asp:Label ID="LabelDetail" runat="server" Text="- Label"></asp:Label>
</asp:Content>

<asp:Content ID="ContentInputTable" ContentPlaceHolderID="ContentPlaceHolderInputTable"
    runat="Server">
    <table border="0" cellspacing="8" cellpadding="0">
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
                    <input type="radio" name="check1" value="on" checked />合格
                    <input type="radio" name="check1" value="off" />不合格
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    外观:螺丝没有松动、打花、生锈、断裂
                </td>
                <td>
                    <input type="radio" name="check2" value="on" checked />合格
                    <input type="radio" name="check2" value="off" />不合格
                </td>
                <td>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

<asp:Content ID="ContentReport" ContentPlaceHolderID="ContentPlaceHolderReport"
    runat="Server">
    <div runat="server" id="divrunat" class="divcontantlayer" style="display: none;"></div>
</asp:Content>
