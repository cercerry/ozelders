<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hata.aspx.cs" Inherits="hata" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <ajaxToolkit:ToolkitScriptManager ID="toolkitScriptManager" runat="server" EnableScriptGlobalization="true"></ajaxToolkit:ToolkitScriptManager>
</div>

<div class="post">
    <div class="entry">
        <br />
        <br />
        <br />
        <br />
        <asp:Panel ID="panelHata" runat="server" Width="526px">
            <p>Girmek istediðiniz sayfaya ulaþým izniniz yoktur.Sayfaya ulaþmak için sisteme giriþ yapmanýz gerekiyor.</p> 
        </asp:Panel>
        <ajaxToolkit:RoundedCornersExtender ID="RoundedPanelHata" runat="server" TargetControlID="panelHata" Color="Black" BorderColor="Black" Corners="All"></ajaxToolkit:RoundedCornersExtender>
    </div>
</div>
</asp:Content>

