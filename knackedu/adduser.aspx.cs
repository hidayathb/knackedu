using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class adduser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["menu"] = MenuNames.MasterInfo;
                LoadDropDowns();
            }
        }

        private void LoadDropDowns()
        {

            try
            {
                drpAge.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 18; i <= 60; i++)
                {
                    drpAge.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                var blCategories = new BLCategories();
                var subCategories = blCategories.LoadSubCategories(1, "DEMO");
                if (subCategories == null) return;

                var sections = subCategories.Where(sb => sb.CategoryCode != null && sb.CategoryCode.ToUpper() == "DEPT").ToList();
                if (sections != null)
                {
                    drpSelectDepartment.DataSource = sections;
                    drpSelectDepartment.DataBind();
                    drpSelectDepartment.DataTextField = "SubCategoryName";
                    drpSelectDepartment.DataValueField = "SubCategoryId";
                    drpSelectDepartment.DataBind();

                    drpSelectDepartment.Items.Insert(0, new ListItem("Select", "0"));
                }

                var admissionClasses = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "SEQ").ToList();
                if (admissionClasses != null)
                {
                    drpSecurityQuestion.DataSource = admissionClasses;
                    drpSecurityQuestion.DataBind();
                    drpSecurityQuestion.DataTextField = "SubCategoryName";
                    drpSecurityQuestion.DataValueField = "SubCategoryId";
                    drpSecurityQuestion.DataBind();

                    drpSecurityQuestion.Items.Insert(0, new ListItem("Select", "0"));
                }                
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Unable to load data.";
            }
        }
    }
}