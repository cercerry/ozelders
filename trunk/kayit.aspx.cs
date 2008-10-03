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

    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true )
        {
            InsertNewRecordToDatabase();
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
                sb.Append("INSERT INTO Kayit VALUES(");
                sb.Append("'" + txtUserName.Text + "',");
                sb.Append("'" + txtPassword.Text + "',");
                sb.Append("'" + txtName.Text + "',");
                sb.Append("'" + txtSurname.Text + "',");
                sb.Append("'" + txtBirthdate.Text + "',");
                sb.Append("'" + txtEmail.Text + "',");
                sb.Append("'" + txtPhoneNo.Text + "',");
                sb.Append("'" + txtAdress.Text + "',");
                sb.Append("'" + ddGender.SelectedIndex + "',");

                if (checkBoxIsSurname.Checked == true)
                    sb.Append("'1',");
                else
                    sb.Append("'0',");
                if (checkBoxIsPhone.Checked == true)
                    sb.Append("'1')");
                else
                    sb.Append("'0')");

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
    protected void userNameValidation(object sender, ServerValidateEventArgs e)
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        SqlDataReader reader = null;
        string id=null;
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT userId FROM Kayit WHERE userName='" + txtUserName.Text + "'", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                id = reader[0].ToString();
            }
        }
        finally
        {
            if (id == null && e.Value.Length>4)
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
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
