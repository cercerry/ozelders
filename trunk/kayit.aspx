<%@ Page Language="C#" MasterPageFile="~/ozelders.master" AutoEventWireup="true" CodeFile="kayit.aspx.cs" Inherits="kayit" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: left;
        }
        .style3
        {
        width: 75px;
    }
        .style4
        {
            width: 99%;
        }
        .style5
        {
            width: 391px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="style5">
    <legend>Kullan�c� Bilgileri</legend>
    <table class="style4" rules="none">
    <tr>
        <td class="style3">
            *Kullan�c� ad�</td>
        <td class="style2">
            <asp:TextBox ID="idText" runat="server"></asp:TextBox>
        </td>
        <td class="style2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="idText" ErrorMessage="kullan�c� ad� giriniz..."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            *�ifre
        </td>
        <td>
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="password" ErrorMessage="�ifre giriniz..."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            *�ifre tekrar</td>
        <td class="style2">
            <asp:TextBox ID="passwordAgain" runat="server" TextMode="Password"></asp:TextBox>
            
        </td>
        <td class="style2">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="password" ControlToValidate="passwordAgain" 
                ErrorMessage="Girilen �ifreler farkl�"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
                <td class="style3">
                    *Ad�</td>
                                    <td>
                                        <asp:TextBox ID="ad" runat="server" ></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="ad" ErrorMessage="Ad�n�z� girmelisiniz..."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        *Soyad�</td>
                <td>
                    <asp:TextBox ID="soyad" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="soyad" ErrorMessage="Soyad�n�z� girmelisiniz..."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    *e-posta</td>
                <td valign="top">
                    <asp:TextBox ID="eposta" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="eposta" ErrorMessage="ge�erli bir e-posta girmelisiniz" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="eposta" ErrorMessage="e-posta adresi giriniz..."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Do�um tarihi</td>
                                    <td>
                                        <asp:TextBox ID="dogTar" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                            EnableViewState="False" TargetControlID="dogTar" > 
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        *Cinsiyet             <td>
                                        <asp:DropDownList ID="cinsiyetSecim" runat="server">
                                            <asp:ListItem>Erkek</asp:ListItem>
                                            <asp:ListItem>Bayan</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Telefon</td>
                <td>
                    <asp:TextBox ID="telefon" runat="server"></asp:TextBox>
                                    </td>
                <td>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                        TargetControlID="telefon" ValidChars="0123456789">
                    </cc1:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Adres</td>
                <td>
                    <asp:TextBox ID="adres" runat="server" TextMode="MultiLine" Width="118px"></asp:TextBox>
                </td>
                <td>
                    <br />
                </td>
            </tr>
            </table>
    
                    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization=true >
                    </cc1:ToolkitScriptManager>
                <asp:Button ID="ilerleButton" runat="server" onclick="Button1_Click" 
            Text="kaydet ve ilerle&gt;&gt;&gt;" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br />
    
    </fieldset>

</asp:Content>

