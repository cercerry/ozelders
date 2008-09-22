using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class kullanici : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void profilLinkButton_Click(object sender, EventArgs e)
    {
        profilPanel.Visible = true;
        guncellePanel.Visible = false;
        ilanlarimPanel.Visible = false;
        mesajKutusuPanel.Visible = false;
    }
    protected void ProilGuncelleLinkButton_Click(object sender, EventArgs e)
    {
        profilPanel.Visible = false;
        guncellePanel.Visible = true;
        ilanlarimPanel.Visible = false;
        mesajKutusuPanel.Visible = false;

    }
    protected void ilanLinkButton_Click(object sender, EventArgs e)
    {
        profilPanel.Visible = false;
        guncellePanel.Visible = false;
        ilanlarimPanel.Visible = true;
        mesajKutusuPanel.Visible = false;
    }
    protected void mesajKutusu_Click(object sender, EventArgs e)
    {
        profilPanel.Visible = false;
        guncellePanel.Visible = false;
        ilanlarimPanel.Visible = false;
        mesajKutusuPanel.Visible = true;
    }
}
