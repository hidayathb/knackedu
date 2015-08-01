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
    public partial class gradesystem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["menu"] = MenuNames.MasterInfo;
                LoadGradeSystem();
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

                var sections = subCategories.Where(sb => sb.SubCategoryCode != null && sb.SubCategoryCode.ToUpper() == "EXAMTYPE").ToList();
                if (sections != null)
                {
                    drpExamType.DataSource = sections;
                    drpExamType.DataBind();
                    drpExamType.DataTextField = "SubCategoryName";
                    drpExamType.DataValueField = "SubCategoryId";
                    drpExamType.DataBind();

                    drpExamType.Items.Insert(0, new ListItem("Select", "0"));
                }

                var admissionClasses = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "GRADE").ToList();
                if (admissionClasses != null)
                {
                    drpGrade.DataSource = admissionClasses;
                    drpGrade.DataBind();
                    drpGrade.DataTextField = "SubCategoryName";
                    drpGrade.DataValueField = "SubCategoryId";
                    drpGrade.DataBind();

                    drpGrade.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }

        private void LoadGradeSystem()
        {
            try
            {
                var blCategories = new BLGradeSystem();
                var dtGrades = blCategories.LoadGradeSystems(1, "DEMO");

                if (dtGrades != null)
                {
                    gvGradeSystem.Visible = true;
                    gvGradeSystem.DataSource = dtGrades;
                    gvGradeSystem.DataBind();
                    ViewState["Grades"] = dtGrades;
                }
                else
                {
                    gvGradeSystem.Visible = false;
                }
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
                var gradeSys = new BOGradeSytem();

                int catid = 0;
                if (ViewState["gradeid"] != null)
                    catid = Convert.ToInt16(ViewState["gradeid"]);

                gradeSys.Id = catid;
                gradeSys.FirstMarks = Convert.ToInt16(txtFirstMark.Text.Trim());
                gradeSys.SecondMarks = Convert.ToInt16(txtSecondMark.Text.Trim());
                gradeSys.HostCode = "DEMO";
                gradeSys.UserId = 1;
                gradeSys.ExamTypeId = Convert.ToInt16(drpExamType.SelectedValue);
                gradeSys.GradeId = Convert.ToInt16(drpGrade.SelectedValue);
                gradeSys.Marks = drpMarks.SelectedItem.Text;
                gradeSys.Status = "A";

                var isInserted = (new BLGradeSystem()).InsertGradeSystem(gradeSys);
                if (isInserted == -1)
                {
                    LoadGradeSystem();
                    GradeUpdatePanel.Update();
                    ResetControls();
                }
                else
                {
                    lblErrorMsg.Text = "Process failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Unable to save data.";
            }
        }

        private void ResetControls()
        {
            txtFirstMark.Text = string.Empty;
            txtSecondMark.Text = string.Empty;
            drpExamType.SelectedIndex = 0;
            drpGrade.SelectedIndex = 0;
            drpMarks.SelectedIndex = 0;
            ViewState["gradeid"] = null;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ResetControls();
        }

        protected void gvGradeSystem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGradeSystem.DataSource = ((List<BOCategories>)(ViewState["Grades"])).ToList();
            gvGradeSystem.PageIndex = e.NewPageIndex;
            gvGradeSystem.DataBind();
            GradeUpdatePanel.Update();
        }

        protected void gvGradeSystem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    var values = e.CommandArgument.ToString().Split('|');
                    ViewState["gradeid"] = values[0];
             
                    txtFirstMark.Text = values[1];
                    txtSecondMark.Text = values[2];
                    
                    drpExamType.SelectedValue = values[3];
                    drpGrade.SelectedValue = values[4];
                    var item = drpMarks.Items.FindByText(values[5]);
                    drpMarks.SelectedValue = item.Value;

                    txtFirstMark.Focus();
                }
                if (e.CommandName == "Del")
                {
                    var values = e.CommandArgument.ToString();
                    if (ViewState["gradeid"].ToString() == values)
                    {
                        ResetControls();
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}