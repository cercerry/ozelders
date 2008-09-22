<%@ Page Language="C#" MasterPageFile="~/Kullanici.master" AutoEventWireup="true" CodeFile="kullanici.aspx.cs" Inherits="kullanici" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 441px;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style2">
                <tr>
                    <td colspan="2">
                        Hoşgeldiniz
                        <asp:Label ID="isim" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>   
                    <td>
                        <asp:Panel ID="Panel5" runat="server">
                            <table>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="profilIncele" runat="server" onclick="profilIncele_Click">Profilim</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="profilGuncelle" runat="server" 
                            onclick="profilGuncelle_Click">Profil Güncelle</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="dersAlanlar" runat="server" onclick="dersAlanlar_Click">Ders 
                        verdiğiniz alanlar</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="messageBox" runat="server" onclick="messageBox_Click1">Mesaj 
                        Kutusu</asp:LinkButton>
                                </td>
                            </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Image id="bayanImage" runat="server" ImageAlign="Right" ImageUrl="~/images/hoca2.png" /></asp:Image>
                        <asp:Image id="bayImage" runat="server" ImageAlign="Right" ImageUrl="~/images/hoca1.png" /></asp:Image>
                    </td>
                 </tr>   
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="Panel1" runat="server">
                            <table>
                                <tr>
                                    <td>
                                       Profilinize göz atın...
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Ad Soyad:"></asp:Label>
                                    </td> 
                                    <td>
                                         <asp:Label ID="adSoyadLabel" runat="server" Text="Label"></asp:Label>
                                    </td>    
                                </tr>
                                <tr>
                                    <td>
                                         <asp:Label ID="Label2" runat="server" Text="Mail:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="mailLabel" runat="server" Text="Label"></asp:Label>        
                                    </td>   
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Telefon numarası:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="telefonNumLabel" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>    
                                         <asp:Label ID="Label4" runat="server" Text="Doğum tarihi:"></asp:Label>
                                    </td>
                                    <td>
                                         <asp:Label ID="dogTarLabel" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Adres:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="adresLabel" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                        <table>
                            <tr>
                                <td>
                                    Profilinizi güncelleyin
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBoxIsim" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                
                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                                        TargetControlID="TextBoxIsim" WatermarkText="Yeni ad...">
                                    </cc1:TextBoxWatermarkExtender>
                                
                                </td>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxSoyad" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <cc1:TextboxWatermarkExtender ID="wtr1" runat="server" 
                                            TargetControlID="TextBoxSoyad" WatermarkText="Yeni soyad">
                                        </cc1:TextboxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <cc1:TextboxWatermarkExtender ID="TextboxWatermarkExtender2" runat="server" TargetControlID="TextBoxUserName" WatermarkText="Yeni Kullanıcı adı">
                                        </cc1:TextboxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <cc1:TextboxWatermarkExtender ID="TextboxWatermarkExtender3" runat="server" TargetControlID="TextBoxPassword" WatermarkText="Yeni şifre">
                                        </cc1:TextboxWatermarkExtender>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxPassAgain" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxPassAgain" 
                                            ErrorMessage="Girilen şifreler aynı olmalı"  ></asp:CompareValidator>
                                        <cc1:TextBoxWatermarkExtender ID="wtr" runat="server" 
                                            TargetControlID="TextBoxPassAgain" WatermarkText="Yeni şifre tekrar">
                                        </cc1:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="guncelleButton" runat="server" Text="Güncelle" 
                                            onclick="guncelleButton_Click" /> 
                                    </td>
                                </tr>
                            </tr>
                         </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" GroupingText="Ders verdiğiniz alanlar...">
                        </asp:Panel>
                        <asp:Panel ID="Panel4" runat="server" GroupingText="Mesaj Kutusu">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" 
                            BorderColor="RoyalBlue" Color="RoyalBlue" TargetControlID="Panel1">
                        </cc1:RoundedCornersExtender>
                        <cc1:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" 
                            BorderColor="RoyalBlue" Color="RoyalBlue" TargetControlID="Panel2">
                        </cc1:RoundedCornersExtender>
                        <cc1:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" 
                            BorderColor="RoyalBlue" Color="RoyalBlue" TargetControlID="Panel3">
                        </cc1:RoundedCornersExtender>
                        <cc1:RoundedCornersExtender ID="RoundedCornersExtender4" runat="server" 
                            BorderColor="RoyalBlue" Color="RoyalBlue" TargetControlID="Panel4">
                        </cc1:RoundedCornersExtender>
                        <cc1:RoundedCornersExtender ID="RoundedCornersExtender5" runat="server" 
                            BorderColor="RoyalBlue" Color="RoyalBlue" TargetControlID="Panel5">
                        </cc1:RoundedCornersExtender>
                        <br />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

