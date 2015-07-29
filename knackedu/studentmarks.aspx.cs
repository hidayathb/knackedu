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
                lstAbsentSubjects.Items.Insert(0, new ListItem("Select", "0"));

                var studentsInfo = blCategories.LoadStudents(1, "DEMO");
                ViewState["students"] = studentsInfo;
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Unable to load data.";
            }
        }

        private void LoadStudents()
        {
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
            drpRegNo.Items.Insert(0, new ListItem("Select", "0"));         
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
                stdMarks.HostCode = "DEMO";
                stdMarks.UserId = 1;
                stdMarks.Status = "A";

                var isInserted = (new BLStudentMarks()).InsertStudentMarks(stdMarks);
                if (isInserted == -1)
                {
                   //
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

        protected void lstAbsentSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            var items = lstAbsentSubjects.Items.OfType<ListItem>();
            
            var isHindiAbsent = items.Any(h => h.Text.ToUpper() == "HINDI" && h.Selected);
            if (isHindiAbsent)
                txtHindi.ReadOnly = true;
            else
                txtHindi.ReadOnly = false;

            var isEngAbsent = items.Any(h => h.Text.ToUpper() == "ENGLISH" && h.Selected);
            if (isEngAbsent)
                txtEnglish.ReadOnly = true;
            else
                txtEnglish.ReadOnly = false;

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
    }
}