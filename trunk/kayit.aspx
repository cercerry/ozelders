<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="kayit.aspx.cs" Inherits="kayit" Title="Kay�t"  %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <div> 
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"  EnableScriptGlobalization="true"  ></ajaxToolkit:ToolkitScriptManager>
    </div>
     <div id="about" class="post" runat="server">
				<h1 class="title">Yeni Kullan�c� Kay�t</h1>
			</div>
			<!-- end #about -->
			
			<div class="post">
				<div class="entry">
				    <ajax:UpdatePanel ID="updatePanel" runat="server">
				    <ContentTemplate>
					<table cellspacing="15">
					    <tr >
					        <td>*Kullan�c� Ad� : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtUserName" runat="server"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="userNameValidator" runat="server" ErrorMessage="Kullan�c� Ad�n� Giriniz.." ControlToValidate="txtUserName" ValidationGroup="signUp"></asp:RequiredFieldValidator> </td>
					        <td> <asp:CustomValidator ID="userNameCustomValdator" runat="server" ControlToValidate="txtUserName"  ErrorMessage="Giri�iniz kullan�c� kullan�l�yor ya da ge�ersiz" ValidationGroup="signUp" OnServerValidate="userNameValidation"></asp:CustomValidator></td>
					    </tr>
					    <tr>
					        <td>*�ifre : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="passwordValidator1" runat="server" ErrorMessage="�ifreyi giriniz.." ControlToValidate="txtPassword" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td>*�ifre(tekrar) : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"> </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="passwordValidator2" runat="server" ErrorMessage="�ifreyi giriniz.." ControlToValidate="txtPassword2" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td> <asp:CompareValidator ID="compareValidator" runat="server" ErrorMessage="Girdi�iniz �ifreler tutars�z.." ControlToCompare="txtPassword" ControlToValidate="txtPassword2" ValidationGroup="signUp"></asp:CompareValidator></td>
					    </tr>
					    <tr>
					        <td>*Ad : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtName" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="nameValidator" runat="server" ErrorMessage="Ad�n�z� giriniz.." ControlToValidate="txtName" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td>*Soyad : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtSurname" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="surnameValidator" runat="server" ErrorMessage="Soyad�n�z� giriniz.." ControlToValidate="txtSurname" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr >
					        <td>*Do�um Tarihi : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtBirthdate" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="birthdateValidator" runat="server" ErrorMessage="Do�um Tarihinizi giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td><asp:RegularExpressionValidator ID="birthdateRegValidator" runat="server" ErrorMessage="Ge�erli bir tarih giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" ValidationExpression="\d{1,2}\.\d{1,2}\.\d{4}" ></asp:RegularExpressionValidator></td>
					        <td><ajaxToolkit:CalendarExtender ID="ajaxCalendarExtender" runat="server" TargetControlID="txtBirthdate" PopupPosition="Right" CssClass="MyCalendar" Format="dd.MM.yyyy"></ajaxToolkit:CalendarExtender></td>
					    </tr>
					    <tr>
					        <td>*Cinsiyet :</td>
					        <td style="width: 154px"><asp:DropDownList ID="ddGender" runat="server" Width="91px" >
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Erkek</asp:ListItem>
                                <asp:ListItem>Kad�n</asp:ListItem>
                            </asp:DropDownList></td>
                            <td><asp:RequiredFieldValidator ID="genderValidator" runat="server" ControlToValidate="ddGender" ErrorMessage="Cinsiyetinizi se�iniz.." ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
                             
					    </tr>
					    <tr>
					        <td>*Email : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtEmail" runat="server"> </asp:TextBox></td>
					        <td><asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email adresinizi giriniz.." ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					        <td><asp:RegularExpressionValidator ID="emailRegValidator"  ControlToValidate="txtEmail" ValidationExpression='^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$' ValidationGroup="signUp" runat="server" ErrorMessage="Ge�erli bir mail adresi giriniz.."></asp:RegularExpressionValidator></td>
					    </tr>
					    <tr>
					        <td>Telefon : </td> 
					        <td style="width: 154px"><asp:TextBox ID="txtPhoneNo" runat="server"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td style="height: 54px">Adres : </td> 
					        <td style="width: 154px; height: 54px;"><asp:TextBox ID="txtAdress" runat="server" TextMode="MultiLine" Rows="3"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td> <asp:Button ID="btnSignUp" runat="server" Text="Kay�t ol" ValidationGroup="signUp" OnClick="btnSignUp_Click" /></td>
					    </tr>
					    
					</table>
					</ContentTemplate>
					</ajax:UpdatePanel>
				</div>
			</div>
            
</asp:Content>

