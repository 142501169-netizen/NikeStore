using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace NikeStore
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // -------------------- LOGIN --------------------
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = System.Configuration.ConfigurationManager
                                      .ConnectionStrings["NikeDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Log_in WHERE username=@username AND password=@password";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                con.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    Session["Username"] = username;
                    Response.Redirect("PlaceOrder.aspx");  // ← your redirect page
                }
                else
                {
                    lblLoginError.Visible = true;
                    lblLoginError.Text = "Invalid username or password ❌";
                }
            }
        }

        // -------------------- REGISTER --------------------
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtNewUsername.Text.Trim();
            string password = txtNewPassword.Text.Trim();

            string connectionString = System.Configuration.ConfigurationManager
                                      .ConnectionStrings["NikeDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Check if username already exists
                string checkQuery = "SELECT COUNT(*) FROM Log_in WHERE username=@username";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@username", username);

                con.Open();
                int exists = (int)checkCmd.ExecuteScalar();

                if (exists > 0)
                {
                    lblRegisterMsg.Visible = true;
                    lblRegisterMsg.Text = "Username already exists ❌";
                    return;
                }

                // Insert new user (Id must be manually added!)
                string insertQuery = "INSERT INTO Log_in (Id, username, password) VALUES ((SELECT ISNULL(MAX(Id),0)+1 FROM Log_in), @username, @password)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);

                insertCmd.Parameters.AddWithValue("@username", username);
                insertCmd.Parameters.AddWithValue("@password", password);

                insertCmd.ExecuteNonQuery();
                con.Close();

                lblRegisterMsg.Visible = true;
                lblRegisterMsg.Text = "Account created successfully ✔";

                // Auto-switch to login tab
                ScriptManager.RegisterStartupScript(this, GetType(), "SwitchToLogin", "showLogin();", true);
            }
        }
    }
}
