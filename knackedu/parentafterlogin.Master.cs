using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class parentafterlogin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["parentname"] != null)
                loginUserName.InnerText = Session["parentname"].ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}