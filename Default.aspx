<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="about" class="post" runat="server">
				<h2 class="title">Merhaba..Türkiye'nin en etkin eðitim ve özel ders sitesine hoþgeldiniz.</h2>
    </div>
	<!-- end #about -->
	
	<div class="post">
	    <div class="entry">
	        <table cellspacing="20px">
	            <tr>
	                <td><asp:Panel ID="panelOgretmen" runat="server" BorderStyle="Solid" >
	                    <h2>Ögretmen Bölümü</h2>
	                </asp:Panel></td>
	                <td><asp:Panel ID="panelÖgrenci" runat="server" BorderStyle="Solid">
	                    <h2>Ögrenci Bölümü</h2>
	                </asp:Panel></td>
	            </tr>
	        </table>
	    </div>
	</div>    
</asp:Content>

