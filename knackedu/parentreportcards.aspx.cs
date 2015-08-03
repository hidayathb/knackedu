using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class parentreportcards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["menu"] = MenuNames.Parent;
            if (Session["parentstudentid"] != null)
            {
                var studentId = Session["parentstudentid"].ToString();
                LoadDetails(studentId);
                BindReportCard(studentId);
            }
            else
            {
                lblMsg.Text = "Student data is not available.";
            }
        }

        private void BindReportCard(string studentId)
        {
            var blCategories = new BLParent();
            var dtCategories = blCategories.LoadReportCards(1, "DEMO");

            if (dtCategories != null)
            {
                var studentReport = dtCategories.FirstOrDefault(c => c.AdmissionId == studentId);
                gvReport.Visible = true;
                gvReport.DataSource = dtCategories;
                gvReport.DataBind();
            }
            else
            {
                gvReport.Visible = false;
            }
        }

        private void LoadDetails(string studentId)
        {
            try
            {
                var blStudents = new BLCategories();
                var students = blStudents.LoadStudents(1, "DEMO");

                if (students != null && students.Count > 0)
                {
                    var student = students.FirstOrDefault(s => s.AdmissionId == studentId);
                    if (student != null)
                    {
                        lblstudent.Text = student.FirstName + "." + student.SurName;
                        lblsection.Text = student.ClassName + ", " + student.SectionName;
                        lbladmission.Text = student.AdmissionId;
                        lbldob.Text = student.DOB;
                        lbladdress.Text = student.ResAddress;
                        lblmob.Text = student.TeleNumber;
                        lbltel.Text = student.TeleNumber;
                        lblfathername.Text = student.FatherName;
                        lblmothername.Text = student.MotherName;
                    }
                }
                else
                {
                    lblMsg.Text = "Student data is not available.";
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}