using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AimEmp_PWA
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void install_OnClick(object sender, EventArgs e)
        {
            //Install app code here

        }
        protected void aimEntry_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("./aimForm.aspx");
        }

        protected void aimEmp_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("./Index.aspx");
        }
    }
}