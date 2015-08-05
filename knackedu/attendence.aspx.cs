using BusinessLayer;
using CommonObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class attendence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropDowns();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            drpClass.SelectedIndex = 0;
            drpSection.SelectedIndex = 0;
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                var stundents = (List<BOStudents>)(ViewState["students"]);
                var selctStudents =
                    stundents.Where(s => s.Class == Convert.ToInt32(drpClass.SelectedValue) && s.Section == Convert.ToInt32(drpSection.SelectedValue));

                if (selctStudents != null && selctStudents.Count() > 0)
                {
                    gvStudentMarks.DataSource = selctStudents;
                    gvStudentMarks.DataBind();
                    btnSubmit.Visible = true;
                }
                else
                {
                    btnSubmit.Visible = false;
                    gvStudentMarks.DataSource = null;
                    gvStudentMarks.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }

        private void LoadDropDowns()
        {

            try
            {

                var blCategories = new BLCategories();
                var students = blCategories.LoadStudents(1, "DEMO");
                ViewState["students"] = students;

                var subCategories = blCategories.LoadSubCategories(1, "DEMO");
                if (subCategories == null) return;

                var sections = subCategories.Where(sb => sb.CategoryCode != null && sb.CategoryCode.ToUpper() == "SEC").ToList();
                if (sections != null)
                {
                    drpSection.DataSource = sections;
                    drpSection.DataBind();
                    drpSection.DataTextField = "SubCategoryName";
                    drpSection.DataValueField = "SubCategoryId";
                    drpSection.DataBind();
                }
                drpSection.Items.Insert(0, new ListItem("Select", "0"));

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

            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                if (gvStudentMarks.Rows.Count == 0) return;

                var students = new BOStudents();

                StringBuilder attendece = new StringBuilder();
                foreach (GridViewRow item in gvStudentMarks.Rows)
                {
                    var chk = (CheckBox)item.FindControl("chkSelect");
                    var lbl = (Label)item.FindControl("lblAdmissionId");
                    if (chk.Checked)
                        attendece.Append(lbl + "|" + "1" + ",");
                    else
                        attendece.Append(lbl + "|" + "0" + ",");
                }

                students.Presents = attendece.ToString();
                students.PresentDate = Convert.ToDateTime(txtattendencedate.Text);

                var isInserted = (new BLStudentMarks()).InsertAttendence(students);
                if (isInserted == 1)
                {
                    lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg.Text = "Attendence inserted successfully.";
                }
                else
                {
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblErrorMsg.Text = "Attendence insertion failed.";
                }
            }
            catch (Exception)
            {
            }
        }
    }
}