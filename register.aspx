<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true" ></ajaxToolkit:ToolkitScriptManager>
</div>
<div id="about" class="post" runat="server">
				<h1 class="title">Yeni Kullan�c� Kay�t</h1>
			</div>
			<!-- end #about -->
			
			<div class="post">
				<div class="entry">
				    <ajax:UpdatePanel ID="updatePanel" runat="server">
				    <ContentTemplate>
				        <asp:Panel ID="panelKayit" runat="server">
				            <table width="593">
				                <tr>
				                    <td>
                                        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Style="z-index: 100;
                                            left: 0px; top: 0px" Width="586px" CreateUserButtonText="Kaydol" DuplicateEmailErrorMessage="Girmi� oldu�unuz email adresi kullan�l�yor.L�tfen ba�ka bir mail adresi giriniz" DuplicateUserNameErrorMessage="Girmi� oldu�unuz kullan�c� ad� kullan�lmaktad�r.L�tfen ba�ka bir kullan�c� ad� giriniz." CompleteSuccessText="Kayd�n�z ba�ar�yla ger�ekle�tirilmi�tir" ContinueButtonText="Devam" UnknownErrorMessage="Kullan�c� olu�turulamad�." ContinueDestinationPageUrl="~/kayit.aspx" OnCreatedUser="CreateUserWizard1_CreatedUser">
                                            <WizardSteps>
                                                <asp:CreateUserWizardStep ID="createUserStep" runat="server">
                                                    <ContentTemplate>
                                                        <table border="0" style="font-size: 100%; width: 586px">
                                                            <tr style="height:30px">
                                                                <th align="center" colspan="2" style="color:White">
                                                                    Kay�t Bilgileri</th>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td align="center">
                                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Kullan�c� Ad� :</asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                        ErrorMessage="Kullan�c� ad� giriniz." ToolTip="Kullan�c� ad� giriniz." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td align="center">
                                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">�ifre :</asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="148px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                        ErrorMessage="�ifre giriniz." ToolTip="�ifre giriniz." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td align="center">
                                                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">�ifre (tekrar) :</asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="148px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                                        ErrorMessage="�ifreyi tekrar giriniz." ToolTip="�ifreyi tekrar giriniz."
                                                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Girdi�iniz �ifreler tutars�z.."
                                                                        ValidationGroup="CreateUserWizard1">*</asp:CompareValidator>    
                                                                </td>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td align="center">
                                                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                                        ErrorMessage="Email adresi giriniz." ToolTip="Email adresi giriniz." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="emailRegValidator"  ControlToValidate="Email" ValidationExpression='^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$' Text="*" ValidationGroup="CreateUserWizard1" runat="server" ErrorMessage="Ge�erli bir mail adresi giriniz.."></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td  colspan="2" style="color: red">
                                                                    <asp:ValidationSummary ID="validationSummary" runat="server" ValidationGroup="CreateUserWizard1" DisplayMode="BulletList" Width="248px" />
                                                                </td>
                      
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="2" style="color: red">
                                                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:CreateUserWizardStep>
                                                <asp:CompleteWizardStep runat="server">
                                                    <ContentTemplate>
                                                        <table border="0" style="font-size: 100%; width: 586px">
                                                            <tr style="height:25px">
                                                                <th align="center" colspan="2" style="color:White">
                                                                Kayd�n�z ba�ar�yla ger�ekle�tirilmi�tir
                                                                </th>
                                                            </tr>
                                                            <tr style="height:25px"></tr>
                                                            <tr style="height:25px">
                                                                <td align="center">Ki�isel bilgilerinizi ve �zel dersle ilgili bilgileri girmek i�in devam ediniz</td>
                                                            </tr>
                                                            <tr style="height:25px"></tr>
                                                            <tr>
                                                                <td align="right" colspan="2" style="height: 24px">
                                                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                                        Text="Devam" ValidationGroup="CreateUserWizard1" Width="77px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:CompleteWizardStep>
                                            </WizardSteps>
                                            <CreateUserButtonStyle Width="80px" />
                                        </asp:CreateUserWizard>
				                        <ajaxToolkit:RoundedCornersExtender ID="RoundedPanelKayit" runat="server" TargetControlID="panelKayit" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
				                    
				                    </td>
				                </tr>
				            </table>
				        </asp:Panel>
				    </ContentTemplate>
				    </ajax:UpdatePanel>
                    &nbsp;
                </div>
            </div>    
</asp:Content>

