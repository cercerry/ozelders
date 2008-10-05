<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <ajaxToolkit:ToolkitScriptManager ID="toolkitScripManager" runat="server" EnableScriptGlobalization="true" ></ajaxToolkit:ToolkitScriptManager>
    </div>
    
    <div class="post" >
        <table width="620">
            <tr>
                <td>
                    <h1 class="title"><asp:Label ID="lblTitleNameSurname" runat="server" ></asp:Label>&nbsp;</h1>
                </td>
                <td>
                    <asp:Image ImageAlign="Right" ID="imageGender" runat="server" Height="74px" Width="63px"/>
                </td>
            </tr>
        </table>
    </div>
    <div class="post">
        <div class="entry">
            <asp:Panel ID="panelKisiselBilgi" runat="server" >
                <table  border="1" style="border-collapse:collapse; table-layout:fixed" width="593" >
                    <tr>
                        <th style="color:White; width:25%; height: 42px;"></th>
                        <th style="color:White; width:75%; height: 42px;">Kiþisel Bilgiler</th>
                    </tr>
                    <tr >
                        <td align="center" style="width: 25%; height: 30px;">Ýsim :</td>
                        <td align="center" style="width: 75%; height: 30px;"> <asp:Label ID="lblAdSoyad" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%; height: 30px; table-layout:fixed" >DoðumTarihi :</td>
                        <td align="center" style="width: 75%; height: 30px;"> <asp:Label ID="lblDogumTarihi" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;height: 30px;">Üniversite :</td>
                        <td align="center" style="width: 75%;height: 30px;"> <asp:Label ID="lblUniversite" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;height: 30px;">Meslek :</td>
                        <td align="center" style="width: 75%;height: 30px;"> <asp:Label ID="lblMeslek" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;height: 30px;">Þehir :</td>
                        <td align="center" style="width: 75%;height: 30px;"> <asp:Label ID="lblSehir" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;height: 30px;">Cinsiyet :</td>
                        <td align="center" style="width: 75%;height: 30px;"> <asp:Label ID="lblCinsiyet" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;height:28px;">Telefon :</td>
                        <td align="center" style="width: 75%; height: 28px;"> <asp:Label ID="lblTelefon" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <ajaxToolkit:RoundedCornersExtender ID="roundedPanelKisisel" runat="server" TargetControlID="panelKisiselBilgi" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="panelDersler" runat="server" >
                <table id="tableDersler" runat="server"  border="1" style="border-collapse:collapse; table-layout:fixed" width="593">
                    <tr>
                        <th style="color:White; width:25%; height: 42px;"></th>
                        <th style="color:White; width:75%; height: 42px;">Verdiði Dersler</th>
                    </tr>
                </table>
                <ajaxToolkit:RoundedCornersExtender ID="roundedPanelDersler" runat="server" TargetControlID="panelDersler" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="panelOzelDersBilgi" runat="server">
                <table id="tableOzelDersBilgi" runat="server"  border="1" style="border-collapse:collapse; table-layout:fixed" width="593">                  
                    <tr>
                        <th style="color:White;width:25%;  height: 42px;"></th>
                        <th style="color:White;width:75%;  height: 42px;">ÖzelDers'le ilgili Detaylar</th>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;height: 30px;">Ders Yeri :</td>
                        <td align="center" style="width: 75%;height: 30px;"><asp:Label ID="lblDersYeri" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;height: 30px;">Ders Ücreti :</td>
                        <td align="center" style="width: 75%;height: 30px;"><asp:Label ID="lblUcret" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <ajaxToolkit:RoundedCornersExtender ID="RoundedPanelOzelDersBilgi" runat="server" TargetControlID="panelOzelDersBilgi" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="panelTanitim" runat="server">
                <table id="tableTanitim" runat="server" border="1" style="border-collapse:collapse; table-layout:fixed" width="593">
                    <tr>
                        <th style="color:White;width:25%;  height: 42px;"></th>                  
                        <th style="color:White; width:75%; height: 42px;">Kiþisel Tanýtým</th>
                    </tr>
                    <tr>
                        <td align="center" style="width:25%;  height: 30px;">Tanýtým :</td>
                        <td align="center" style="width: 75%;height: 30px;"><p style="text-align:center" id="paragrafTanitim" runat="server"></p></td>
                    </tr>
                </table>
                <ajaxToolkit:RoundedCornersExtender ID="RoundedPanelTanitim" runat="server" TargetControlID="panelTanitim" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
            </asp:Panel>
            
        </div>
    </div>
</asp:Content>

