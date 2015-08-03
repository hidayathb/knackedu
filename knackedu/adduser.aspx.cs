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
    public partial class adduser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["menu"] = MenuNames.MasterInfo;
                LoadDropDowns();
                BindUsers();
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
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var user = new BOUser();

            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastName.Text;
            user.Age = drpAge.SelectedItem.Text;
            user.Gender = drpGender.SelectedItem.Text;
            //TODO
            user.DOB = DateTime.Now.ToString();

            user.ContactNo = txtContactNo.Text;
            user.Qualification = Convert.ToInt32(drpQualification.SelectedValue);
            user.Address = txtAddress.Text;
            user.Basic = txtBasic.Text;
            user.DA = txtDA.Text;
            user.HRA = txtHRA.Text;
            user.ProfTax = txtProfTax.Text;
            user.ConvAllowance = txtConveyanceAllowance.Text;
            user.CapitalCostAllow = txtCapitalCostAllowance.Text;
            user.EnterAllowance = txtEntertainmentAllowance.Text;
            user.NetSalary = txtNetSalary.Text;
            user.Department = Convert.ToInt32(drpSelectDepartment.SelectedValue);
            user.empid = txtEmpId.Text;
            user.userid = txtUserId.Text;
            user.password = txtCreatePassword.Text;
            user.SeqQuestion = Convert.ToInt32(drpSecurityQuestion.SelectedValue);
            user.Answer = txtAnswer.Text;
            // TODO
            user.DateOfJoin = DateTime.Now.ToString(); ;
            user.CreatedBy = 1;
            user.ModifiedBy = 1;
            user.CreatedDate = DateTime.Now.ToString();
            user.ModifiedDate = DateTime.Now.ToString();

            var users = new BLCategories();
            string id = string.Empty;
            users.InsertUser(user, out id);
            lblErrorMsg.Text = "user created successfully.";
            BindUsers();
            ResetControls();
        }

        private void ResetControls()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            drpAge.SelectedIndex = 0;
            drpGender.SelectedIndex = 0;
            txtDateOfBirth.Text = string.Empty;
            txtContactNo.Text = string.Empty;
                drpQualification.SelectedIndex =0;
                txtAddress.Text = string.Empty;
                txtBasic.Text = string.Empty;
                txtDA.Text = string.Empty;
                txtHRA.Text = string.Empty; txtProfTax.Text = string.Empty;
                txtConveyanceAllowance.Text = string.Empty;
                txtEntertainmentAllowance.Text = string.Empty;
                txtCapitalCostAllowance.Text = string.Empty;
                txtNetSalary.Text = string.Empty;
                drpSelectDepartment.SelectedIndex = 0;
                txtEmpId.Text = string.Empty;
                txtCreatePassword.Text = string.Empty;
                txtCreateUserId.Text = string.Empty;
                drpSecurityQuestion.SelectedIndex = 0; txtAnswer.Text = string.Empty;
                txtDateOfJoin.Text = string.Empty;

        }

        private void BindUsers()
        {
            try
            {
                var blStudents = new BLCategories();
                var dtStuidents = blStudents.LoadUsers(1, "DEMO");

                if (dtStuidents != null)
                {
                    gvGradeSystem.Visible = true;
                    gvGradeSystem.DataSource = dtStuidents;
                    gvGradeSystem.DataBind();
                    ViewState["users"] = dtStuidents;
                }
                else
                {
                    gvGradeSystem.Visible = false;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ResetControls();
        }
    }
}