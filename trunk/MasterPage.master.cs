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
using System.Data.Sql;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        // password de enter a basýnca butona yönlendir.. 
        txtPassword.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + btnSignIn.UniqueID + "').click();return false;}} else {return true}; ");
        
        Page.Form.DefaultFocus = txtUserName.ClientID; // defaultFocus in master page
     //   if(Page.IsPostBack)
       //     btnSignIn.PostBackUrl = "kullanici.aspx";
    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        bool sifreFlag=false;
        bool kullaniciFlag=false;
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataReader reader = null;
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT userId,userName,password FROM  Kayit", connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["userName"].ToString() == txtUserName.Text)
                {
                    kullaniciFlag = false;
                    if (reader["password"].ToString() == txtPassword.Text)
                    {
                        break;
                    }
                    // Response.Redirect("kullanici.aspx?isim=" + reader["userName"].ToString());
                    else
                    {
                        
                        sifreFlag = true;
                        break;
                    }
                }
                else
                    kullaniciFlag = true;
            }
        }
        finally
        {
         //   btnSignIn.PostBackUrl = "";
            if (connection != null)
            {
                connection.Close();
            }
            if (reader != null)
            {
                reader.Close();
            }
        }
        if (sifreFlag)
        {
            hataLabel.Text = "Hatalý þifre!";         
        }
        if (kullaniciFlag)
        {
            hataLabel.Text = "Kullanýcý bulunamadý!";
        }
    }
}
