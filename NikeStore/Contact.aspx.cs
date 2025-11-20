using System;

namespace NikeStore
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Just show the animated success popup instead of sending an actual email
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "showSuccessMessage();", true);
        }
    }
}
