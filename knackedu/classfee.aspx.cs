using BusinessLayer;
using CommonObject;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class classfee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var blCategories = new BLCategories();
                var subCategories = blCategories.LoadSubCategories(1, "DEMO");
                if (subCategories == null) return;

                var classes = subCategories.Where(sb => sb.CategoryCode != null
                                        && sb.CategoryCode.ToUpper() == "TERM").ToList();

                if (classes != null)
                {
                    AddControls(classes);
                }

            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("Dynamic")).ToList();
            int i = 1;
            foreach (string key in keys)
            {
                AddControl(i);
                i++;
            }
        }

        private void LoadDropDowns()
        {
            var blCategories = new BLCategories();
            var subCategories = blCategories.LoadSubCategories(1, "DEMO");
            if (subCategories == null) return;

            var classes = subCategories.Where(sb => sb.CategoryCode != null
                                    && sb.CategoryCode.ToUpper() == "CLS").ToList();
            if (classes != null)
            {
                drpclass.DataSource = classes;
                drpclass.DataBind();
                drpclass.DataTextField = "SubCategoryName";
                drpclass.DataValueField = "SubCategoryId";
                drpclass.DataBind();
            }
            drpclass.Items.Insert(0, new ListItem("Select", "0"));
        }

        private void AddControl(int i)
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            div.ID = "divS" + i;
            div.Style.Add("class", "form-group");
            div.Attributes.Add("runat", "server");

            Label lbl = new Label();
            lbl.CssClass = "control-label";
            lbl.ID = "lblDynamic" + i;

            var txt = new TextBox();
            txt.ID = "txtDynamic" + i;
            txt.CssClass = "form-control txtgrade";

            div.Controls.Add(lbl);
            div.Controls.Add(txt);

            divterms.Controls.Add(div);
        }

        private void AddControls(List<BOCategories> terms)
        {
            int i = 1;
            foreach (BOCategories term in terms)
            {
                HtmlGenericControl div = new HtmlGenericControl("div");
                div.ID = "divS" + i;
                div.Style.Add("class", "form-group");
                div.Attributes.Add("runat", "server");

                Label lbl = new Label();
                lbl.CssClass = "control-label";
                lbl.Text = term.SubCategoryName;
                lbl.ID = "lblDynamic" + i;

                var txt = new TextBox();
                txt.ID = "txtDynamic" + i;
                txt.CssClass = "form-control txtgrade";

                div.Controls.Add(lbl);
                div.Controls.Add(txt);

                divterms.Controls.Add(div);
                i++;
            }
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var classFee = new BOFee();

                int catid = 0;
                if (ViewState["classfeeid"] != null)
                    catid = Convert.ToInt16(ViewState["classfeeid"]);

                classFee.Id = catid;
                classFee.HostCode = "DEMO";
                classFee.UserId = 1;
                classFee.ClassId = Convert.ToInt16(drpclass.SelectedValue);

                string termFees = "";
                foreach (Control divCtrl in divterms.Controls)
                {
                    var txtControls = divCtrl.Controls.OfType<TextBox>();
                    if (txtControls == null) continue;

                    foreach (TextBox textBox in divCtrl.Controls.OfType<TextBox>())
                    {
                        termFees += textBox.Text + ",";
                    }
                }

                classFee.Status = "A";

                var isInserted = (new BLGradeSystem()).InsertClassFee(classFee);
                if (isInserted == 1)
                {
                    LoadClassFee();
                    GradeUpdatePanel.Update();
                    ResetControls();
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblErrorMsg.Text = "Class fee inserted successfully.";
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
            drpclass.SelectedIndex = 0;

            foreach (Control divCtrl in divterms.Controls)
            {
                var txtCtrls = divCtrl.Controls.OfType<TextBox>();
                if (txtCtrls == null) continue;
                foreach (TextBox txt in txtCtrls)
                {
                    txt.Text = string.Empty;
                }
            }
        }

        private void LoadClassFee()
        {
            try
            {
                var blCategories = new BLGradeSystem();
                var dtGrades = blCategories.LoadClassFee(1, "DEMO");

                if (dtGrades != null)
                {
                    gvClassFee.Visible = true;
                    gvClassFee.DataSource = dtGrades;
                    gvClassFee.DataBind();
                    ViewState["Fees"] = dtGrades;
                }
                else
                {
                    gvClassFee.Visible = false;
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = "Unable to load data.";
            }
        }

        protected void gvClassFee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    var id = e.CommandArgument;
                    ViewState["classfeeid"] = id;

                    var fees = (List<BOFee>)ViewState["Fees"];
                    var values = fees.Where(f => f.Id == Convert.ToInt16(id)).FirstOrDefault();

                    drpclass.SelectedValue = values.ClassId.ToString();
                  
                    int i=0;
                    foreach (Control ctrl in divterms.Controls)
                    {
                        var txtCtrls = ctrl.Controls.OfType<TextBox>();
                        foreach (TextBox txt in txtCtrls)
                        {
                            var split = values.TermFees.Split(',')[i];
                            txt.Text = split.Split('|')[1];
                        }
                        i++;
                    }
                }
                if (e.CommandName == "Del")
                {
                    var values = e.CommandArgument.ToString();
                    if (ViewState["classfeeid"].ToString() == values)
                        ResetControls();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Process failed. Please try again.";
                lblErrorMsg.Text = ex.Message;
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvClassFee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClassFee.DataSource = ((List<BOCategories>)(ViewState["Fees"])).ToList();
            gvClassFee.PageIndex = e.NewPageIndex;
            gvClassFee.DataBind();
            GradeUpdatePanel.Update();
        }

        //protected void gvGradeSystem_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        var termFees = (e.Row.DataItem as DataRowView).Row["TermFees"].ToString();
        //        var terms = termFees.Split(',');
        //        int i = 2;
        //        foreach (var term in terms)
        //        {
        //            var termName = term.Split('|')[0];
        //            var termFee = term.Split('|')[1];

        //            Label lblTerm = new Label();
        //            lblTerm.ID = "term" + i;
        //            lblTerm.Text = termFee;
        //            e.Row.Cells[i].Controls.Add(lblTerm);
        //            e.Row.Cells[i].hea
        //            i++;
        //        }
        //    }
        //}
    }
}