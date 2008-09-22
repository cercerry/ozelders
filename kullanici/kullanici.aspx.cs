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
using System.Collections.Specialized;
using System.Data.Sql;
using System.Data.SqlClient;
public partial class kullanici : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        isim.Text = Request.QueryString["isim"];
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        SqlConnection connection = new SqlConnection(
         "Data Source=(local); Initial Catalog=kayitDatabase; Integrated Security=SSPI");
        SqlDataReader reader = null;
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT userName,name,surname,eMail,birthDate,telefon,adres,gender FROM  kayit", connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["userName"].ToString() == Request.QueryString["isim"])
                {
                    if (reader["gender"].ToString()=="0") {
                        bayImage.Visible = true;
                        bayanImage.Visible = false;
                    }

                    if (reader["gender"].ToString() == "1")
                    {
                        bayImage.Visible = false;
                        bayanImage.Visible = true;
                    }
                    adSoyadLabel.Text = reader["name"].ToString() + " " + reader["surname"].ToString();
                    telefonNumLabel.Text = reader["telefon"].ToString();
                    mailLabel.Text = reader["eMail"].ToString();
                    dogTarLabel.Text = reader["birthDate"].ToString();
                    adresLabel.Text = reader["adres"].ToString();
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
    protected void profilIncele_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        SqlConnection connection = new SqlConnection(
           "Data Source=(local); Initial Catalog=kayitDatabase; Integrated Security=SSPI");
        SqlDataReader reader = null;
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT userName,name,surname,eMail,birthDate,telefon FROM  kayit", connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["userName"].ToString() == Request.QueryString["isim"])
                {
                    adSoyadLabel.Text = reader["name"].ToString() + " " + reader["surname"].ToString();
                    telefonNumLabel.Text = reader["telefon"].ToString();
                    mailLabel.Text = reader["eMail"].ToString();
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
    protected void profilGuncelle_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
       
    }
    protected void dersAlanlar_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel2.Visible = false;
        Panel1.Visible = false;
        Panel4.Visible = false;
    }
    protected void messageBox_Click1(object sender, EventArgs e)
    {
        Panel4.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel1.Visible = false;
    }
    protected void guncelleButton_Click(object sender, EventArgs e)
    {

    }
}
