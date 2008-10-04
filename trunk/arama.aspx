<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="arama.aspx.cs" Inherits="arama" Title="Özel Ögretmen Arama Sayfasý" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true"></ajaxToolkit:ToolkitScriptManager>
</div>

<div id="about" class="post" runat="server">
	<h2 class="title">Detaylý arama yaparak ögretmeninizi bulabilirsiniz..</h2>
</div>

<div class="post">
	<div class="entry">
	    <ajax:UpdatePanel ID="updatePanel" runat="server" >
	        <ContentTemplate>
	        <div>
	            <asp:LinkButton ID="searchCriteriaLink" runat="server" Visible="false" Text="Arama Kriterleri" ForeColor="red" OnClick="searchCriteriaLink_Clicked"></asp:LinkButton>
	        </div>
	        <asp:Panel ID="searchCriteriaPanel" runat="server" >
	            <table cellspacing="15" style="width: 577px">
                    <tr>
                        <td><asp:CustomValidator ID="ddCityValidator" runat="server" ControlToValidate="ddCity" ValidationGroup="Search" OnServerValidate="ddCityControl" ErrorMessage="Þehir Seçiniz" Text="*"></asp:CustomValidator></td>
                        <td style="height: 22px">*Þehir :</td>
                        <td style="height: 22px; width: 147px;"><asp:DropDownList ID="ddCity" runat="server" Width="146px" AutoPostBack="True" OnSelectedIndexChanged="ddCity_SelectedIndexChanged" ></asp:DropDownList></td>
                        <td style="height: 22px">Ýlçe :</td>
                        <td style="width: 154px; height: 22px;"><asp:DropDownList ID="ddVillage" runat="server" Width="146px"></asp:DropDownList></td>         
                    </tr>
                    <tr>
                        <td><asp:CustomValidator ID="ddCourseCategoryValidator" runat="server" ControlToValidate="ddCourseCategory" ValidationGroup="Search" OnServerValidate="ddCourseCategoryControl" ErrorMessage="Ders Kategorisi Seçiniz" Text="*"> </asp:CustomValidator></td>
                        <td style="height: 36px">*Ders Kategori :</td>
                        <td style="height: 36px; width: 147px;"><asp:DropDownList ID="ddCourseCategory" runat="server" AutoPostBack="true" Width="146px" OnSelectedIndexChanged="ddCourseCategory_SelectedIndexChanged" ></asp:DropDownList></td>
                        <td style="height: 36px;">Ders Konu :</td>
                        <td style="height: 36px; width: 154px;"><asp:DropDownList ID="ddCourseTopic" runat="server" Width="146px" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td><asp:RequiredFieldValidator ID="txtMinValidator" runat="server" ControlToValidate="txtMinValue" ValidationGroup="Search" ErrorMessage="Minimum Ücret Giriniz">*</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="txtMaxValidator" runat="server" ControlToValidate="txtMaxValue" ValidationGroup="Search" ErrorMessage="Maximum Ücret Giriniz" Text=" *"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="compareValidator" runat="server" ValidationGroup="Search" OnServerValidate="CompareValues" ErrorMessage="Minumum ücret maximum ücretten büyük olamaz" Text="*"></asp:CustomValidator></td>
                        <td style="height: 45px">*Ücret Aralýðý :</td>
                        <td style="height: 45px; width: 147px;"><asp:TextBox ID="txtMinValue" runat="server" Width="30px" >0</asp:TextBox>
                            &nbsp; - &nbsp;
                            <asp:TextBox ID="txtMaxValue" runat="server" Width="30px">200</asp:TextBox> &nbsp;&nbsp;YTL</td>
                        <td style="height: 45px"><asp:RegularExpressionValidator ID="minValidator" runat="server" ControlToValidate="txtMinValue" ValidationGroup="Search" ValidationExpression="\d+" ErrorMessage="Geçerli bir rakam giriniz.." Width="105px"></asp:RegularExpressionValidator></td>
                        <td style="height: 45px"><asp:RegularExpressionValidator ID="maxValidator" runat="server" ControlToValidate="txtMaxValue" ValidationGroup="Search" ValidationExpression="\d+" ErrorMessage="Geçerli bir rakam giriniz.."></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Öðretmenin üniversitesi :</td>
                        <td style="width: 147px"><asp:DropDownList ID="ddUniversity" runat="server" Width="146px" Font-Size="X-Small" Height="30px"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td><asp:CustomValidator ID="dersYeriValidator" runat="server" ValidationGroup="Search" OnServerValidate="ControlForDersYeri" ErrorMessage="En az bir ders yeri seçmelisiniz" Text="*"></asp:CustomValidator></td>
                        <td>*Ders Yeri :</td>
                        <td style="width: 147px"><asp:CheckBox ID="checkBoxOgretmen" runat="server" Checked="true" Text="Öðretmenin Evi" /></td>
                        <td><asp:CheckBox ID="checkBoxOgrenci" runat="server" Checked="true" Text="Öðrencinin Evi" Width="106px" /></td>
                        <td><asp:CheckBox ID="checkBoxEtud" runat="server" Checked="true" Text="Etüd Merkezi" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Onaylý Öðretmen :</td>
                        <td style="width:147px"><asp:CheckBox ID="checkBoxOnaylý" runat="server" Text="Ýstiyorum" Width="144px" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><asp:Button ID="btnSearch" runat="server" Text="Ara" Width="53px" OnClick="btnSearch_Click" ValidationGroup="Search" /></td>
                    </tr>
                    
                </table>
                <table>
                    <tr>
                        <td><asp:ValidationSummary ID="validationSummary" runat="server" ValidationGroup="Search" HeaderText="(*) ile gösterilen alanlarý giriniz" DisplayMode="BulletList" /></td>
                        <td><ajaxToolkit:RoundedCornersExtender ID="RoundedPanelCriteria" runat="server" TargetControlID="searchCriteriaPanel" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender></td>
                    </tr>
                </table>
                </asp:Panel>
                
                
                <asp:Panel ID="searchResultsPanel" runat="server" Visible="false">
                    <div>
                        <h2 class="title" >Arama Sonuçlarý</h2>
                    </div>
                    <table>                       
                        <tr>
                            <td>
                            <asp:GridView ID="searchResultsView" runat="server" AutoGenerateColumns="true"  AllowPaging="True" GridLines="Horizontal" CellSpacing="10" ShowHeader="False">
                                <PagerSettings Mode="NextPreviousFirstLast" />
                                
                                
                            </asp:GridView>
                            </td>
                            <td style="width: 187px"><ajaxToolkit:HoverMenuExtender ID="hoverMenu" runat="server" TargetControlID="searchResultsView" PopDelay="25" PopupControlID="panelPopup" HoverCssClass="popupHover" PopupPosition="Left"></ajaxToolkit:HoverMenuExtender></td>
                            <td><asp:Panel ID="panelPopup" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="100px" Width="100px" CssClass="popupMenu">
                                <asp:Label ID="label1" runat="server" Text="bastým"></asp:Label>
                                </asp:Panel></td>
                        </tr>
                    </table>
                </asp:Panel> 
            </ContentTemplate>    
        </ajax:UpdatePanel>   
    </div>
</div>
			
			


</asp:Content>

