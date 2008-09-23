<%@ Page Language="C#" MasterPageFile="~/kullaniciMasterPage.master" AutoEventWireup="true" CodeFile="kullanici.aspx.cs" Inherits="kullanici" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
    <ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true"></ajaxToolkit:ToolkitScriptManager>
    
</div> 
<ajax:UpdatePanel ID="updatePanelKullanici" runat="server">
    <ContentTemplate>
       <table>
        <tr>
            <td>
             <table>
            <tr>
                <td>
                    <asp:Panel ID="panelMenu" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:LinkButton ID="linkButtonProfil" runat="server">Profil</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="linkButtonProfilGuncelle" runat="server">Profil güncelle</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="linkButtonIlanlarim" runat="server">Ýlanlarýnýz</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="linkButtonMesajBox" runat="server">Mesaj Kutusu</asp:LinkButton>
                            </td>
                         </tr>
                       </table>       
                </asp:Panel>
                </td>
                </tr>
            </table>
            </td>
            <td>
                <asp:Panel ID="panelImage" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="imageBayResim" runat="server" ImageUrl="images/hoca1.png" visible="false"/>
                                    <asp:Image ID="imageBayanResim" runat="server" ImageUrl="images/hoca2.png" Visible="false" />
                                </td>
                            </tr>
                        </table>
                </asp:Panel>
            
            </td>
        </tr>
      </table>
      <table>
        <tr>
            <td>
                <asp:Panel ID="panelProfil" runat="server">
                    <table align="left">
                        <tr>
                            <td>
                                <h3>Kiþisel Bilgiler</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ad Soyad:
                            </td>
                            <td>
                                <asp:Label ID="lblAdSoyad" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Doðum Tarihi:
                            </td>
                            <td>
                                <asp:Label ID="lblBirthDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                e-posta:
                            </td>
                            <td>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Telefon numarasý:
                            </td>
                            <td>
                                <asp:Label ID="lblPhoneNum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                cinsiyet:
                            </td>
                            <td>
                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Þehir:
                            </td>
                            <td>
                                <asp:Label ID="lblCity" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ýlçe:
                            </td>
                            <td>
                                <asp:Label ID="lblVillage" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Üniversite:
                            </td>
                            <td>
                                <asp:Label ID="lblUniversity"  runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tanitim:
                            </td>
                            <td>
                                <asp:label ID="lblTanitim" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h3>Özel Ders Bilgileri</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Verdiði Dersler:
                            </td>
                            <td>
                                <asp:ListBox ID="listBoxVerilenDersler" runat="server" Enabled="false"></asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ders Bilgileri:
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            Ders Mekaný:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblDersMekan" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Ücret:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblUcret" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                    </table>
                
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelProfilGuncelle" runat="server">
                
                </asp:Panel> 
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelIlanlarim" runat="server">
                
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelMesajKutusu" runat="server">
                
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <ajaxToolkit:RoundedCornersExtender ID="roundedCornersMenuPanel" runat="server" TargetControlID="panelMenu" Color="Gray" BorderColor="Gray"></ajaxToolkit:RoundedCornersExtender>
                <ajaxToolkit:RoundedCornersExtender ID="roundedCornersImagePanel" runat="server" TargetControlID="panelImage" Color="Gray" BorderColor="Gray"></ajaxToolkit:RoundedCornersExtender>
                <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersProfilPanel" runat="server" TargetControlID="panelIlanlarim" Color="Gray" BorderColor="Gray"></ajaxToolkit:RoundedCornersExtender>
                <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersProfilGuncellePanel" runat="server" TargetControlID="panelProfil" Color="Gray" BorderColor="Gray"></ajaxToolkit:RoundedCornersExtender>
                <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersIlanlarim" runat="server" TargetControlID="panelProfilGuncelle" Color="Gray" BorderColor="Gray"></ajaxToolkit:RoundedCornersExtender>
                <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersMesajKutusu" runat="server" TargetControlID="panelMesajKutusu" Color="Gray" BorderColor="Gray"></ajaxToolkit:RoundedCornersExtender>
            </td>
        </tr>
      </table>
   </ContentTemplate>
</ajax:UpdatePanel>    

</asp:Content>

