<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/parentafterlogin.Master"
    CodeBehind="parenttimetable.aspx.cs" Inherits="knackedu.parenttimetable" Title=":: Knackedu :: Parent Home" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <section class="section-white">
        <div class="container">
            <div id="sidebar" class="col-md-3 col-sm-12 pull-left">
                <uc:ucSidebar ID="uctlSidebar" runat="server" />
            </div>
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <div class="col-xs-12">
                    <div class="col-md-12">

                        <asp:GridView ID="gvTimtable" runat="server" class="table table-striped"
                            AutoGenerateColumns="False"
                            BorderStyle="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Class">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" Value=' <%# Eval("id") %>' ID="Hfield" />
                                        <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("Class")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Peroid 1">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany1" runat="server" Text='<%# Eval("Peroid1")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Peroid 2">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany2" runat="server" Text='<%# Eval("Peroid2")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Peroid 3">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany3" runat="server" Text='<%# Eval("Peroid3")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Peroid 4">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany4" runat="server" Text='<%# Eval("Peroid4")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Peroid 5">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany5" runat="server" Text='<%# Eval("Peroid5")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Peroid 6">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany6" runat="server" Text='<%# Eval("Peroid6")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Peroid 7">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany7" runat="server" Text='<%# Eval("Peroid7")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
