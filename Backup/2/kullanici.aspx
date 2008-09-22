<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="kullanici.aspx.cs" Inherits="kullanici" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div>
        <ajaxToolkit:ToolkitScriptManager ID="kullaniciScriptManager" runat="server" EnableScriptGlobalization="true"></ajaxToolkit:ToolkitScriptManager>
        <ajaxToolkit:RoundedCornersExtender ID="roundedCornersMenuPanel" runat="server" 
            TargetControlID="menuPanel" BorderColor="Black" Color="Black"></ajaxToolkit:RoundedCornersExtender>
        <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" 
            TargetControlID="profilPanel" BorderColor="Black" Color="Black"></ajaxToolkit:RoundedCornersExtender>
        <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" 
            TargetControlID="guncellePanel" BorderColor="Black" Color="Black"></ajaxToolkit:RoundedCornersExtender>
        <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" 
            TargetControlID="ilanlarimPanel" BorderColor="Black" Color="Black"></ajaxToolkit:RoundedCornersExtender>
        <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender4" runat="server" 
            TargetControlID="mesajKutusuPanel" BorderColor="Black" Color="Black"></ajaxToolkit:RoundedCornersExtender>

    </div>
    <div id="about" class="post">
        <h1 class="title">Profil sayfasý: <asp:Label ID="titleLabel" runat="server"></asp:Label></h1>
    </div>
    
    <div class="post" >
    
        
        <div class="entry">
             
            <table cellspacing="20">
               <tr>
                    <td>
                        <asp:Panel ID="menuPanel" runat="server">
                            <table >
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="profilLinkButton" runat="server" 
                                            onclick="profilLinkButton_Click">Profil görüntüle</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="ProilGuncelleLinkButton" runat="server" 
                                            onclick="ProilGuncelleLinkButton_Click">Profil Güncelle</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="ilanLinkButton" runat="server" 
                                            onclick="ilanLinkButton_Click">Ýlanlarým</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="mesajKutusu" runat="server" onclick="mesajKutusu_Click">Mesaj 
                                        Kutusu</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Image ID="erkekProfilResim" runat="server" ImageUrl="~/images/hoca1.png" />
                        <asp:Image ID="bayanProfilResim" runat="server" ImageUrl="~/images/hoca2.png" 
                        Visible="False" />
                    </td>
                </tr>  
                </table>
                <table cellspacing="20">
                <tr>
                    <td>
                        <asp:Panel ID="profilPanel" runat="server" Visible="true">
                        <table cellspacing="5">
                            <tr>
                                <td>
                                    Ad Soyad:
                                </td>
                                <td>
                                    <asp:Label ID="adSoyadLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Mail:
                                </td>
                                <td>
                                    <asp:Label ID="mailLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Telefon Numarasý:
                                </td>
                                <td>
                                    <asp:Label ID="telNumLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Doðum tarihiniz:
                                </td>
                                <td>
                                    <asp:Label ID="dogTarLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Adres:
                                </td>
                                <td>
                                    <asp:Label ID="adresLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                        
                        </asp:Panel>
                        <asp:Panel ID="guncellePanel" runat="server" Visible="false">
                        
                        </asp:Panel>
                        <asp:Panel ID="ilanlarimPanel" runat="server" Visible="false">
                        
                        </asp:Panel>
                        <asp:Panel ID="mesajKutusuPanel" runat="server" Visible="false">
                        
                        </asp:Panel>
  
                    </td>
                </tr>  
                  
            </table>
             
        </div>
   
    </div>
    
  

</asp:Content>

