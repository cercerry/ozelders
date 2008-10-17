<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <ajaxToolkit:ToolkitScriptManager ID="toolkitScripManager" runat="server" EnableScriptGlobalization="true" ></ajaxToolkit:ToolkitScriptManager>
    </div>
    <ajax:UpdatePanel ID="updatePanel" runat="server">
    <ContentTemplate>
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
            <tr>
                <td colspan="2" align="right"><asp:Button ID="btnSendMessageUp" runat="server" Text="Mesaj gönder" OnClick="MakeContact_Click" /> </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="post" id="divProfile" runat="server">
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
            <br />
            <asp:Button ID="btnSendMessageDown" runat="server" Text="Mesaj gönder" OnClick="MakeContact_Click" />
            
        </div>
    </div>
    
    <div class="post" id="divMessage" runat="server" visible="false">
        <div class="entry">
            <asp:Panel ID="panelSendMessage" runat="server" >
                <table id="tableSendMessage" runat="server"  style="border-collapse:collapse; table-layout:fixed" width="593" >
                    <tr>
                        <th style="width:5%"></th>
                        <th style="width:20%;color:White;height:30px">Ýletiþim formu</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td style="width:5%"><asp:RequiredFieldValidator ID="requiredNameValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Ýsminizi giriniz" Text="*" ValidationGroup="SendMessage" ></asp:RequiredFieldValidator></td>
                        <td style="height: 25px;width:20%">*Ýsim :</td>
                        <td style="height: 25px"><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="requiredMailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Mail Adresinizi giriniz" Text="*" ValidationGroup="SendMessage" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="emailRegValidator"  ControlToValidate="txtEmail" ValidationExpression='^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$' ValidationGroup="SendMessage" runat="server" ErrorMessage="Geçerli bir mail adresi giriniz.." Text="*"></asp:RegularExpressionValidator>
                        </td>
                        <td>*Email Adresi :</td>
                        <td><asp:TextBox ID="txtEMail" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="requiredMail2Validator" runat="server" ControlToValidate="txtEmail2" ErrorMessage="Mail(tekrar) Adresinizi giriniz" Text="*" ValidationGroup="SendMessage" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="email2ReqValidator"  ControlToValidate="txtEmail2" ValidationExpression='^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$' ValidationGroup="SendMessage" runat="server" ErrorMessage="Geçerli bir mail adresi giriniz.." Text="*"></asp:RegularExpressionValidator>
                            <asp:CompareValidator ID="compareValidator" runat="server" ErrorMessage="Girdiðiniz mail adresleri tutarsýz.." ControlToCompare="txtEmail" ControlToValidate="txtEmail2" ValidationGroup="SendMessage" Text="*" ></asp:CompareValidator>
                        </td>
                        <td>*Email Adresi(Tekrar) :</td>
                        <td><asp:TextBox ID="txtEmail2" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="height: 25px">Telefon :</td>
                        <td style="height: 25px"><asp:TextBox ID="txtPhone" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:RequiredFieldValidator ID="requiredMessageValidator" runat="server" ControlToValidate="txtMessage" ErrorMessage="Mesajýnýzý giriniz" Text="*" ValidationGroup="SendMessage" ></asp:RequiredFieldValidator></td>
                        <td>Mesajýnýz :</td>
                        <td><asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="100px" Width="400px"></asp:TextBox></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td></td>
                        <td><asp:Button ID="btnSend" runat="server" Text="Mesajý gönder" OnClick="SendMessage_Click" ValidationGroup="SendMessage"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2"><asp:ValidationSummary DisplayMode="BulletList" ID="validationSummary" runat="server" ValidationGroup="SendMessage" Width="249px" /></td>
                    </tr>
                </table>
                <ajaxToolkit:RoundedCornersExtender ID="roundedPanelSendMessage" runat="server" TargetControlID="panelSendMessage" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
            </asp:Panel>
            <asp:Panel ID="PanelSuccessSending" runat="server" Visible="false"> 
                <table id="tableSuccess" runat="server" border="1" style="border-collapse:collapse; table-layout:fixed" width="593">
                    <tr>
                        <td align="center"><asp:Label ID="lblSuccess" runat="server" Text="Mesajýnýz baþarýyla iletilmiþtir."></asp:Label></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td align="center"><asp:LinkButton ID="lnkbtnProfile" runat="server" OnClick="lnkbtnProfile_Click" Text="Profile geri dönmek için týklayýnýz"></asp:LinkButton></td>
                    </tr>
                </table>
                <ajaxToolkit:RoundedCornersExtender ID="roundedPanelSuccess" runat="server" TargetControlID="panelSuccessSending" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
            </asp:Panel>
        </div>
    </div>
    </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

