using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class parenttimetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["menu"] = MenuNames.Parent;
            if (!IsPostBack)
            {
                BindTimeTable();
            }
        }

        private void BindTimeTable()
        {
            try
            {
                var blCategories = new BLParent();
                var dtCategories = blCategories.LoadParentTimeTable(1);

                if (dtCategories != null)
                {
                    gvTimtable.Visible = true;
                    gvTimtable.DataSource = dtCategories;
                    gvTimtable.DataBind();
                }
                else
                {
                    gvTimtable.Visible = false;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}