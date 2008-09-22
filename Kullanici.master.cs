using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
public partial class ozelders : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(
            "Data Source=(Local); Initial Catalog=kayitDatabase; Integrated Security=SSPI");
        SqlDataReader reader = null;
        try
        {

            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT userName,name, surname FROM kayit", connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (Request.QueryString["isim"] == reader["userName"].ToString())
                {
                    signedLabel.Text = reader["name"].ToString() + " " + reader["surName"].ToString();
                    connectionTimeLabel.Text = DateTime.Now.ToLongTimeString();
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
