<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="knackedu.Categories"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Categories" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">

    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <asp:UpdatePanel ID="CatUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-md-5">
                            <div class="widget-title">
                                <h4>Category Information</h4>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Category Code<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox runat="server" ID="txtCategoryCode" class="form-control mandCat"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Category Name<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox runat="server" ID="txtCategoryName" class="form-control mandCat"></asp:TextBox>
                            </div>

                            <asp:Button class="btn btn-primary btn-lg pull-right" runat="server"
                                ID="btnCategory" Text="Add Category" OnClick="btnCategory_Click" OnClientClick="javascript:return ValidateCategories();" />
                        </div>

                        <div class="clearfix"></div>
                        <br />

                        <asp:GridView CssClass="table table-striped" ID="gvCategory" runat="server"
                            OnPageIndexChanging="gvCategory_PageIndexChanging"
                            PageSize="5" AllowSorting="true" AllowPaging="true"
                            AutoGenerateColumns="false"
                            OnRowCommand="gvCategory_RowCommand">
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Green" />
                            <PagerStyle BackColor="#999999" ForeColor="Green" HorizontalAlign="Right" />
                            <Columns>
                                <asp:TemplateField HeaderText="Code" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCategory" Text='<%# Bind("CategoryCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="Label1" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnEditCat" CommandName="Edt"
                                            CommandArgument='<%#Eval("Id") +"|"+ Eval("CategoryCode")  +"|"+ Eval("CategoryName") %>'
                                            Text="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnDelCat" CommandName="Del"
                                            CommandArgument='<%#Eval("Id") %>'
                                            Text="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvCategory" />
                        <asp:AsyncPostBackTrigger ControlID="btnCategory" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="clearfix"></div>
                <br />
                <br />
                <asp:UpdatePanel ID="subcatUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-md-5">
                            <div class="widget-title">
                                <h4>SubCategory Information</h4>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblSubCategoryMsg" ForeColor="Red" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Category<font color="#FF3300">&nbsp;*</font></label>
                                <asp:DropDownList class="form-control" ID="drpcategoryID" runat="server"
                                    OnSelectedIndexChanged="drpcategoryID_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <%--<div class="form-group">
                                    <label class="control-label">Parent Sub Category<font color="#FF3300">&nbsp;*</font></label>
                                    <asp:DropDownList class="form-control" ID="drpParentSubCategory" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="drpParentSubCategory_SelectedIndexChanged" >
                                    </asp:DropDownList>
                                </div>--%>
                            <div class="form-group">
                                <label class="control-label">SubCategory Code<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox runat="server" ID="txtSubCategoryCode" class="form-control mandSubCat"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">SubCategory Name<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox runat="server" ID="txtSubCategoryName" class="form-control mandSubCat"></asp:TextBox>
                            </div>
                            <asp:Button class="btn btn-primary btn-lg pull-right" runat="server"
                                ID="btnSubCategory" Text="Add SubCategory" OnClick="btnSubCategory_Click" OnClientClick="javascript:return ValidateSubCategories();" />
                        </div>
                        <div class="clearfix"></div>
                        <br />

                        <asp:GridView CssClass="table table-striped" ID="gvSubCategory" runat="server" BackColor="White" BorderColor="#999999"
                            PageSize="5" AllowSorting="true" AllowPaging="true"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false"
                            OnRowCommand="gvSubCategory_RowCommand" OnPageIndexChanging="gvSubCategory_PageIndexChanging">
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Green" />
                            <PagerStyle BackColor="#999999" ForeColor="Green" HorizontalAlign="Right" />
                            <Columns>
                                <asp:TemplateField HeaderText="Category" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="gvlblCategoryName" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Code" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="gvlblSubCategoryCode" Text='<%# Bind("SubCategoryCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="gvlblSubCategoryName" Text='<%# Bind("SubCategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnEditSubCat" CommandName="Edt"
                                            CommandArgument='<%#Eval("SubCategoryId") +"|"+ Eval("SubCategoryCode")  +"|"
                                                    + Eval("SubCategoryName") + "|" + Eval("SubCategoryId") %>'
                                            Text="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnDelSubCat" CommandName="Del"
                                            CommandArgument='<%#Eval("SubCategoryId") %>'
                                            Text="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubCategory" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="gvSubCategory" />
                        <asp:AsyncPostBackTrigger ControlID="drpcategoryID" EventName="SelectedIndexChanged" />
                        <%--<asp:AsyncPostBackTrigger ControlID="drpParentSubCategory" EventName="SelectedIndexChanged" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                <uc:ucSidebar ID="uctlSidebar" runat="server" />
                <!-- end widget -->
            </div>
        </div>
    </section>
</asp:Content>
