<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="arama.aspx.cs" Inherits="arama" Title="Untitled Page" %>
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
	            <table cellspacing="20">
                    <tr>
                        <td>Þehir :</td>
                        <td><asp:DropDownList ID="ddCity" runat="server" Width="146px" AutoPostBack="True" OnSelectedIndexChanged="ddCity_SelectedIndexChanged" ></asp:DropDownList></td>
                        <td>Ýlçe :</td>
                        <td><asp:DropDownList ID="ddVillage" runat="server" Width="146px"></asp:DropDownList></td>         
                    </tr>
                    <tr>
                        <td style="height: 36px">Ders Kategori :</td>
                        <td style="height: 36px"><asp:DropDownList ID="ddCourseCategory" runat="server" AutoPostBack="true" Width="146px" OnSelectedIndexChanged="ddCourseCategory_SelectedIndexChanged" ></asp:DropDownList></td>
                        <td style="height: 36px">Ders Konu :</td>
                        <td style="height: 36px"><asp:DropDownList ID="ddCourseTopic" runat="server" Width="146px" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        
                    </tr>
                </table>
            </ContentTemplate>    
        </ajax:UpdatePanel>   
    </div>
</div>
			
			


</asp:Content>

