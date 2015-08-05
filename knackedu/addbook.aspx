<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addbook.aspx.cs" Inherits="knackedu.addbook"
    MasterPageFile="~/afterlogin.Master" Title="Librarian-addbook " %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar"  %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <asp:UpdatePanel ID="CatUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <div class="widget-title">
                                    <h4>Add New Book</h4>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Book Code<font color="#FF3300">&nbsp;*</font></label>
                                    <asp:TextBox runat="server" ID="txtBookCode" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Price<font color="#FF3300">&nbsp;*</font></label>
                                    <asp:TextBox runat="server" ID="txtPrice" class="form-control mandCat"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label">Last Bill No<font color="#FF3300">&nbsp;*</font></label>
                                    <asp:TextBox runat="server" ID="txtLastBillNo" class="form-control mandCat"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label">Total Stock<font color="#FF3300">&nbsp;*</font></label>
                                    <asp:TextBox runat="server" ID="txtTotalStock" class="form-control mandCat"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label">Bill No.<font color="#FF3300">&nbsp;*</font></label>
                                    <asp:TextBox runat="server" ID="txtBillNo" class="form-control mandCat"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label">Date</label>
                                    <asp:TextBox runat="server" ID="txtDate" class="form-control mandCat"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label">Book Name</label>
                                    <asp:TextBox runat="server" ID="txtBookName" class="form-control mandCat"></asp:TextBox>
                               
                        </div>
                        <div class="clearfix"></div>
                        <br />

                        <asp:GridView CssClass="table table-striped" ID="gvCategory" runat="server" 
                            BackColor="White" BorderColor="#999999" 
                            PageSize="5" AllowSorting="true" AllowPaging="true"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false"
                            >
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Brown" />
                            <PagerStyle BackColor="#999999" ForeColor="Brown" HorizontalAlign="Right" />
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
                      
                    </Triggers>
                </asp:UpdatePanel>
                <div class="clearfix"></div>
                
            </div>
            <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                <uc:ucSidebar ID="uctlSidebar" runat="server" />
                <!-- end widget -->
            </div>
        </div>
    </section>
</asp:Content>
