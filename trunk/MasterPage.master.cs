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
            SqlCommand cmd = new SqlCommand("SELECT userName,password FROM  kayit", connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["userName"].ToString() == txtUserName.Text)
                {
                    if (reader["password"].ToString() == txtPassword.Text)
                        Response.Redirect("kullanici.aspx?isim=" + txtUserName.Text);
                    else
                        sifreFlag = true;
                }
                else
                    kullaniciFlag = true;
            }
        }
        finally
        {
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
            hataLabel.Text = "Hatalý þifre!";
        if (kullaniciFlag)
            hataLabel.Text = "Kullanici bulunamadý!";

    }
}
