using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NikeStore
{
    public partial class NikeProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadProducts();
        }

        private void LoadProducts()
        {
            string conStr = ConfigurationManager.ConnectionStrings["NikeDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Shoes", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptShoes.DataSource = dt;
                rptShoes.DataBind();
            }
        }
    }
}
