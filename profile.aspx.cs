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

public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            FillPanelKisiselBilgi();
            FillPanelDersler();
            FillPanelOzelDersBilgiVeTanitim();
        }
    }

    protected void MakeContact_Click(object sender, EventArgs e)
    {
        divProfile.Visible = false;
        divMessage.Visible = true;
        btnSendMessageUp.Visible = false;
    }
    protected void SendMessage_Click(object sender, EventArgs e)
    {
        panelSendMessage.Visible = false;
        PanelSuccessSending.Visible = true;
    }
    protected void lnkbtnProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("profile.aspx?id=" + Request.QueryString["id"]);
    }

    private void FillPanelKisiselBilgi()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataReader reader = null;

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("SELECT name,surname,birthdate,gender,phoneNo,isSurnameDisplayed,isPhoneDisplayed,UniversityName,Profession,VillageName,CityName ");
        sb.Append("FROM Kayit as K INNER JOIN ");
        sb.Append("KisiselBilgi as KB ON K.userId=KB.userId INNER JOIN ");
        sb.Append("Universiteler as U ON KB.UniversityId=U.UniversityId INNER JOIN ");
        sb.Append("Sehirler as S ON KB.CityId=S.CityId INNER JOIN ");
        sb.Append("Ilceler as I ON KB.VillageId=I.VillageId ");
        sb.Append("WHERE K.userId='");
        sb.Append(Request.QueryString["id"].ToString());
        sb.Append("'");

        string command=sb.ToString();

        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand(command, connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["isSurnameDisplayed"].ToString() == "1")
                {
                    lblTitleNameSurname.Text = reader["name"].ToString() + " " + reader["surname"].ToString();
                    lblAdSoyad.Text = reader["name"].ToString() + " " + reader["surname"].ToString();
                }
                else
                {
                    lblTitleNameSurname.Text = reader["name"].ToString() + " " + reader["surname"].ToString()[0] + ".";
                    lblAdSoyad.Text = reader["name"].ToString() + " " + reader["surname"].ToString()[0] + ".";
                }
                lblDogumTarihi.Text = reader["birthdate"].ToString();
                lblSehir.Text = reader["VillageName"].ToString() + " , " + reader["CityName"].ToString();
                lblMeslek.Text = reader["Profession"].ToString();
                lblUniversite.Text = reader["UniversityName"].ToString();
                if (reader["gender"].ToString() == "1")
                {
                    lblCinsiyet.Text = "Bay";
                    imageGender.ImageUrl = "images/hoca1.png";
                }
                else
                {
                    lblCinsiyet.Text = "Bayan";
                    imageGender.ImageUrl = "images/hoca2.png";
                }
                if (reader["isPhoneDisplayed"].ToString() == "1")
                {
                    lblTelefon.Text = reader["phoneNo"].ToString();
                }
                else
                {
                    lblTelefon.Text = "Ýrtibat telefonu öðretmen tarafýndan gizlenmiþtir";
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
    private void FillPanelDersler()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataReader reader = null;

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("SELECT CategoryName,TopicName FROM [Kullanici-Ders] as KD INNER JOIN ");
        sb.Append("DersKategori as DK ON KD.CategoryId=DK.CategoryId INNER JOIN ");
        sb.Append("DersKonu as DKo ON KD.TopicId=DKo.TopicId ");
        sb.Append("WHERE userId='");
        sb.Append(Request.QueryString["id"].ToString());
        sb.Append("'");

        string command = sb.ToString();
        ArrayList tmpCategory = new ArrayList();

        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand(command, connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (!tmpCategory.Contains(reader["CategoryName"].ToString()))
                {
                    HtmlTableRow row = new HtmlTableRow();
                    HtmlTableCell cell1 = new HtmlTableCell();
                    cell1.Align = "center";
                    cell1.Height = "30px";
                    cell1.Width = "25%";
                    cell1.InnerText = reader["CategoryName"].ToString();
                    HtmlTableCell cell2 = new HtmlTableCell();
                    cell2.Align = "center";
                    cell2.Height = "30px";
                    cell2.Width = "75%";
                    cell2.InnerText = reader["TopicName"].ToString();
                    row.Cells.Add(cell1);
                    row.Cells.Add(cell2);
                    tableDersler.Rows.Add(row);
                    tmpCategory.Add(reader["CategoryName"].ToString());
                }
                else
                {
                    for (int i = 0; i < tmpCategory.Count; i++)
                    {
                        if (reader["CategoryName"].ToString() == tmpCategory[i].ToString())
                        {
                            tableDersler.Rows[i + 1].Cells[1].InnerText += " , " + reader["TopicName"].ToString();
                            break;
                        }
                    }
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
    private void FillPanelOzelDersBilgiVeTanitim()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataReader reader = null;

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("SELECT Tanitim,minValue,maxValue,LocationName FROM KisiselBilgi as KB INNER JOIN ");
        sb.Append("[Kullanici-DersYeri] as KDY ON KB.userId=KDY.userId INNER JOIN ");
        sb.Append("DersYeri as DY ON KDY.LocationId=DY.LocationId ");
        sb.Append("WHERE KB.userId='");
        sb.Append(Request.QueryString["id"].ToString());
        sb.Append("'");

        string command = sb.ToString();
        bool firstLoc = true;
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand(command, connection);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lblUcret.Text = reader["minValue"].ToString() + " - " + reader["maxValue"].ToString() + " YTL arasý";
                paragrafTanitim.InnerText = reader["Tanitim"].ToString();
                if (firstLoc)
                {
                    lblDersYeri.Text = reader["LocationName"].ToString();
                    firstLoc = false;
                }
                else
                {
                    lblDersYeri.Text += " , "+ reader["LocationName"].ToString();
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
