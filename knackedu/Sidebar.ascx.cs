using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class Sidebar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["menu"] != null)
            {
                var menu = (MenuNames)Enum.Parse(typeof(MenuNames), Session["menu"].ToString());
                switch (menu)
                {
                    case MenuNames.MasterInfo:
                        divMasterInfo.Visible = true;
                        break;
                    case MenuNames.Edit:
                        divedit.Visible = true;
                        break;
                    case MenuNames.Accountant:
                        divAccountant.Visible = true;
                        break;
                    case MenuNames.Report:
                        divreport.Visible = true;
                        break;
                    case MenuNames.Teacher:
                        divteacher.Visible = true;
                        break;
                    case MenuNames.Librarian:
                        divlibrarian.Visible = true;
                        break;
                    case MenuNames.Management:
                        divmanagement.Visible = true;
                        break;
                    default:
                        break;
                }
            }
        }
    }
}