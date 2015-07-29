<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vanfee.aspx.cs" Inherits="knackedu.vanfee"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Insert Student Van Fee Info" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <div class="col-xs-6 col-md-offset-3">
                    <div class="col-md-12">
                        <div class="widget-title">
                            <h4>Insert Student Van Fee Information</h4>
                        </div>
                          <div class="form-group">
                            <label class="control-label">Class :</label>
                             <asp:DropDownList ID="drpClass" runat="server" class="form-control mandCat"></asp:DropDownList>
                             </div>
                         <div class="form-group">
                            <label class="control-label">Section :</label>
                             <asp:DropDownList ID="drpSection" runat="server" class="form-control mandCat"></asp:DropDownList>
                             </div>
                         <div class="form-group">
                            <label class="control-label">Student Name :</label>
                             <asp:DropDownList ID="drpStudentName" runat="server" class="form-control mandCat"></asp:DropDownList>
                             </div>
                         <div class="form-group">
                            <label class="control-label">Student RegNo :</label>
                            <asp:TextBox runat="server" ID="txtStudentRegNo" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Date :</label>
                            <asp:TextBox runat="server" ID="txtDate" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                        <asp:RadioButtonList ID="rdbBusType" runat="server"  class="form-control mandCat">
                             <asp:ListItem>Yes</asp:ListItem>
                             <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                              <div class="form-group">
                            <label class="control-label">Van Stage :</label>
                             <asp:DropDownList ID="drpVanStage" runat="server" class="form-control mandCat"></asp:DropDownList>
                             </div>
                             <div class="form-group">
                            <label class="control-label">Fixed Van Fee :</label>
                            <asp:TextBox runat="server" ID="txtFixedVanFee" class="form-control mandCat"></asp:TextBox>
                        </div>
                               <div class="form-group">
                            <label class="control-label">Select Month :</label>
                             <asp:DropDownList ID="drpSelectMonth" runat="server" class="form-control mandCat"></asp:DropDownList>
                             </div>
                              <div class="form-group">
                            <label class="control-label">Fee :</label>
                            <asp:TextBox runat="server" ID="txtFee" class="form-control mandCat"></asp:TextBox>
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
