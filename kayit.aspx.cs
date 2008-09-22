using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class kayit : System.Web.UI.Page
{
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(
            "Data Source=(local);Initial Catalog=kayitDatabase;Integrated Security=SSPI");

        try
        {
            connection.Open();
            string command = "INSERT INTO Kayit VALUES('" + idText.Text + "','" + password.Text + "','" + ad.Text + "','" + soyad.Text + "','" + dogTar.Text + "','" + eposta.Text + "','" + cinsiyetSecim.SelectedIndex + "','" + adres.Text + "','" + telefon.Text + "')";
            SqlCommand cmd = new SqlCommand(command, connection);
            cmd.ExecuteNonQuery();
        }
        finally
        {
            if (connection != null)
            {
                connection.Close();
            }
            Response.Redirect("default.aspx");
        }
        
        
    }
}