using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class parentdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["menu"] = MenuNames.Parent;
                if (Session["parentstudentid"] != null)
                {
                    var studentId = Session["parentstudentid"].ToString();
                    LoadDetails(studentId);
                }
                else
                {
                    lblMsg.Text = "Student data is not available.";
                }
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
                    var student = students.FirstOrDefault(s=>s.AdmissionId == studentId);
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