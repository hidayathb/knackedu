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
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["menu"] = MenuNames.MasterInfo;
                lblErrorMsg.Text = string.Empty;
                lblSubCategoryMsg.Text = string.Empty;
                if (!IsPostBack)
                {
                    Session["UserId"] = "1";
                    Session["HostCode"] = "DEMO";

                    LoadCategories();
                    BindCategoriesGrid();
                    BindSubCategoriesGrid();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        private void BindCategoriesGrid()
        {
            try
            {
                var blCategories = new BLCategories();
                var dtCategories = blCategories.LoadCategories(1, "DEMO");

                if (dtCategories != null)
                {
                    gvCategory.Visible = true;
                    gvCategory.DataSource = dtCategories;
                    gvCategory.DataBind();
                    ViewState["Categories"] = dtCategories;
                }
                else
                {
                    gvCategory.Visible = false;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void BindSubCategoriesGrid()
        {
            try
            {
                var blCategories = new BLCategories();
                var dtAllCategories = blCategories.LoadSubCategories(1, "DEMO");                

                if (dtAllCategories != null)
                {
                    //LoadParentSubCategories(dtAllCategories);

                    gvSubCategory.Visible = true;
                    gvSubCategory.DataSource = dtAllCategories;
                    gvSubCategory.DataBind();
                    ViewState["SubCategories"] = dtAllCategories;
                }
                else
                {
                    gvSubCategory.Visible = false;
                    gvSubCategory.DataSource =null;
                    gvSubCategory.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void LoadCategories()
        {
            try
            {
                var blCategories = new BLCategories();
                var dtCategories = blCategories.LoadCategories(1, "DEMO");

                if (dtCategories != null)
                {
                    drpcategoryID.DataSource = dtCategories;
                    drpcategoryID.DataBind();
                    drpcategoryID.DataTextField = "CategoryName";
                    drpcategoryID.DataValueField = "Id";
                    drpcategoryID.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //private void LoadParentSubCategories(List<BOCategories> subCategories)
        //{
        //    if (subCategories != null)
        //    {
        //        var parentSubs = subCategories.Where(p => p.Id == Convert.ToInt32(drpcategoryID.SelectedValue));

        //        drpParentSubCategory.DataSource = parentSubs;
        //        drpParentSubCategory.DataValueField = "SubCategoryId";
        //        drpParentSubCategory.DataTextField = "SubCategoryName";
        //        drpParentSubCategory.DataBind();
        //    }

        //    drpParentSubCategory.Items.Insert(0, new ListItem("SELECT", "0"));
        //}

        protected void drpcategoryID_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ViewState["SubCatId"] = null;
                txtSubCategoryName.Text = string.Empty;
                txtSubCategoryCode.Text = string.Empty;
                btnSubCategory.Text = "Add SubCategory";
                if (ViewState["SubCategories"] != null)
                {
                    var data = ((List<BOCategories>)(ViewState["SubCategories"]));
                    var filterData = data.Where(c => c.Id == Convert.ToInt32(drpcategoryID.SelectedValue));

                    //LoadParentSubCategories(((List<BOCategories>)(ViewState["SubCategories"])));
                    if (filterData != null)
                    {
                        gvSubCategory.DataSource = filterData.ToList();
                        gvSubCategory.DataBind();
                    }
                    else
                    {
                        gvSubCategory.DataSource = null;
                        gvSubCategory.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void btnCategory_Click(object sender, EventArgs e)
        {
            try
            {
                var categories = new BOCategories();

                int catid = 0;
                if (ViewState["CatId"] != null)
                    catid = Convert.ToInt16(ViewState["CatId"]);

                categories.Id = catid;
                categories.CategoryCode = txtCategoryCode.Text.Trim();
                categories.CategoryName = txtCategoryName.Text.Trim();
                categories.HostCode = Session["HostCode"].ToString();
                categories.UserId = Convert.ToInt32(Session["UserId"]);

                var isInserted = (new BLCategories()).InsertCategory(categories);
                if (isInserted == -1)
                {
                    subcatUpdatePanel.Update();
                    LoadCategories();
                    BindCategoriesGrid();
                    this.btnCategory.Text = "Add Category";
                    txtCategoryCode.Text = string.Empty;
                    txtCategoryName.Text = string.Empty;
                    ViewState["CatId"] = null;
                    lblErrorMsg.Text = "Category inserted successfully.";
                }
                else
                {
                    lblErrorMsg.Text = "Process failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void gvCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    this.btnCategory.Text = "Update Category";
                    var values = e.CommandArgument.ToString().Split('|');

                    ViewState["CatId"] = values[0];
                    txtCategoryName.Text = values[2];
                    txtCategoryCode.Text = values[1];
                }
                if (e.CommandName == "Del")
                {
                    var values = e.CommandArgument.ToString();

                    if (ViewState["CatId"].ToString() == values)
                    {
                        ViewState["CatId"] = null;
                        txtCategoryName.Text = string.Empty;
                        txtCategoryCode.Text = string.Empty;
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void gvSubCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    this.btnSubCategory.Text = "Update SubCategory";
                    var values = e.CommandArgument.ToString().Split('|');

                    ViewState["SubCatId"] = values[0];
                    txtSubCategoryName.Text = values[2];
                    txtSubCategoryCode.Text = values[1];
                    drpcategoryID.SelectedValue = values[3];
                }
                if (e.CommandName == "Del")
                {
                    var subCatId = e.CommandArgument.ToString();

                    if (ViewState["SubCatId"].ToString() == subCatId)
                    {
                        ViewState["SubCatId"] = null;
                        txtCategoryName.Text = string.Empty;
                        txtCategoryCode.Text = string.Empty;
                    }

                    var isDeleted = (new BLCategories()).DeleteSubCategories(Convert.ToInt32(subCatId));
                    if (isDeleted == -1)
                    {
                        lblErrorMsg.Text = "Record deleted successfully.";
                    }
                    else
                    {
                        lblErrorMsg.Text = "Process failed. Please try again.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void btnSubCategory_Click(object sender, EventArgs e)
        {
            try
            {
                var categories = new BOCategories();

                int subCatid = 0;
                if (ViewState["SubCatId"] != null)
                    subCatid = Convert.ToInt16(ViewState["SubCatId"]);

                categories.SubCategoryId = subCatid;
                //categories.ParentSubCategoryId = Convert.ToInt32(drpParentSubCategory.SelectedValue);
                categories.SubCategoryCode = txtSubCategoryCode.Text.Trim();
                categories.SubCategoryName = txtSubCategoryName.Text.Trim();
                categories.HostCode = Session["HostCode"].ToString();
                categories.UserId = Convert.ToInt32(Session["UserId"]);
                categories.Id = Convert.ToInt32(drpcategoryID.SelectedValue);

                var index = drpcategoryID.SelectedIndex;
                var parentIndex = drpcategoryID.SelectedIndex;
                var isInserted = (new BLCategories()).InsertSubCategory(categories);
                if (isInserted == -1)
                {                    
                    this.btnSubCategory.Text = "Add SubCategory"; 
                    txtSubCategoryCode.Text = string.Empty;
                    txtSubCategoryName.Text = string.Empty;
                    ViewState["SubCatId"] = null;
                    drpcategoryID.SelectedIndex = index;
                    //drpParentSubCategory.SelectedIndex = parentIndex;
                    BindSubCategoriesGrid();
                    drpcategoryID_SelectedIndexChanged(null, null);
                    subcatUpdatePanel.Update();
                    lblSubCategoryMsg.Text = "Sub Category inserted successfully.";
                }
                else
                {
                    lblSubCategoryMsg.Text = "Process failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void btnClearCat_Click(object sender, EventArgs e)
        {
            txtCategoryCode.Text = string.Empty;
            txtCategoryName.Text = string.Empty;
        }

        protected void btnSubCatClear_Click(object sender, EventArgs e)
        {
            txtSubCategoryCode.Text = string.Empty;
            txtSubCategoryName.Text = string.Empty;
            drpcategoryID.SelectedIndex = 0;
        }

        protected void gvCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategory.DataSource = ((List<BOCategories>)(ViewState["Categories"])).ToList();
            gvCategory.PageIndex = e.NewPageIndex;
            gvCategory.DataBind();
            CatUpdatePanel.Update();
        }

        protected void gvSubCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubCategory.DataSource = ((List<BOCategories>)(ViewState["SubCategories"])).ToList();
            gvSubCategory.PageIndex = e.NewPageIndex;
            gvSubCategory.DataBind();
            subcatUpdatePanel.Update();
        }

        protected void drpParentSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ViewState["SubCategories"] != null)// && drpParentSubCategory.SelectedIndex > 0)
                {
                    var filterData = ((List<BOCategories>)(ViewState["SubCategories"]))
                                        .Where(c => c.Id == Convert.ToInt32(drpcategoryID.SelectedValue));
                                        //&& c.ParentSubCategoryId == Convert.ToInt32(drpParentSubCategory.SelectedValue));
                    if (filterData == null)
                    {
                        gvSubCategory.DataSource = null;
                        gvSubCategory.DataBind();
                    }
                    else
                    {
                        gvSubCategory.DataSource = filterData;
                        gvSubCategory.DataBind();
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