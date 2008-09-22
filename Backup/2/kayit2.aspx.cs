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
using System.Data.Sql;
using System.Data.SqlClient;


public partial class kayit2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            InsertNewRecordToDatabase();
        }
    }

    private void InsertNewRecordToDatabase()
    {
        string connectionString = System.Configuration.ConfigurationSettings.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);


        try
        {
            connection.Open();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("INSERT INTO Kayit VALUES(");
            sb.Append("'" + txtUserName + "'");
            sb.Append("'" + txtPassword + "'");
            sb.Append("'" + txtName + "'");
            sb.Append("'" + txtSurname + "'");
            sb.Append("'" + txtBirthdate + "'");
            sb.Append("'" + txtEmail + "'");
            sb.Append("'" + txtPhoneNo + "'");
            sb.Append("'" + txtAdress + "'");
            sb.Append("'" + ddGender.SelectedIndex + "')");

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
