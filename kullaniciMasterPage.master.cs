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

public partial class kullaniciMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataReader reader = null;
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT userName,name,surname FROM  kayit", connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["username"].ToString() == Request.QueryString["isim"])
                {
                    lblKullaniciAdSoyad.Text = reader["name"].ToString() + " " + reader["surname"].ToString();
                    lblConnectionTime.Text = DateTime.Now.ToShortTimeString();
                }
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
    }
}
