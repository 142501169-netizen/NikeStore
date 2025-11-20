using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace NikeStore
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                    LoadShoeDetails(id);
            }
        }

        private void LoadShoeDetails(string id)
        {
            string connStr = ConfigurationManager.ConnectionStrings["NikeDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Shoes WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblName.Text = reader["Name"].ToString();
                    lblBrand.Text = reader["Brand"].ToString();
                    lblPrice.Text = Convert.ToDecimal(reader["Price"]).ToString("F2");
                    lblDescription.Text = reader["Discriptoin"].ToString();
                    imgShoe.Src = reader["Image"].ToString();
                    hiddenShoeId.Value = reader["Id"].ToString();
                }

                reader.Close();
            }

            // Load sizes
            rptSizes.DataSource = new string[] { "UK 6", "UK 7", "UK 8", "UK 9", "UK 10", "UK 11", "UK 12" };
            rptSizes.DataBind();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string id = hiddenShoeId.Value;
            string name = lblName.Text;
            string brand = lblBrand.Text;
            string price = lblPrice.Text;
            string image = imgShoe.Src;
            string size = Request.Form["shoeSize"];

            // ----------------------------
            // 1) ADD TO CART SESSION
            // ----------------------------
            DataTable dt;

            if (Session["Cart"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Name");
                dt.Columns.Add("Brand");
                dt.Columns.Add("Price");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("Image");
                dt.Columns.Add("Size");
            }
            else
            {
                dt = Session["Cart"] as DataTable;
            }

            bool exists = false;

            foreach (DataRow row in dt.Rows)
            {
                if (row["Id"].ToString() == id && row["Size"].ToString() == size)
                {
                    row["Quantity"] = Convert.ToInt32(row["Quantity"]) + 1;
                    exists = true;
                    break;
                }
            }

            if (!exists)
            {
                DataRow dr = dt.NewRow();
                dr["Id"] = id;
                dr["Name"] = name;
                dr["Brand"] = brand;
                dr["Price"] = price;
                dr["Quantity"] = 1;
                dr["Image"] = image;
                dr["Size"] = size;
                dt.Rows.Add(dr);
            }

            Session["Cart"] = dt;

           
            string safeJS =
                "showPopup('" +
                name.Replace("'", "\\'") + "', '" +
                size.Replace("'", "\\'") + "', '" +
                price.Replace("'", "\\'") + "', '" +
                image.Replace("'", "\\'") +
                "');";

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", safeJS, true);
        }


        }
    }
