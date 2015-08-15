<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="classfee.aspx.cs" 
    Inherits="knackedu.classfee" MasterPageFile="~/afterlogin.Master" %>
<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <asp:UpdatePanel ID="GradeUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-md-5">
                            <div class="widget-title">
                                <h4>Setup Class</h4>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Class</label>
                                <asp:DropDownList ID="drpclass" runat="server" class="form-control drpgrade">
                                </asp:DropDownList>
                            </div>
                            <div runat="server" id="divterms"></div>
                            <div class="form-group">
                                <asp:Button class="btn btn-primary nextBtn btn-lg pull-left" runat="server"
                                    ID="btnclear" Text="Clear" OnClick="btnclear_Click" />
                                <asp:Button class="btn btn-primary nextBtn btn-lg pull-right" runat="server"
                                    ID="btnsubmit" Text="Submit" OnClick="btnsubmit_Click" OnClientClick="javascript:return ValidateGradeSystem();" />

                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <asp:GridView CssClass="table table-striped" ID="gvClassFee" runat="server"
                            OnRowCommand="gvClassFee_RowCommand" OnPageIndexChanging="gvClassFee_PageIndexChanging"
                            BackColor="White" BorderColor="#999999"
                            PageSize="5" AllowSorting="true" AllowPaging="true"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false">
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Brown" />
                            <PagerStyle BackColor="#999999" ForeColor="Brown" HorizontalAlign="Right" />
                            <Columns>
                                <asp:TemplateField HeaderText="Class" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblClass" Text='<%# Bind("ClassName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Fee" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalFee" Text='<%# Bind("TotalFee") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnEditCat" CommandName="Edt"
                                            CommandArgument='<%#Eval("Id") %>'
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
                        <asp:AsyncPostBackTrigger ControlID="gvClassFee" />
                        <asp:AsyncPostBackTrigger ControlID="btnsubmit" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnclear" EventName="Click" />
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
