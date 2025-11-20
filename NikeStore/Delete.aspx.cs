using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NikeStore
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            lblAreyousure.Visible = true;
            btnCancel.Visible = true;
            btnConfirm.Visible = true;  
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
            lblConfirmDelete.Visible = true;

            lblAreyousure.Visible = false;
            btnConfirm.Visible = false; 
            btnCancel.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            lblAreyousure.Visible = false;
            btnConfirm.Visible = false;
            btnCancel.Visible = false;
        }
    }
}