<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="genaratestudentid.aspx.cs" Inherits="knackedu.genaratestudentid"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - genaratestudentid" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <div class="col-xs-6 col-md-offset-3">
                    <div class="col-md-12">
                        <div class="widget-title">
                            <h4>Genarate Student ID</h4>
                        </div>
                            <div class="form-group">
                            <label class="control-label">Class</label>
                             <asp:DropDownList ID="drpClass" runat="server" class="form-control mandCat"></asp:DropDownList>
                             </div>
                         <div class="form-group">
                            <label class="control-label">RollNo.</label>
                             <asp:DropDownList ID="drpRollNo" runat="server" class="form-control mandCat"></asp:DropDownList>
                             </div>
                           <div class="form-group">
                         <asp:Button class="btn btn-lg pull-right" runat="server"
                            ID="btnShow" Text="SHOW"/>
                         </div>
                         </div>
                </div>
                <div class="clearfix"></div>
                <br />
                <asp:GridView CssClass="table table-striped" ID="gvGradeSystem" runat="server"
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
                <div class="clearfix"></div>
            </div>
            <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                <uc:ucSidebar ID="uctlSidebar" runat="server" />
                <!-- end widget -->
            </div>
        </div>
    </section>
</asp:Content>
