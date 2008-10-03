<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="kayit.aspx.cs" Inherits="kayit" Title="Kayýt"  %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <div> 
    <ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true"></ajaxToolkit:ToolkitScriptManager>
    </div>
     <div id="about" class="post" runat="server">
				<h1 class="title">Yeni Kullanýcý Kayýt</h1>
			</div>
			<!-- end #about -->
			
			<div class="post">
				<div class="entry">
				    <ajax:UpdatePanel ID="updatePanel" runat="server">
				    <ContentTemplate>
					<table cellspacing="15">
					    <tr >
					        <td>*Kullanýcý Adý : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtUserName" runat="server"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="userNameValidator" runat="server" ErrorMessage="Kullanýcý Adýný Giriniz.." ControlToValidate="txtUserName" ValidationGroup="signUp"></asp:RequiredFieldValidator> </td>
					        
					    </tr>
					    <tr>
					        <td>*Þifre : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="passwordValidator1" runat="server" ErrorMessage="Þifreyi giriniz.." ControlToValidate="txtPassword" ValidationGroup="signUp" Width="94px" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td>*Þifre(tekrar) : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="passwordValidator2" runat="server" ErrorMessage="Þifreyi giriniz.." ControlToValidate="txtPassword2" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td colspan="2"> <asp:CompareValidator ID="compareValidator" runat="server" ErrorMessage="Girdiðiniz þifreler tutarsýz.." ControlToCompare="txtPassword" ControlToValidate="txtPassword2" ValidationGroup="signUp" Width="69px"></asp:CompareValidator></td>
					    </tr>
					    <tr>
					        <td>*Ad : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtName" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="nameValidator" runat="server" ErrorMessage="Adýnýzý giriniz.." ControlToValidate="txtName" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td>*Soyad : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtSurname" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="surnameValidator" runat="server" ErrorMessage="Soyadýnýzý giriniz.." ControlToValidate="txtSurname" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td></td>
					        <td style="width: 208px" colspan="2"><asp:CheckBox ID="checkBoxIsSurname" runat="server" Checked="true" Text="Soyadým Profilimde görünsün" Width="215px" /></td>
					    </tr>
					    <tr >
					        <td style="height: 36px">*Doðum Tarihi : </td> 
					        <td style="width: 175px; height: 36px;"><asp:TextBox ID="txtBirthdate" runat="server" > </asp:TextBox></td>
					        <td style="height: 36px"> <asp:RequiredFieldValidator ID="birthdateValidator" runat="server" ErrorMessage="Doðum Tarihinizi giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" Width="166px" ></asp:RequiredFieldValidator></td>
					        <td colspan="2" style="height: 36px"><asp:RegularExpressionValidator ID="birthdateRegValidator" runat="server" ErrorMessage="Geçerli bir tarih giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" ValidationExpression="\d{1,2}\.\d{1,2}\.\d{4}" ></asp:RegularExpressionValidator></td>
					        
					    </tr>
					    <tr>
					        <td>*Cinsiyet :</td>
					        <td style="width: 175px"><asp:DropDownList ID="ddGender" runat="server" Width="91px" >
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Bay</asp:ListItem>
                                <asp:ListItem>Bayan</asp:ListItem>
                            </asp:DropDownList></td>
                            <td><asp:RequiredFieldValidator ID="genderValidator" runat="server" ControlToValidate="ddGender" ErrorMessage="Cinsiyetinizi seçiniz.." ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
                             
					    </tr>
					    <tr>
					        <td>*Email : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtEmail" runat="server"> </asp:TextBox></td>
					        <td><asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email adresinizi giriniz.." ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td colspan="2"><asp:RegularExpressionValidator ID="emailRegValidator"  ControlToValidate="txtEmail" ValidationExpression='^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$' ValidationGroup="signUp" runat="server" ErrorMessage="Geçerli bir mail adresi giriniz.."></asp:RegularExpressionValidator></td>
					    </tr>
					    <tr>
					        <td>Telefon : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtPhoneNo" runat="server"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td></td>
					        <td style="width: 208px" colspan="2"><asp:CheckBox ID="checkBoxIsPhone" runat="server" Checked="true" Text="Telefonum Profilimde görünsün" Width="240px" /> </td>
					    </tr>
					    <tr>
					        <td style="height: 54px">Adres : </td> 
					        <td style="width: 175px; height: 54px;"><asp:TextBox ID="txtAdress" runat="server" TextMode="MultiLine" Rows="3"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td> <asp:Button ID="btnSignUp" runat="server" Text="Kayýt ol" ValidationGroup="signUp" OnClick="btnSignUp_Click" /></td>
					        <td colspan="1"> <asp:CustomValidator ID="userNameCustomValdator" runat="server" ControlToValidate="txtUserName"  ErrorMessage="Girdiðiniz kullanýcý adý kullanýlýyor ya da geçersiz" ValidationGroup="signUp" OnServerValidate="userNameValidation"></asp:CustomValidator></td>
					        <td style="width: 175px"><ajaxToolkit:CalendarExtender ID="ajaxCalendarExtender" runat="server" TargetControlID="txtBirthdate" PopupPosition="Right" CssClass="MyCalendar" Format="dd.MM.yyyy"></ajaxToolkit:CalendarExtender></td>
					    </tr>
					    
					</table>
					</ContentTemplate>
					</ajax:UpdatePanel>
				</div>
			</div>
            
</asp:Content>

