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
       
    }
    protected void signButton_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(
            "Data Source=(local); Initial Catalog=kayitDatabase; Integrated Security=SSPI");
        SqlDataReader reader = null;
        try 
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT userName,password FROM  kayit", connection);
            reader = cmd.ExecuteReader();
            bool sifreFlag=false;
            bool kullaniciFlag = false;
            while (reader.Read()) 
            {
                if (reader["userName"].ToString() == signIn.Text)
                    if (reader["password"].ToString() == sifre.Text)
                        Response.Redirect("kullanici.aspx?isim=" + signIn.Text);
                    else
                        sifreFlag = true;
                else
                    kullaniciFlag = true;
            }
            if (sifreFlag)
                Response.Redirect("hata.aspx?hata=sifre");
            if (kullaniciFlag)
                Response.Redirect("hata.aspx?hata=kullanici");

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

    protected void newKayitLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("kayit.aspx");
    }
}
