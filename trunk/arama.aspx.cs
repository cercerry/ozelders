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
            FillCityDDList();
        }
    }
    private void FillCityDDList()
    {
        
        string connectionString=System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        string command="SELECT CityName FROM Sehirler";
        SqlDataSource sqlDataSource = new SqlDataSource("System.Data.SqlClient",connectionString, command);
        ddCity.DataTextField = "CityName";
        ddCity.DataValueField = "CityName";
        ddCity.DataSource = sqlDataSource;
        ddCity.DataBind();
    }
    protected void ddCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddVillage.Items.Clear();
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        SqlDataReader reader = null;
        bool hasVillage=false;
        try
        {
            conn.Open();
            string command = "SELECT VillageName FROM Ilceler as I INNER JOIN Sehirler as S ON I.CityId=S.CityId WHERE CityName='" + ddCity.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(command,conn);
            
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                hasVillage = true;
                ddVillage.Items.Add(reader[0].ToString());
            }
            if (!hasVillage)
            {
                ddVillage.Items.Add("Merkez");
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
}
