<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="arama.aspx.cs" Inherits="arama" Title="�zel �gretmen Arama Sayfas�" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true"></ajaxToolkit:ToolkitScriptManager>
</div>

<div id="about" class="post" runat="server">
	<h2 class="title">Detayl� arama yaparak �gretmeninizi bulabilirsiniz..</h2>
</div>

<div class="post">
	<div class="entry">
	    <ajax:UpdatePanel ID="updatePanel" runat="server" >
	        <ContentTemplate>
	        <div>
	            <asp:LinkButton ID="searchCriteriaLink" runat="server" Visible="false" Text="Arama Kriterleri" ForeColor="red" OnClick="searchCriteriaLink_Clicked"></asp:LinkButton>
	        </div>
	        <br />
	        <br />
	        <asp:Panel ID="searchCriteriaPanel" runat="server" >
	            <table cellspacing="15" style="width: 577px">
                    <tr>
                        <td><asp:CustomValidator ID="ddCityValidator" runat="server" ControlToValidate="ddCity" ValidationGroup="Search" OnServerValidate="ddCityControl" ErrorMessage="�ehir Se�iniz" Text="*"></asp:CustomValidator></td>
                        <td style="height: 22px">*�ehir :</td>
                        <td style="height: 22px; width: 147px;"><asp:DropDownList ID="ddCity" runat="server" Width="146px" AutoPostBack="True" OnSelectedIndexChanged="ddCity_SelectedIndexChanged" ></asp:DropDownList></td>
                        <td style="height: 22px">�l�e :</td>
                        <td style="width: 154px; height: 22px;"><asp:DropDownList ID="ddVillage" runat="server" Width="146px"></asp:DropDownList></td>         
                    </tr>
                    <tr>
                        <td><asp:CustomValidator ID="ddCourseCategoryValidator" runat="server" ControlToValidate="ddCourseCategory" ValidationGroup="Search" OnServerValidate="ddCourseCategoryControl" ErrorMessage="Ders Kategorisi Se�iniz" Text="*"> </asp:CustomValidator></td>
                        <td style="height: 36px">*Ders Kategori :</td>
                        <td style="height: 36px; width: 147px;"><asp:DropDownList ID="ddCourseCategory" runat="server" AutoPostBack="true" Width="146px" OnSelectedIndexChanged="ddCourseCategory_SelectedIndexChanged" ></asp:DropDownList></td>
                        <td style="height: 36px;">Ders Konu :</td>
                        <td style="height: 36px; width: 154px;"><asp:DropDownList ID="ddCourseTopic" runat="server" Width="146px" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td><asp:RequiredFieldValidator ID="txtMinValidator" runat="server" ControlToValidate="txtMinValue" ValidationGroup="Search" ErrorMessage="Minimum �cret Giriniz">*</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="txtMaxValidator" runat="server" ControlToValidate="txtMaxValue" ValidationGroup="Search" ErrorMessage="Maximum �cret Giriniz" Text=" *"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="compareValidator" runat="server" ValidationGroup="Search" OnServerValidate="CompareValues" ErrorMessage="Minumum �cret maximum �cretten b�y�k olamaz" Text="*"></asp:CustomValidator></td>
                        <td style="height: 45px">*�cret Aral��� :</td>
                        <td style="height: 45px; width: 147px;"><asp:TextBox ID="txtMinValue" runat="server" Width="30px" >0</asp:TextBox>
                            &nbsp; - &nbsp;
                            <asp:TextBox ID="txtMaxValue" runat="server" Width="30px">200</asp:TextBox> &nbsp;&nbsp;YTL</td>
                        <td style="height: 45px"><asp:RegularExpressionValidator ID="minValidator" runat="server" ControlToValidate="txtMinValue" ValidationGroup="Search" ValidationExpression="\d+" ErrorMessage="Ge�erli bir rakam giriniz.." Width="105px"></asp:RegularExpressionValidator></td>
                        <td style="height: 45px"><asp:RegularExpressionValidator ID="maxValidator" runat="server" ControlToValidate="txtMaxValue" ValidationGroup="Search" ValidationExpression="\d+" ErrorMessage="Ge�erli bir rakam giriniz.."></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>��retmenin �niversitesi :</td>
                        <td style="width: 147px"><asp:DropDownList ID="ddUniversity" runat="server" Width="146px" Font-Size="X-Small" Height="30px"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td><asp:CustomValidator ID="dersYeriValidator" runat="server" ValidationGroup="Search" OnServerValidate="ControlForDersYeri" ErrorMessage="En az bir ders yeri se�melisiniz" Text="*"></asp:CustomValidator></td>
                        <td>*Ders Yeri :</td>
                        <td style="width: 147px"><asp:CheckBox ID="checkBoxOgretmen" runat="server" Checked="true" Text="��retmenin Evi" /></td>
                        <td><asp:CheckBox ID="checkBoxOgrenci" runat="server" Checked="true" Text="��rencinin Evi" Width="106px" /></td>
                        <td><asp:CheckBox ID="checkBoxEtud" runat="server" Checked="true" Text="Et�d Merkezi" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Onayl� ��retmen :</td>
                        <td style="width:147px"><asp:CheckBox ID="checkBoxOnayl�" runat="server" Text="�stiyorum" Width="144px" /></td>
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
                        <td><asp:ValidationSummary ID="validationSummary" runat="server" ValidationGroup="Search" HeaderText="(*) ile g�sterilen alanlar� giriniz" DisplayMode="BulletList" /></td>
                        <td><ajaxToolkit:RoundedCornersExtender ID="RoundedPanelCriteria" runat="server" TargetControlID="searchCriteriaPanel" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender></td>
                    </tr>
                </table>
                </asp:Panel>
                
                
                <asp:Panel ID="searchResultsPanel" runat="server" Visible="false">
                    <div>
                        <h2 class="title" >Arama Sonu�lar�</h2>
                    </div>
                    <table width="100%">                       
                        <tr>
                            <td style="width:100%">
                            <asp:GridView ID="searchResultsView" runat="server"  AllowPaging="True" AutoGenerateColumns="false" GridLines="None" CellSpacing="-1" Width="100%">
                                <PagerSettings Mode="NextPreviousFirstLast" />
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Panel ID="PanelHeader" runat="server" Width="100%">
                                            <table width="100%">
                                                <tr>
                                                    <th style="color:White;width:5%"></th>
                                                    <th style="color:White;width:20%" align="left" >�sim</th>
                                                    <th style="color:White;width:20%" align="left">�l�e</th>
                                                    <th style="color:White;width:20%" align="left">Meslek</th>
                                                    <th style="width:35%;color:White" align="left" >�niversite</th>
                                                </tr>
                                            </table>
                                            </asp:Panel>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Panel ID="PanelGrid" runat="server" Width="100%">
                                                <table width="100%" id="tablegrid" runat="server">
                                                    <tr>
                                                        <td style="width:5%"><asp:Image ID="img" runat="server"  Height="20px" Width="20px" ImageUrl='<%# Eval("gender") %>' /></td>
                                                        <td style="width:20%"><a href='profile.aspx?id=<%# Eval("userId") %>' target="_blank" style="color:#4A5157" ><%# Eval("name") %></a></td>
                                                        <td style="width:20%"><a href='profile.aspx?id=<%# Eval("userId") %>' target="_blank" style="color:#4A5157" ><%# Eval("VillageName") %></a></td>
                                                        <td style="width:20%"><a href='profile.aspx?id=<%# Eval("userId") %>' target="_blank" style="color:#4A5157" ><%# Eval("Profession") %></a></td>
                                                        <td style="width:35%"><a href='profile.aspx?id=<%# Eval("userId") %>' target="_blank" style="color:#4A5157" ><%# Eval("UniversityName") %></a></td>
                                                        
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <ajaxToolkit:HoverMenuExtender 
                                                ID="hoverMenu" runat="server" 
                                                TargetControlID="PanelGrid" PopDelay="25" 
                                                PopupControlID="panelPopup" HoverCssClass="popupHover" 
                                                PopupPosition="Left">
                                            </ajaxToolkit:HoverMenuExtender>
                                            <asp:Panel ID="panelPopup" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="100px" Width="300px" CssClass="popupMenu">
                                                <table width="100%" id="bla" runat="server">
                                                    <tr>
                                                        <td>�sim :</td>
                                                        <td><%# Eval("name") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ya�ad��� yer:</td>
                                                        <td><%# Eval("VillageName") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Meslek :</td>
                                                        <td><%# Eval("Profession") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>�niversite</td>
                                                        <td><%# Eval("UniversityName") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><a href='profile.aspx?id=<%# Eval("userId") %>' target="_blank" >Daha fazla detay ve ileti�im i�in t�klay�n�z</a></td>
                                                    </tr>
                                                       
                                                </table>
                                            </asp:Panel>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle BackColor="WhiteSmoke" />
                                
                            </asp:GridView>
                            </td>
                        </tr>
                      </table>
                      
                    <br />
                    <ajaxToolkit:RoundedCornersExtender ID="RoundedPanelSearchResults" runat="server" TargetControlID="searchResultsPanel" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
                    
                </asp:Panel> 
            </ContentTemplate>    
        </ajax:UpdatePanel>   
    </div>
</div>
			
		


</asp:Content>

