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
    public partial class studentmarks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["menu"] = MenuNames.Teacher;
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

                var classes = subCategories.Where(sb => sb.CategoryCode != null
                                        && sb.CategoryCode.ToUpper() == "CLS").ToList();
                if (classes != null)
                {
                    drpClass.DataSource = classes;
                    drpClass.DataBind();
                    drpClass.DataTextField = "SubCategoryName";
                    drpClass.DataValueField = "SubCategoryId";
                    drpClass.DataBind();
                }
                drpClass.Items.Insert(0, new ListItem("Select", "0"));
                drpRegNo.Items.Insert(0, new ListItem("Select", "0"));

                var sections = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "SEC").ToList();
                if (sections != null)
                {
                    drpSection.DataSource = sections;
                    drpSection.DataBind();
                    drpSection.DataTextField = "SubCategoryName";
                    drpSection.DataValueField = "SubCategoryId";
                    drpSection.DataBind();
                }
                drpSection.Items.Insert(0, new ListItem("Select", "0"));

                var examTypes = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "EXAMTYPE").ToList();
                if (examTypes != null)
                {
                    drpExamType.DataSource = examTypes;
                    drpExamType.DataBind();
                    drpExamType.DataTextField = "SubCategoryName";
                    drpExamType.DataValueField = "SubCategoryId";
                    drpExamType.DataBind();
                }
                drpExamType.Items.Insert(0, new ListItem("Select", "0"));

                var absentSubjects = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "SUBJECT").ToList();
                if (absentSubjects != null)
                {
                    lstAbsentSubjects.DataSource = absentSubjects;
                    lstAbsentSubjects.DataBind();
                    lstAbsentSubjects.DataTextField = "SubCategoryName";
                    lstAbsentSubjects.DataValueField = "SubCategoryId";
                    lstAbsentSubjects.DataBind();
                }
                ViewState["subjects"] = absentSubjects;
                lstAbsentSubjects.Items.Insert(0, new ListItem("None", "0"));

                var studentsInfo = blCategories.LoadStudents(1, "DEMO");
                ViewState["students"] = studentsInfo;
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }

        private void LoadStudents()
        {
            drpRegNo.Items.Clear();
            var studentsInfo = ((List<BOStudents>)(ViewState["students"]));
            if (studentsInfo != null)
            {
                var filterStudents = studentsInfo.Where(s => s.Section == Convert.ToInt32(drpSection.SelectedValue)
                                                            && s.Class == Convert.ToInt32(drpClass.SelectedValue));
                drpRegNo.DataSource = filterStudents;
                drpRegNo.DataTextField = "AdmissionId";
                drpRegNo.DataValueField = "Id";
                drpRegNo.DataBind();
            }
            


        }

        protected void btn_Click(object sender, EventArgs e)
        {
            try
            {
                var stdMarks = new BOStudentMarks();

                int termPlanId = 0;
                if (ViewState["planId"] != null)
                    termPlanId = Convert.ToInt16(ViewState["planId"]);

                stdMarks.Id = termPlanId;
                stdMarks.StudentId = Convert.ToInt16(drpRegNo.SelectedValue);
                stdMarks.ExamTypeId = Convert.ToInt16(drpExamType.SelectedValue);
                FillMarks(stdMarks);
                stdMarks.HostCode = "DEMO";
                stdMarks.UserId = 1;
                stdMarks.Status = "A";

                var isInserted = (new BLStudentMarks()).InsertStudentMarks(stdMarks);
                if (isInserted == 1)
                {
                    ResetControls();
                    lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg.Text = "Marks inserted successfully.";
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

        private void FillMarks(BOStudentMarks stdMarks)
        {
            var items = lstAbsentSubjects.Items.OfType<ListItem>();
            var subjects = (List<BOCategories>)ViewState["subjects"];

            StringBuilder marks = new StringBuilder();
            var hindiId = subjects.FirstOrDefault(s => s.SubCategoryName.ToUpper() == "HINDI");
            if (hindiId != null)
            {
                marks.Append(hindiId.SubCategoryId.ToString() + "|" +
                    ((txtHindi.Text.Trim().Length > 0) ? txtHindi.Text.Trim() : "-1" + ","));
            }

            var eng = subjects.FirstOrDefault(s => s.SubCategoryName.ToUpper() == "ENGLISH");
            if (eng != null)
            {
                marks.Append(eng.SubCategoryId.ToString() + "|" +
                    ((txtEnglish.Text.Trim().Length > 0) ? txtEnglish.Text.Trim() : "-1" + ","));
            }

            var maths = subjects.FirstOrDefault(s => s.SubCategoryName.ToUpper() == "MATHEMATICS");
            if (maths != null)
            {
                marks.Append(eng.SubCategoryId.ToString() + "|" +
                    ((txtMathematics.Text.Trim().Length > 0) ? txtMathematics.Text.Trim() : "-1" + ","));
            }

            stdMarks.Subjects = marks.ToString().TrimEnd(',');
        }

        protected void lstAbsentSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            var items = lstAbsentSubjects.Items.OfType<ListItem>();

            var isHindiAbsent = items.Any(h => h.Text.ToUpper() == "HINDI" && h.Selected);
            if (isHindiAbsent)
            {
                txtHindi.ReadOnly = true;
                txtHindi.Text = string.Empty;
            }
            else
            {
                txtHindi.ReadOnly = false;
            }

            var isMathsAbsent = items.Any(h => h.Text.ToUpper() == "MATHEMATICS" && h.Selected);
            if (isMathsAbsent)
            {
                txtMathematics.ReadOnly = true;
                txtMathematics.Text = string.Empty;
            }
            else
            {
                txtMathematics.ReadOnly = false;
            }

            var isEngAbsent = items.Any(h => h.Text.ToUpper() == "ENGLISH" && h.Selected);
            if (isEngAbsent)
            {
                txtEnglish.ReadOnly = true;
                txtEnglish.Text = string.Empty;
            }
            else
            {
                txtEnglish.ReadOnly = false;
            }

            updateSec.Update();
        }

        protected void drpRegNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpRegNo.SelectedIndex > 0)
            {
                var students = (List<BOStudents>)(ViewState["students"]);
                var student = students.FirstOrDefault(s => s.Id == Convert.ToInt32(drpRegNo.SelectedValue));
                if (student != null)
                {
                    txtStudentName.Text = student.FirstName;
                    return;
                }
            }

            txtStudentName.Text = string.Empty;
            updateSec.Update();
        }

        protected void drpClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStudents();
            updateSec.Update();
        }

        protected void drpSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStudents();
            updateSec.Update();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ResetControls();
        }

        private void ResetControls()
        {
            drpClass.SelectedIndex = 0;
            drpSection.SelectedIndex = 0;
            drpRegNo.SelectedIndex = 0;
            drpRegNo.Items.Clear();
            drpRegNo.Items.Insert(0, new ListItem("Select", "0"));
            lstAbsentSubjects.SelectedIndex = 0;

            txtHindi.Text = string.Empty;
            txtHindi.ReadOnly = false;

            txtEnglish.Text = string.Empty;
            txtEnglish.ReadOnly = false;

            txtMathematics.Text = string.Empty;
            txtMathematics.ReadOnly = false;
            //txtHindi.Text = string.Empty;
            //txtEnglish.Text = string.Empty;
            //txtMathematics.Text = string.Empty;
            //txtScience.Text = string.Empty;
            //txtSocialStudies.Text = string.Empty;
            //txtComputer.Text = string.Empty;
            //txtGK.Text = string.Empty;
            //txtSanskrit.Text = string.Empty;
            //txtDrwaing.Text = string.Empty;
        }

    }
}