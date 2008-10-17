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

public partial class arama : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillDDCityList();
            FillDDCourseCategory();
            FillDDUniversity();
            ddUniversity.Items.Insert(0, "Farketmez");
            ddVillage.Items.Add("�l�e Se�iniz");
            ddCourseTopic.Items.Add("T�m Konular");
        }
    }
   


    private void FillDDCityList()
    {
        
        string connectionString=System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        string command="SELECT CityName FROM Sehirler";
        SqlDataSource sqlDataSource = new SqlDataSource("System.Data.SqlClient",connectionString, command);
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
    protected void ddCourseCategoryControl(object sender, ServerValidateEventArgs e)
    {
        if (ddCourseCategory.SelectedIndex == 0)
        {
            e.IsValid = false;
        }
        else
        {
            e.IsValid = true;
        }
    }
    protected void CompareValues(object sender ,ServerValidateEventArgs e)
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
            SqlCommand cmd = new SqlCommand(command,conn);
            
            reader = cmd.ExecuteReader();

            ddVillage.Items.Insert(0, "T�m il�eler");
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

        try
        {
            conn.Open();
            string command = "SELECT TopicName FROM DersKonu as DKonu INNER JOIN DersKategori as DKate ON DKonu.CategoryId=DKate.CategoryId WHERE CategoryName='" + ddCourseCategory.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(command, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ddCourseTopic.Items.Add(reader[0].ToString());
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
    protected void searchCriteriaLink_Clicked(object sender, EventArgs e)
    {
        searchCriteriaPanel.Visible = true;
        searchResultsPanel.Visible = false;
        searchCriteriaLink.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        
        if (Page.IsValid == true)
        {
            bool firstCheckbox = true;

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("SELECT DISTINCT isOurs,isSurnameDisplayed,gender,KB.userId,name,surname,UniversityName,Profession,VillageName,CityName FROM KisiselBilgi as KB INNER JOIN "); //Ki�iselBilgi.db
            sb.Append("Universiteler as U ON KB.UniversityId=U.UniversityId INNER JOIN "); //Universiteler.db
            sb.Append("Sehirler as S ON KB.CityId=S.CityId INNER JOIN "); //Sehirler.db
            sb.Append("Ilceler as I ON KB.VillageId=I.VillageId INNER JOIN "); //Ilceler.db
            sb.Append("Kayit as K ON K.userId=KB.userId INNER JOIN "); //Kayit.db
            sb.Append("[Kullanici-Ders] as KD ON K.userID=KD.userID INNER JOIN "); //Kullanici-Ders.db
            sb.Append("DersKategori as DK ON KD.CategoryId=DK.CategoryId INNER JOIN "); //DersKategori.db
            sb.Append("DersKonu as Dko ON KD.TopicId=Dko.TopicId INNER JOIN "); // DersKonu.db
            sb.Append("[Kullanici-DersYeri] as KDY ON K.userId=KDY.userId "); // Kullanici-DersYeri.db
            sb.Append("WHERE CityName='" + ddCity.SelectedValue + "' AND "); // cityName
            if (ddVillage.SelectedIndex == 0)
            {
                // T�m il�eler
            }
            else
            {
                sb.Append("VillageName='" + ddVillage.SelectedValue + "' AND ");  // villageName
            }
            sb.Append("CategoryName='" + ddCourseCategory.SelectedValue + "' AND "); // courseCategory
            if (ddCourseTopic.SelectedIndex == 0)  
            {
                // T�m Konular
            }
            else
            {
                sb.Append("TopicName='" + ddCourseTopic.SelectedValue + "' AND "); // courseTopic
            }
            if (ddUniversity.SelectedIndex == 0) 
            {
                // �niversite farketmez
            }
            else
            {
                sb.Append("UniversityName='" + ddUniversity.SelectedValue + "' AND "); // universityName
            }
            if (checkBoxOgretmen.Checked)
            {   
                sb.Append("( LocationId='1' ");
                firstCheckbox=false;
            }
            if (checkBoxOgrenci.Checked)
            {
                if (firstCheckbox)
                {
                    sb.Append("( LocationId='2' ");
                    firstCheckbox = false;
                }
                else
                {
                    sb.Append("OR LocationId='2' ");
                }
            }
            if (checkBoxEtud.Checked)
            {
                if (firstCheckbox)
                {
                    sb.Append("( LocationId='3' ");
                    firstCheckbox = false;
                }
                else
                {
                    sb.Append("OR LocationId='3' ");
                }
            }
            if (checkBoxOnayl�.Checked)
            {
                sb.Append(") AND isOurs='1' AND ");
            }
            else
            {
                sb.Append(") AND ");
            }

            sb.Append("( minValue <= "+ int.Parse(txtMaxValue.Text)+ " AND");
            sb.Append(" maxValue >= " + int.Parse(txtMinValue.Text)+ " ) ");
            sb.Append("ORDER BY isOurs ASC");

            string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
            string command = sb.ToString();
            
            
            //SqlDataSource sqlDataSource = new SqlDataSource("System.Data.SqlClient", connectionString, command);
            //searchResultsView.DataSource = sqlDataSource;
           // searchResultsView.DataBind();
            SqlConnection conn=new SqlConnection(connectionString);
            SqlDataReader reader=null;
            DataTable table = new DataTable();
            DataColumn column;
            column=new DataColumn("name");
            table.Columns.Add(column);
            column=new DataColumn("VillageName");
            table.Columns.Add(column);
            column=new DataColumn("Profession");
            table.Columns.Add(column);
            column=new DataColumn("UniversityName");
            table.Columns.Add(column);
            column = new DataColumn("gender");
            table.Columns.Add(column);
            column = new DataColumn("userId");
            table.Columns.Add(column);
            
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(command, conn);
                reader = cmd.ExecuteReader();
                
                while (reader.Read())
                {
                    DataRow row;
                    row = table.NewRow();
                    if (reader["gender"].ToString() == "1")
                    {
                        row["gender"] = "images/hoca1.png";
                    }
                    else
                    {
                        row["gender"] = "images/hoca2.png";
                    }
                    if(reader["isSurnameDisplayed"].ToString()=="0"){
                        row["name"] = reader["name"].ToString() + " " + reader["surname"].ToString()[0] + ".";
                    }
                    else{
                        row["name"] = reader["name"].ToString() + " " + reader["surname"].ToString();
                    }
                    row["VillageName"] = reader["VillageName"].ToString();
                    row["Profession"] = reader["Profession"].ToString();
                    row["UniversityName"] = reader["UniversityName"].ToString();
                    row["userId"] = reader["userId"].ToString();
                    table.Rows.Add(row);
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
           
            searchResultsView.DataSource = table;
            searchResultsView.DataBind();
            
            searchResultsPanel.Visible = true;
            searchCriteriaPanel.Visible = false;
            searchCriteriaLink.Visible = true;
        }
    }
}
