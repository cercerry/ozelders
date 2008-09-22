<%@ Page Language="C#" MasterPageFile="~/ozelders.master" AutoEventWireup="true" CodeFile="hata.aspx.cs" Inherits="a" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style2
    {
        width: 30px;
        height: 30px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img alt="uyarı!!!" class="post" src="images/uyari.jpg" /><asp:Label 
            ID="hataLabel" runat="server" Text="Label"></asp:Label>
</p>
</asp:Content>

