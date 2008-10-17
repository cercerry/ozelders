<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true" ></ajaxToolkit:ToolkitScriptManager>
</div>
<div id="about" class="post" runat="server">
				<h1 class="title">Yeni Kullanýcý Kayýt</h1>
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
                                            left: 0px; top: 0px" Width="586px" CreateUserButtonText="Kaydol" DuplicateEmailErrorMessage="Girmiþ olduðunuz email adresi kullanýlýyor.Lütfen baþka bir mail adresi giriniz" DuplicateUserNameErrorMessage="Girmiþ olduðunuz kullanýcý adý kullanýlmaktadýr.Lütfen baþka bir kullanýcý adý giriniz." CompleteSuccessText="Kaydýnýz baþarýyla gerçekleþtirilmiþtir" ContinueButtonText="Devam" UnknownErrorMessage="Kullanýcý oluþturulamadý." ContinueDestinationPageUrl="~/kayit.aspx" OnCreatedUser="CreateUserWizard1_CreatedUser">
                                            <WizardSteps>
                                                <asp:CreateUserWizardStep ID="createUserStep" runat="server">
                                                    <ContentTemplate>
                                                        <table border="0" style="font-size: 100%; width: 586px">
                                                            <tr style="height:30px">
                                                                <th align="center" colspan="2" style="color:White">
                                                                    Kayýt Bilgileri</th>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td align="center">
                                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Kullanýcý Adý :</asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                        ErrorMessage="Kullanýcý adý giriniz." ToolTip="Kullanýcý adý giriniz." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td align="center">
                                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Þifre :</asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="148px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                        ErrorMessage="Þifre giriniz." ToolTip="Þifre giriniz." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:50px">
                                                                <td align="center">
                                                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Þifre (tekrar) :</asp:Label></td>
                                                                <td>
                                                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="148px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                                        ErrorMessage="Þifreyi tekrar giriniz." ToolTip="Þifreyi tekrar giriniz."
                                                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Girdiðiniz þifreler tutarsýz.."
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
                                                                    <asp:RegularExpressionValidator ID="emailRegValidator"  ControlToValidate="Email" ValidationExpression='^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$' Text="*" ValidationGroup="CreateUserWizard1" runat="server" ErrorMessage="Geçerli bir mail adresi giriniz.."></asp:RegularExpressionValidator>
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
                                                                Kaydýnýz baþarýyla gerçekleþtirilmiþtir
                                                                </th>
                                                            </tr>
                                                            <tr style="height:25px"></tr>
                                                            <tr style="height:25px">
                                                                <td align="center">Kiþisel bilgilerinizi ve Özel dersle ilgili bilgileri girmek için devam ediniz</td>
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

