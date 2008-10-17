<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="kayit.aspx.cs" Inherits="kayit" Title="Kay�t"  %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <div> 
    <ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true"></ajaxToolkit:ToolkitScriptManager>
    </div>
     <div id="about" class="post" runat="server">
				<h1 class="title">Yeni Kullan�c� Kay�t</h1>
			</div>
			<!-- end #about -->
			
			<div class="post">
				<div class="entry">
				    <ajax:UpdatePanel ID="updatePanel" runat="server">
				    <ContentTemplate>
				    <asp:Panel ID="kayitPanel" runat="server">
					<table cellspacing="15" >
					    <tr>
					        <th colspan="5" style="height:25px ;color:White" >(1/2) Kullan�c� Bilgileri</th>
					    </tr>
					    
					    <tr>
					        <td>*Ad : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtName" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="nameValidator" runat="server" ErrorMessage="Ad�n�z� giriniz.." ControlToValidate="txtName" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td>*Soyad : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtSurname" runat="server" > </asp:TextBox></td>
					        <td> <asp:RequiredFieldValidator ID="surnameValidator" runat="server" ErrorMessage="Soyad�n�z� giriniz.." ControlToValidate="txtSurname" ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
					    </tr>
					    <tr>
					        <td></td>
					        <td style="width: 208px" colspan="2"><asp:CheckBox ID="checkBoxIsSurname" runat="server" Checked="true" Text="Soyad�m Profilimde g�r�ns�n" Width="215px" /></td>
					    </tr>
					    <tr >
					        <td style="height: 36px">*Do�um Tarihi : </td> 
					        <td style="width: 175px; height: 36px;"><asp:TextBox ID="txtBirthdate" runat="server" > </asp:TextBox></td>
					        <td style="height: 36px"> <asp:RequiredFieldValidator ID="birthdateValidator" runat="server" ErrorMessage="Do�um Tarihinizi giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" Width="166px" ></asp:RequiredFieldValidator></td>
					        <td colspan="2" style="height: 36px"><asp:RegularExpressionValidator ID="birthdateRegValidator" runat="server" ErrorMessage="Ge�erli bir tarih giriniz.." ControlToValidate="txtBirthdate" ValidationGroup="signUp" ValidationExpression="\d{1,2}\.\d{1,2}\.\d{4}" Width="105px" ></asp:RegularExpressionValidator></td>
					        
					    </tr>
					    <tr>
					        <td>*Cinsiyet :</td>
					        <td style="width: 175px"><asp:DropDownList ID="ddGender" runat="server" Width="91px" >
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Bay</asp:ListItem>
                                <asp:ListItem>Bayan</asp:ListItem>
                            </asp:DropDownList></td>
                            <td><asp:RequiredFieldValidator ID="genderValidator" runat="server" ControlToValidate="ddGender" ErrorMessage="Cinsiyetinizi se�iniz.." ValidationGroup="signUp" ></asp:RequiredFieldValidator></td>
                             
					    </tr>
					    
					    <tr>
					        <td>Telefon : </td> 
					        <td style="width: 175px"><asp:TextBox ID="txtPhoneNo" runat="server"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td></td>
					        <td style="width: 208px" colspan="2"><asp:CheckBox ID="checkBoxIsPhone" runat="server" Checked="true" Text="Telefonum Profilimde g�r�ns�n" Width="240px" /> </td>
					    </tr>
					    <tr>
					        <td style="height: 54px">Adres : </td> 
					        <td style="width: 175px; height: 54px;"><asp:TextBox ID="txtAdress" runat="server" TextMode="MultiLine" Rows="3"> </asp:TextBox></td>
					    </tr>
					    <tr>
					        <td></td>
					        <td> <asp:Button ID="btnSignUp" runat="server" Text="Kaydet ve �lerle" ValidationGroup="signUp" OnClick="btnSignUp_Click" /></td>
					        
					        
					    </tr>
					    
					</table>
					</asp:Panel>
					<ajaxToolkit:CalendarExtender ID="ajaxCalendarExtender" runat="server" TargetControlID="txtBirthdate" PopupPosition="Right" CssClass="MyCalendar" Format="dd.MM.yyyy"></ajaxToolkit:CalendarExtender>
					<ajaxToolkit:RoundedCornersExtender ID="RoundedPanelKayit" runat="server" TargetControlID="kayitPanel" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
					
					
					<asp:Panel ID="PanelDersDetaylari" runat="server" Visible="false" >
					    <table cellspacing="15">
					        <tr>
					            <th colspan="5" style="height:25px ;color:White" >(2/2) �zel Ders Bilgileri</th>
					        </tr>
					        <tr >
                                <td><asp:CustomValidator ID="ddCityValidator" runat="server" ControlToValidate="ddCity" ValidationGroup="Detay" OnServerValidate="ddCityControl" ErrorMessage="�ehir Se�iniz" Text="*"></asp:CustomValidator></td>
                                <td style="width: 58px" >*�ehir :</td>
                                <td style="width: 199px" ><asp:DropDownList ID="ddCity" runat="server" Width="154px" AutoPostBack="True" OnSelectedIndexChanged="ddCity_SelectedIndexChanged" ></asp:DropDownList></td>        
                            </tr>
                            <tr>
                                <td></td>
                                <td >�l�e :</td>
                                <td ><asp:DropDownList ID="ddVillage" runat="server" Width="154px"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="height: 19px"><asp:CustomValidator ID="ddUniversityValidator" runat="server" ControlToValidate="ddUniversity" ValidationGroup="Detay" OnServerValidate="ddUniversityControl" ErrorMessage="�niversite Se�iniz" Text="*"></asp:CustomValidator></td>
                                <td style="height: 19px">*�niversite :</td>
                                <td colspan="3" style="height: 19px"><asp:DropDownList ID="ddUniversity" runat="server" Width="275px" Height="30px"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td><asp:RequiredFieldValidator ID="requiredValidatorMeslek" runat="server" ControlToValidate="txtMeslek" ErrorMessage="Meslek Giriniz" Text="*" ValidationGroup="Detay"></asp:RequiredFieldValidator></td>
                                <td>*Meslek :</td>
                                <td style="width: 199px"><asp:TextBox ID="txtMeslek" runat="server" Width="150px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="3">Vermek istedi�iniz dersleri se�iniz..</td>
                            </tr>
                            <tr >
                                <td><asp:CustomValidator ID="ddCourseCategoryValidator" runat="server" ControlToValidate="ddCourseCategory" ValidationGroup="Ders" OnServerValidate="ddCourseCategoryControl" ErrorMessage="Ders Kategorisi Se�iniz" Text="*"> </asp:CustomValidator></td>
                                <td style="width: 58px" >*Ders Kategori :</td>
                                <td style="width: 199px" ><asp:DropDownList ID="ddCourseCategory" runat="server" AutoPostBack="true" Width="154px" OnSelectedIndexChanged="ddCourseCategory_SelectedIndexChanged" ></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Ders Konu :</td>
                                <td ><asp:DropDownList ID="ddCourseTopic" runat="server" Width="154px" ></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td><asp:CustomValidator ID="listBoxDerslerValidator" runat="server" ControlToValidate="listBoxSelectedDersler" ValidationGroup="Detay" OnServerValidate="listBoxSelectedDerslerControl" ErrorMessage="Ders Se�iniz" Text="*"></asp:CustomValidator></td>
                                <td colspan="2" style="height: 122px"><asp:ListBox ID="listBoxSelectedDersler" runat="server" Height="116px" Rows="7" Width="298px"></asp:ListBox></td>
                                <td><asp:Button ID="btnAdd" runat="server" Text="Ekle" Width="59px" OnClick="btnAdd_Click"  ValidationGroup="Ders"/> <br /><br /><asp:Button ID="btnRemove" runat="server" Text="��kar" Width="59px" OnClick="btnRemove_Click" /></td>
                            </tr>
                            <tr>
                                <td><asp:RequiredFieldValidator ID="txtMinValidator" runat="server" ControlToValidate="txtMinValue" ValidationGroup="Detay" ErrorMessage="Minimum �cret Giriniz">*</asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="txtMaxValidator" runat="server" ControlToValidate="txtMaxValue" ValidationGroup="Detay" ErrorMessage="Maximum �cret Giriniz" Text="*"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="Detay" OnServerValidate="CompareValues" ErrorMessage="Minumum �cret maximum �cretten b�y�k olamaz" Text="*"></asp:CustomValidator></td>
                                <td style="height: 45px">*�cret Aral��� :</td>
                                <td style="height: 45px; width: 199px;"><asp:TextBox ID="txtMinValue" runat="server" Width="30px" ></asp:TextBox>
                                    &nbsp; - &nbsp;
                                    <asp:TextBox ID="txtMaxValue" runat="server" Width="30px"></asp:TextBox> &nbsp;&nbsp;YTL</td>
                                <td style="height: 45px; width: 106px;"><asp:RegularExpressionValidator ID="minValidator" runat="server" ControlToValidate="txtMinValue" ValidationGroup="Detay" ValidationExpression="\d+" ErrorMessage="Ge�erli bir rakam giriniz.." Width="105px"></asp:RegularExpressionValidator></td>
                                <td style="height: 45px"><asp:RegularExpressionValidator ID="maxValidator" runat="server" ControlToValidate="txtMaxValue" ValidationGroup="Detay" ValidationExpression="\d+" ErrorMessage="Ge�erli bir rakam giriniz.."></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td><asp:CustomValidator ID="dersYeriValidator" runat="server" ValidationGroup="Detay" OnServerValidate="ControlForDersYeri" ErrorMessage="En az bir ders yeri se�melisiniz" Text="*"></asp:CustomValidator></td>
                                <td style="width: 58px">*DersYeri :</td>
                                <td style="width: 199px"><asp:CheckBox ID="checkBoxOgretmen" runat="server" Checked="true" Text="��retmenin Evi" /></td>
                                <td style="width: 106px"><asp:CheckBox ID="checkBoxOgrenci" runat="server" Checked="true" Text="��rencinin Evi" Width="106px" /></td>
                                <td><asp:CheckBox ID="checkBoxEtud" runat="server" Checked="true" Text="Et�d Merkezi" Width="102px" /></td>
                            </tr>
                            <tr>
                                <td style="height: 36px"></td>
                                <td colspan="4" style="height: 36px">Kendinizi tan�t�n (�zel ders tecr�belerinizi,ilgi alanlar�n�z� ve ��renci ve velilere iletmek istediklerinizi yazabilirsiniz)</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="4"><asp:TextBox ID="txtTanitim" runat="server" TextMode="MultiLine" Height="63px" Width="524px" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td style="width: 199px"><asp:Button ID="btnFinishSigningUp" runat="server" ValidationGroup="Detay" Text="Kay�t ��lemini Tamamla" OnClick="btnFinishSigningUp_Click" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="4"><asp:ValidationSummary ID="validationSummary" runat="server" ValidationGroup="Detay" HeaderText="(*) ile g�sterilen alanlar� giriniz" DisplayMode="BulletList" /></td>
                            </tr>
					    </table>
					</asp:Panel>
					<ajaxToolkit:RoundedCornersExtender ID="RoundedPanelDersDetaylari" runat="server" TargetControlID="PanelDersDetaylari" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
					
					</ContentTemplate>
					</ajax:UpdatePanel>
				</div>
			</div>
            
</asp:Content>

