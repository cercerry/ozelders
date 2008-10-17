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

public partial class kayit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillDDCityList();
            FillDDCourseCategory();
            FillDDUniversity();
            ddVillage.Items.Add("Ýlçe Seçiniz");
            ddUniversity.Items.Insert(0, "Üniversite Seçiniz");
            
        }
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true )
        {
            InsertNewRecordToDatabase();
        }
    }
    protected void btnFinishSigningUp_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            InsertOzelDersDetaylari();
            Response.Redirect("kullanici.aspx");
        }
    }

    private void InsertNewRecordToDatabase()
    {
            string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);
           

            try
            {
                connection.Open();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("UPDATE Kayit ");
                
                sb.Append("SET name='" + txtName.Text + "', ");
                sb.Append("surname='" + txtSurname.Text + "', ");
                sb.Append("birthdate='" + txtBirthdate.Text + "',");
                
                sb.Append("phoneNo='" + txtPhoneNo.Text + "', ");
                sb.Append("address='" + txtAdress.Text + "', ");
                sb.Append("gender='" + ddGender.SelectedIndex + "', ");

                if (checkBoxIsSurname.Checked == true)
                    sb.Append("isSurnameDisplayed='1', ");
                else
                    sb.Append("isSurnameDisplayed='0', ");
                if (checkBoxIsPhone.Checked == true)
                    sb.Append("isPhoneDisplayed='1' ");
                else
                    sb.Append("isPhoneDisplayed='0' ");

                sb.Append("WHERE userName='" + User.Identity.Name + "'");

                SqlCommand cmd = new SqlCommand(sb.ToString(), connection);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                if (connection != null)
                {
                    connection.Close();
                    kayitPanel.Visible = false;
                    PanelDersDetaylari.Visible = true;
                }
            }
    }
    private void InsertOzelDersDetaylari()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        try
        {  // insert data to KisiselBilgi //

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("DECLARE @userId INT , @CityId INT , @VillageId INT ,@UniId INT ");
            sb.Append("SET @userId = (SELECT userId FROM Kayit WHERE userName='"+User.Identity.Name+"') ");
            sb.Append("SET @CityId= (SELECT CityId FROM Sehirler WHERE CityName='"+ddCity.SelectedValue+"') ");
            sb.Append("SET @VillageId=(SELECT VillageId FROM Ilceler WHERE VillageName='"+ddVillage.SelectedValue+"' AND CityId=@CityId) ");
            sb.Append("SET @UniId=(SELECT UniversityId FROM Universiteler WHERE UniversityName='"+ddUniversity.SelectedValue+"') ");
            sb.Append("INSERT INTO KisiselBilgi (userId,CityId,VillageId,UniversityId,Tanitim,minValue,maxValue,Profession,isOurs) VALUES(");
            sb.Append("@userId,@CityId,@VillageId,@UniId,'");
            sb.Append(txtTanitim.Text + "','");
            sb.Append(txtMinValue.Text + "','");
            sb.Append(txtMaxValue.Text + "','");
            sb.Append(txtMeslek.Text + "','0')");

            string command = sb.ToString();
            SqlCommand cmd = new SqlCommand(command, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
        }
        finally
        {
            if (connection != null)
            {
                connection.Close();
            }
        }

        try
        {   // Insert Data to [Kullanici-DersYeri] //


            connection.Open();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("DECLARE @userId INT ");
            sb.Append("SET @userId = (SELECT userId FROM Kayit WHERE userName='" + User.Identity.Name + "') ");
            string command = sb.ToString();
            if (checkBoxOgretmen.Checked == true)
            {
                command = command + "INSERT INTO [Kullanici-DersYeri] VALUES(@userId,'1') ";
            }
            if (checkBoxOgrenci.Checked == true)
            {
                command = command + "INSERT INTO [Kullanici-DersYeri] VALUES(@userId,'2') ";
            }
            if (checkBoxEtud.Checked == true)
            {
                command = command + "INSERT INTO [Kullanici-DersYeri] VALUES(@userId,'3') ";
            }

            SqlCommand cmd = new SqlCommand(command, connection);
            cmd.ExecuteNonQuery();
        }
        finally
        {
            if (connection != null)
            {
                connection.Close();
            }
        }


            for(int i=0;i<listBoxSelectedDersler.Items.Count;i++)
            {
                try     // Insert Data to [Kullanici-Ders]
                {
                    connection.Open();
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("DECLARE @userId INT, @CategoryId INT , @TopicId INT ");
                    sb.Append("SET @userId = (SELECT userId FROM Kayit WHERE userName='" + User.Identity.Name + "') ");
                    sb.Append("SET @CategoryId = (SELECT CategoryId FROM DersKategori WHERE CategoryName='" + listBoxSelectedDersler.Items[i].Value.Split("--".ToCharArray())[0] + "') ");
                    sb.Append("SET @TopicId = (SELECT TopicId FROM DersKonu WHERE TopicName='" + listBoxSelectedDersler.Items[i].Value.Split("--".ToCharArray())[2] + "' AND CategoryId=@CategoryId) ");
                    sb.Append("INSERT INTO [Kullanici-Ders] VALUES(@userId,@CategoryId,@TopicId)");

                    SqlCommand cmd = new SqlCommand(sb.ToString(), connection);
                    cmd.ExecuteNonQuery();
                }
                finally
                {
                    if (connection != null)
                    {
                        connection.Close();
                    }
                }
            }

    }   

    

    private void FillDDCityList()
    {

        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        string command = "SELECT CityName FROM Sehirler";
        SqlDataSource sqlDataSource = new SqlDataSource("System.Data.SqlClient", connectionString, command);
        ddCity.DataValueField = "CityName";
        ddCity.DataTextField = "CityName";
        ddCity.DataSource = sqlDataSource;
        ddCity.DataBind();
    }
    private void FillDDCourseCategory()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        string command = "SELECT CategoryName FROM DersKategori";
        SqlDataSource sqlDataSource = new SqlDataSource("System.Data.SqlClient", connectionString, command);
        ddCourseCategory.DataValueField = "CategoryName";
        ddCourseCategory.DataTextField = "CategoryName";
        ddCourseCategory.DataSource = sqlDataSource;
        ddCourseCategory.DataBind();
    }
    private void FillDDUniversity()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        string command = "SELECT UniversityName FROM Universiteler";
        SqlDataSource sqlDataSource = new SqlDataSource("System.Data.SqlClient", connectionString, command);
        ddUniversity.DataValueField = "UniversityName";
        ddUniversity.DataTextField = "UniversityName";
        ddUniversity.DataSource = sqlDataSource;
        ddUniversity.DataBind();
    }

    protected void listBoxSelectedDerslerControl(object sender, ServerValidateEventArgs e)
    {
        if (listBoxSelectedDersler.Items.Count == 0)
        {
            e.IsValid = false;
        }
        else
        {
            e.IsValid = true;
        }
    }
    protected void ddCourseCategoryControl(object sender, ServerValidateEventArgs e)
    {
        if (ddCourseCategory.SelectedIndex == 0)
        {
            e.IsValid = false;
        }
        else
        {   
            ListItem item = new ListItem(ddCourseCategory.SelectedValue + "--" + ddCourseTopic.SelectedValue);
            if (listBoxSelectedDersler.Items.Contains(item))
            {
                e.IsValid = false;
            }
            else
            {
                e.IsValid = true;
            }
        }
    }
    protected void ddCityControl(object sender, ServerValidateEventArgs e)
    {
        if (ddCity.SelectedIndex == 0)
        {
            e.IsValid = false;
        }
        else
        {
            e.IsValid = true;
        }
    }
    protected void ddUniversityControl(object sender, ServerValidateEventArgs e)
    {
        if (ddUniversity.SelectedIndex == 0)
        {
            e.IsValid = false;
        }
        else
        {
            e.IsValid = true;
        }
    }
    protected void CompareValues(object sender, ServerValidateEventArgs e)
    {
        if (int.Parse(txtMaxValue.Text) >= int.Parse(txtMinValue.Text))
        {
            e.IsValid = true;
        }
        else
        {
            e.IsValid = false;
        }
    }
    protected void ControlForDersYeri(object sender, ServerValidateEventArgs e)
    {
        if (checkBoxOgretmen.Checked == false && checkBoxOgrenci.Checked == false && checkBoxEtud.Checked == false)
        {
            e.IsValid = false;
        }
        else
        {
            e.IsValid = true;
        }
    }
    protected void ddCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddVillage.Items.Clear();
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        SqlDataReader reader = null;

        try
        {
            conn.Open();
            string command = "SELECT VillageName FROM Ilceler as I INNER JOIN Sehirler as S ON I.CityId=S.CityId WHERE CityName='" + ddCity.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(command, conn);

            reader = cmd.ExecuteReader();
            while (reader.Read())
            {

                ddVillage.Items.Add(reader[0].ToString());
            }
        }
        finally
        {
            if (conn != null)
            {
                conn.Close();
            }
            if (reader != null)
            {
                reader.Close();
            }
        }
    }
    protected void ddCourseCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddCourseTopic.Items.Clear();
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        SqlDataReader reader = null;
        bool isFirst = true;

        try
        {
            conn.Open();
            string command = "SELECT TopicName FROM DersKonu as DKonu INNER JOIN DersKategori as DKate ON DKonu.CategoryId=DKate.CategoryId WHERE CategoryName='" + ddCourseCategory.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(command, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (isFirst)
                {
                    isFirst = false;
                }
                else
                {
                    ddCourseTopic.Items.Add(reader[0].ToString());
                }
            }
        }
        finally
        {
            if (conn != null)
            {
                conn.Close();
            }
            if (reader != null)
            {
                reader.Close();
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {   
        
        if (ddCourseCategory.SelectedIndex != 0)
        {
            ListItem item = new ListItem(ddCourseCategory.SelectedValue + "--" + ddCourseTopic.SelectedValue);
            if (!listBoxSelectedDersler.Items.Contains(item))
            {
                listBoxSelectedDersler.Items.Add(ddCourseCategory.SelectedValue + "--" + ddCourseTopic.SelectedValue);
            }
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        listBoxSelectedDersler.Items.Remove(listBoxSelectedDersler.SelectedItem);
    }
    
}
