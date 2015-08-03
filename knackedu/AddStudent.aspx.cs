using BusinessLayer;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace knackedu
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["menu"] = MenuNames.MasterInfo;
                LoadDropDowns();
                BindStudents();
            }
        }

        private void BindStudents()
        {
            try
            {
                var blStudents = new BLCategories();
                var dtStuidents = blStudents.LoadStudents(1, "DEMO");

                if (dtStuidents != null)
                {
                    gvStudents.Visible = true;
                    gvStudents.DataSource = dtStuidents;
                    gvStudents.DataBind();
                    ViewState["students"] = dtStuidents;
                }
                else
                {
                    gvStudents.Visible = false;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void LoadDropDowns()
        {

            try
            {
                var blCategories = new BLCategories();
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

                    drpSection.Items.Insert(0, new ListItem("Select", "0"));
                }

                var admissionClasses = subCategories.Where(sb => sb.CategoryCode != null
                                            && sb.CategoryCode.ToUpper() == "CLS").ToList();
                if (admissionClasses != null)
                {
                    drpAdmissiontoclass.DataSource = admissionClasses;
                    drpAdmissiontoclass.DataBind();
                    drpAdmissiontoclass.DataTextField = "SubCategoryName";
                    drpAdmissiontoclass.DataValueField = "SubCategoryId";
                    drpAdmissiontoclass.DataBind();

                    drpAdmissiontoclass.Items.Insert(0, new ListItem("Select", "0"));
                }

                var states = subCategories.Where(sb => sb.CategoryCode != null
                                           && sb.CategoryCode.ToUpper() == "STATE").ToList();
                if (states != null)
                {
                    drpState.DataSource = states;
                    drpState.DataBind();
                    drpState.DataTextField = "SubCategoryName";
                    drpState.DataValueField = "SubCategoryId";
                    drpState.DataBind();

                    drpState.Items.Insert(0, new ListItem("Select", "0"));
                }

                var cities = subCategories.Where(sb => sb.CategoryCode != null
                                           && sb.CategoryCode.ToUpper() == "CITY").ToList();
                if (cities != null)
                {
                    drpCity.DataSource = cities;
                    drpCity.DataBind();
                    drpCity.DataTextField = "SubCategoryName";
                    drpCity.DataValueField = "SubCategoryId";
                    drpCity.DataBind();

                    drpCity.Items.Insert(0, new ListItem("Select", "0"));
                }

                var districts = subCategories.Where(sb => sb.CategoryCode != null
                                           && sb.CategoryCode.ToUpper() == "DIST").ToList();
                if (districts != null)
                {
                    drpDistrict.DataSource = districts;
                    drpDistrict.DataBind();
                    drpDistrict.DataTextField = "SubCategoryName";
                    drpDistrict.DataValueField = "SubCategoryId";
                    drpDistrict.DataBind();

                    drpDistrict.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }

        private string BuildStudentInfo()
        {
            var studentsInfo = new studentinfo();
            studentsInfo.studentinfo1 = new studentinfoStudentinfo[1];
            studentinfoStudentinfo stuInfo = new studentinfoStudentinfo();

            //stuInfo.AdmissionId = txtAdmissionNumber.Text;
            stuInfo.AdmissionYear = drpAdmsYear.SelectedItem.Text;
            stuInfo.StudentClass = drpAdmissiontoclass.SelectedValue;
            stuInfo.StudentSection = drpSection.SelectedValue;
            stuInfo.FirstName = txtFirstName.Text;
            stuInfo.LastName = txtSurName.Text;
            stuInfo.Gender = drpGender.SelectedItem.Text;
            stuInfo.DateOfAdmission = txtDateOfAdmission.Text;
            stuInfo.PoB = txtPlaceOfBirth.Text;
            stuInfo.DOB = txtDateOfBirth.Text;
            stuInfo.Age = Convert.ToInt32(drpAge.SelectedItem.Text);
            stuInfo.MotherTongue = drpMothertongue.SelectedItem.Text;
            stuInfo.IdentityMark1 = txtIdentity1.Text;
            stuInfo.IdentityMark2 = txtIdentity2.Text;
            stuInfo.Caste = drpCity.SelectedValue;
            stuInfo.PhysicallyChallenged = rdblPhysicallyChanlenged.SelectedItem.Text;
            stuInfo.PreviousClasasYear = txtclassprevyear.Text;
            stuInfo.Photo = string.Empty;
            stuInfo.BusFacility = rdblstBusFacility.SelectedItem.Text;
            stuInfo.PreviousSchool = txtSchoolAttended.Text;
            stuInfo.PrevSchoolAddr = txtPrevSchoolAddress.Text;
            stuInfo.FatherName = txtFatherName.Text;
            stuInfo.MotherName = txtMotherName.Text;
            stuInfo.Email = txtEmail.Text;
            stuInfo.FatherOccupation = txtFathersOccupation.Text;
            stuInfo.MotherOccupation = txtMothersOccupation.Text;
            stuInfo.Nationality = txtNationality.Text;
            stuInfo.Religion = drpReligion.SelectedItem.Text;
            stuInfo.FatherIncome = txtFathersIncome.Text;
            stuInfo.Address = txtAddress.Text;
            stuInfo.State = Convert.ToInt32(drpState.SelectedValue);
            stuInfo.City = Convert.ToInt32(drpCity.SelectedValue);
            stuInfo.Distict = Convert.ToInt32(drpDistrict.SelectedValue);
            stuInfo.PinCode = txtpincode.Text;
            stuInfo.ContactNo = txtContactNo.Text;
            stuInfo.HostCode = "DEMO";
            stuInfo.Status = "A";
            stuInfo.SortSeq = 0;
            stuInfo.CreatedDate = DateTime.Now.ToString();
            stuInfo.CreatedBy = 1;
            stuInfo.ModifiedDate = DateTime.Now.ToString();
            stuInfo.ModifiedBy = 1;

            studentsInfo.studentinfo1[0] = stuInfo;
            return GetXMLString(studentsInfo);
        }

        public string GetXMLString(Object xmlObject)
        {
            String constructedString;
            using (MemoryStream ms = new MemoryStream())
            {
                StreamWriter textWriter = new StreamWriter(ms);
                // Convert the XML object with the information to string using XML Serialization
                XmlSerializer palletInfoSerializer = new XmlSerializer(xmlObject.GetType());
                palletInfoSerializer.Serialize(textWriter, xmlObject);

                using (StreamReader sr = new StreamReader(ms))
                {
                    ms.Position = 0;
                    constructedString = sr.ReadToEnd();
                    constructedString.Trim();
                    sr.Close();
                }
                textWriter.Close();

            }
            return constructedString;
        }

        protected void txtSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var data = BuildStudentInfo();
                string admissionId = string.Empty;
                var studentId = ViewState["studentid"].ToString();
                var isInserted = (new BLCategories()).InsertStudent(data, studentId, out admissionId);
                if (isInserted == -1)
                {
                    lblErrorMsg.Text = "Student inserted successfully.";
                    BindStudents();
                    ResetControls();
                    //upStudent.Update();
                }
                else
                {
                    lblErrorMsg.Text = "Process failed. Please try again.";
                }
            }
            catch (Exception)
            {
                lblErrorMsg.Text = "Unable to save data.";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ResetControls();

            //upStudent.Update();
        }

        private void ResetControls()
        {
            ViewState["studentid"] = null;
            drpAdmissiontoclass.SelectedIndex = 0;
            drpAdmsYear.SelectedIndex = 0;
            drpSection.SelectedIndex = 0;
            txtFirstName.Text = string.Empty;
            txtSurName.Text = string.Empty;
            drpAge.SelectedIndex = 0;
            txtDateOfAdmission.Text = string.Empty;
            txtPlaceOfBirth.Text = string.Empty;
            txtDateOfBirth.Text = string.Empty;
            drpGender.SelectedIndex = 0;
            txtIdentity1.Text = string.Empty;
            txtIdentity2.Text = string.Empty;
            drpCaste.Text = string.Empty;
            txtclassprevyear.Text = string.Empty;
            txtSchoolAttended.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtFatherName.Text = string.Empty;
            txtMotherName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtFathersOccupation.Text = string.Empty;
            txtMothersOccupation.Text = string.Empty;
            txtNationality.Text = string.Empty;
            drpReligion.Text = string.Empty;
            txtFathersIncome.Text = string.Empty;
            txtPrevSchoolAddress.Text = string.Empty;
            drpState.SelectedIndex = 0;
            drpCity.SelectedIndex = 0;
            drpDistrict.SelectedIndex = 0;
            txtpincode.Text = string.Empty;
            txtContactNo.Text = string.Empty;
        }
    }
}