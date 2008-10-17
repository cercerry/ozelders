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

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["DatabaseConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);

        TextBox txtUserName = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
        TextBox txtPassword = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Password");
        TextBox txtEmail = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email");

        try
        {
            connection.Open();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("INSERT INTO Kayit(userName,password,email) VALUES(");
            sb.Append("'" + txtUserName.Text + "',");
            sb.Append("'" + txtPassword.Text + "',");
            sb.Append("'" + txtEmail.Text + "')");


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
