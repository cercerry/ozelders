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
        if ((Page.PreviousPage != null) && (Page.PreviousPage.IsCrossPagePostBack))
        {
            TextBox tmpUserName = (TextBox)Page.PreviousPage.Master.FindControl("txtUserName");
            if (tmpUserName != null)
            {
                hiddenUserName.Value = tmpUserName.Text;
            }
            else
            {
                hiddenUserName = (HiddenField)Page.PreviousPage.Master.FindControl("hiddenUserName");   
            }
            
        }

        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataReader reader = null;
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT name,surname FROM  kayit WHERE userName='"+hiddenUserName.Value+"'", connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lblKullaniciAdSoyad.Text = reader["name"].ToString() + " " + reader["surname"].ToString();
                lblConnectionTime.Text = DateTime.Now.ToShortTimeString();       
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
