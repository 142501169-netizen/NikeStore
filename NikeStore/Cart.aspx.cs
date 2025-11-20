using System;
using System.Data;
using System.Web.UI;

namespace NikeStore
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            // Load cart from session
            DataTable dt = Session["Cart"] as DataTable;

            if (dt != null)
            {
               // Repeater1.DataSource = dt;
               // Repeater1.DataBind();
            }
        }

        protected void rptCart_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                string id = e.CommandArgument.ToString();

                DataTable dt = Session["Cart"] as DataTable;

                if (dt != null)
                {
                    // Safe delete using index loop
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["Id"].ToString() == id)
                        {
                            dt.Rows.RemoveAt(i);
                            break;
                        }
                    }

                    dt.AcceptChanges();
                    Session["Cart"] = dt;

                    LoadCart();
                }
            }
        }

        protected void btnProcessPayment_Click(object sender, EventArgs e)
        {
            string method = hfPaymentMethod.Value;
            string last4 = hfCardLast4.Value;

            // OPTIONAL: Save order to DB here

            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "popup", "showSuccessPopup();", true);
        }
    }
}
