<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="about" class="post" runat="server">
				<h2 class="title">Merhaba..T�rkiye'nin en etkin e�itim ve �zel ders sitesine ho�geldiniz.</h2>
    </div>
	<!-- end #about -->
	
	<div class="post">
	    <div class="entry">
	        <table cellspacing="20px">
	            <tr>
	                <td><asp:Panel ID="panelOgretmen" runat="server" BorderStyle="Solid" >
	                    <h2>�gretmen B�l�m�</h2>
	                </asp:Panel></td>
	                <td><asp:Panel ID="panel�grenci" runat="server" BorderStyle="Solid">
	                    <h2>�grenci B�l�m�</h2>
	                </asp:Panel></td>
	            </tr>
	        </table>
	    </div>
	</div>    
</asp:Content>

