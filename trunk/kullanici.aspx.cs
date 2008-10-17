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

public partial class kullanici : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataReader reader = null;
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT username,gender FROM  kayit", connection); // düzeltilecek
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["username"].ToString() == User.Identity.Name)
                {
                    if (reader["gender"].ToString() == "2")     ////////
                        imageBayanResim.Visible = true;         // Image
                    if (reader["gender"].ToString() == "1")     //      
                        imageBayResim.Visible = true;           ////////    

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
