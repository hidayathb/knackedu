using BusinessLayer;
using CommonObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class termplan : System.Web.UI.Page
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
                var blCategories = new BLCategories();
                var subCategories = blCategories.LoadSubCategories(1, "DEMO");
                if (subCategories == null) return;

                var termPlans = subCategories.Where(sb => sb.CategoryCode != null
                                    && sb.CategoryCode.ToUpper() == "TERM").ToList();
                if (termPlans != null)
                {
                    drpTerm.DataSource = termPlans;
                    drpTerm.DataBind();
                    drpTerm.DataTextField = "SubCategoryName";
                    drpTerm.DataValueField = "SubCategoryId";
                    drpTerm.DataBind();                    
                }
                drpTerm.Items.Insert(0, new ListItem("Select", "0"));

                var admissionClasses = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "CLS").ToList();
                if (admissionClasses != null)
                {
                    drpClass.DataSource = admissionClasses;
                    drpClass.DataBind();
                    drpClass.DataTextField = "SubCategoryName";
                    drpClass.DataValueField = "SubCategoryId";
                    drpClass.DataBind();                   
                }
                drpClass.Items.Insert(0, new ListItem("Select", "0"));

                var subjects = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "SUBJECT").ToList();
                if (subjects != null)
                {
                    drpSubject.DataSource = subjects;
                    drpSubject.DataTextField = "SubCategoryName";
                    drpSubject.DataValueField = "SubCategoryId";
                    drpSubject.DataBind();
                }
                drpSubject.Items.Insert(0, new ListItem("Select", "0"));

                var months = subCategories.Where(sb => sb.CategoryCode != null
                            && sb.CategoryCode.ToUpper() == "MONTH").ToList();
                if (months != null)
                {
                    drpFrom.DataSource = months;
                    drpFrom.DataTextField = "SubCategoryName";
                    drpFrom.DataValueField = "SubCategoryId";
                    drpFrom.DataBind();

                    drpTo.DataSource = months;
                    drpTo.DataTextField = "SubCategoryName";
                    drpTo.DataValueField = "SubCategoryId";
                    drpTo.DataBind();

                    drpMonth.DataSource = months;
                    drpMonth.DataTextField = "SubCategoryName";
                    drpMonth.DataValueField = "SubCategoryId";
                    drpMonth.DataBind();
                }

                drpFrom.Items.Insert(0, new ListItem("Select", "0"));
                drpTo.Items.Insert(0, new ListItem("Select", "0"));
                drpMonth.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            try
            {
                var plans = new BOTermPlan();

                int planId = 0;
                if (ViewState["planId"] != null)
                    planId = Convert.ToInt16(ViewState["planId"]);

                plans.Id = planId;
                plans.Plan = Convert.ToInt16(drpTerm.SelectedValue);
                plans.From = Convert.ToInt16(drpFrom.SelectedValue);
                plans.To = Convert.ToInt16(drpTo.SelectedValue);
                plans.Class = Convert.ToInt16(drpClass.SelectedValue);
                plans.Month = Convert.ToInt16(drpMonth.SelectedValue);
                plans.Subject = Convert.ToInt16(drpSubject.SelectedValue);
                plans.Syllabus = txtSyllabus.Text;
                plans.HostCode = "DEMO";
                plans.UserId = 1;                
                plans.Status = "A";

                var isInserted = (new BLTermPlan()).InsertTermPlan(plans);
                if (isInserted == 1)
                {
                    LoadTermPlans();
                    GradeUpdatePanel.Update();
                    ResetControls();
                    lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg.Text = "Term plan saved successfully.";
                }
                else
                {
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblErrorMsg.Text = "Process failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                lblErrorMsg.Text = "Unable to save data.";
            }
        }

        private void ResetControls()
        {
            drpTerm.SelectedIndex = 0;
            drpFrom.SelectedIndex = 0;
            drpTo.SelectedIndex = 0;
            drpClass.SelectedIndex = 0;
            drpMonth.SelectedIndex = 0;
            drpSubject.SelectedIndex = 0;
            txtSyllabus.Text = string.Empty;

            ViewState["planId"] = null;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ResetControls();
        }

        protected void gvTermPlan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTermPlan.DataSource = ((List<BOCategories>)(ViewState["Plans"])).ToList();
            gvTermPlan.PageIndex = e.NewPageIndex;
            gvTermPlan.DataBind();
            GradeUpdatePanel.Update();
        }

        protected void gvTermPlan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    var values = e.CommandArgument.ToString().Split('|');
                    ViewState["planId"] = values[0];

                    var term = drpTerm.Items.FindByText(values[1]);
                    drpTerm.SelectedValue = term.Value;

                    var from = drpFrom.Items.FindByText(values[2]);
                    drpFrom.SelectedValue = from.Value;

                    var to = drpTo.Items.FindByText(values[3]);
                    drpTo.SelectedValue = to.Value;

                    var pclass = drpClass.Items.FindByText(values[4]);
                    drpClass.SelectedValue = pclass.Value;

                    var month = drpMonth.Items.FindByText(values[5]);
                    drpMonth.SelectedValue = month.Value;

                    var subject = drpSubject.Items.FindByText(values[6]);
                    drpSubject.SelectedValue = subject.Value;

                    txtSyllabus.Text = values[7];

                    drpTerm.Focus();
                }
                if (e.CommandName == "Del")
                {
                    var values = e.CommandArgument.ToString();
                    if (ViewState["planId"].ToString() == values)
                    {
                        ResetControls();
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                lblErrorMsg.Text = ex.Message;
            }
        }

        private void LoadTermPlans()
        {
            try
            {
                var termplans = new BLTermPlan();
                var dtPlans = termplans.LoadTermPlans(1, "DEMO");

                if (dtPlans != null)
                {
                    gvTermPlan.Visible = true;
                    gvTermPlan.DataSource = dtPlans;
                    gvTermPlan.DataBind();
                    ViewState["Plans"] = dtPlans;
                }
                else
                {
                    gvTermPlan.Visible = false;
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }
    }
}