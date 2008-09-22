<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="kullanici.aspx.cs" Inherits="kullanici" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="tool" runat="server" ></ajaxToolkit:ToolkitScriptManager>
    <ajax:UpdatePanel id="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btn" runat="server" Text="bas" OnClick="btn_Click"/>
            <asp:Label ID="lbl" runat="server" ></asp:Label>
        </ContentTemplate>
    </ajax:UpdatePanel>
    
  

</asp:Content>

