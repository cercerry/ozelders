<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="denememe.aspx.cs" Inherits="denememe" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   
    
<ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</ajaxToolkit:ToolkitScriptManager>
<div class="post">
				<div class="entry">
					<table cellspacing="20">
					    <tr >
					        <td>*Kullanıcı Adı : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtUserName" runat="server"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="userNameValidator" runat="server" ErrorMessage="Kullanıcı Adını Giriniz.." ControlToValidate="txtUserName" ValidationGroup="signUp"></asp:RequiredFieldValidator> </td>
					    </tr>
					    <tr>
					        <td>*Şifre : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="passwordValidator1" runat="server" ErrorMessage="Şifreyi giriniz.." ControlToValidate="txtPassword" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td>*Şifre(tekrar) : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="passwordValidator2" runat="server" ErrorMessage="Şifreyi giriniz.." ControlToValidate="txtPassword2" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td> <asp:CompareValidator ID="compareValidator" runat="server" ErrorMessage="Girdiğiniz şifreler tutarsız.." ControlToCompare="txtPassword" ControlToValidate="txtPassword2" ValidationGroup="signUp"></asp:CompareValidator></td>
					    </tr>
					    <tr>
					        <td>*Ad : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtName" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="nameValidator" runat="server" ErrorMessage="Adınızı giriniz.." ControlToValidate="txtName" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td>*Soyad : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtSurname" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="surnameValidator" runat="server" ErrorMessage="Soyadınızı giriniz.." ControlToValidate="txtSurname" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr >
					        <td>*Doğum Tarihi : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtBirthdate" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="birthdateValidator" runat="server" ErrorMessage="Doğum Tarihinizi giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td><asp:RegularExpressionValidator ID="birthdateRegValidator" runat="server" ErrorMessage="Geçerli bir tarih giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" ValidationExpression="\d{1,2}\.\d{1,2}\.\d{4}" ></asp:RegularExpressionValidator></td>
					        <td>&nbsp;</td>
					    </tr>
					    <tr>
					        <td>*Cinsiyet :</td>
					        <td style="width: 154px"><asp:DropDownList ID="ddGender" runat="server" Width="91px" >
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Erkek</asp:ListItem>
                                <asp:ListItem>Kadın</asp:ListItem>
                            </asp:DropDownList></td>
                            <td><asp:RequiredFieldValidator ID="genderValidator" runat="server" ControlToValidate="ddGender" ErrorMessage="Cinsiyetinizi seçiniz.." ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
                             
					    </tr>
					    <tr>
					        <td>*Email : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtEmail" runat="server"> </asp:TextBox></td>
					        <td><asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email adresinizi giriniz.." ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td><asp:RegularExpressionValidator ID="emailRegValidator"  ControlToValidate="txtEmail" ValidationExpression='^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$' ValidationGroup="signUp" runat="server" ErrorMessage="Geçerli bir mail adresi giriniz.."></asp:RegularExpressionValidator></td>
					    </tr>
					    <tr>
					        <td>Telefon : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtPhoneNo" runat="server"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td style="height: 54px">Adres : </td> 
					        <td style="width: 154px; height: 54px;">
					        <asp:TextBox ID="txtAdress" runat="server" TextMode="MultiLine" Rows="3"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td> <asp:Button ID="btnSignUp" runat="server" Text="Kayıt ol" ValidationGroup="signUp"  /></td>
					    </tr>
					</table>
				</div>
			</div>

</asp:Content>

