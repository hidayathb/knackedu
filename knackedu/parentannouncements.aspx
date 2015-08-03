<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/parentafterlogin.Master"
    CodeBehind="parentannouncements.aspx.cs" Inherits="knackedu.parentannouncements" Title=":: Knackedu :: Announcements" %>

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
                                <asp:TemplateField HeaderText="EventDate" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:Label align="center" ID="lbeventdate" runat="server" Text='<%#Eval("edate") %> ' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Announcement" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label align="center" ID="lbtitle" runat="server" Text='<%#Eval("title") %> ' Font-Bold="true" ></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label align="center" ID="lbannouncement" runat="server" Text='<%#Eval("announcedescrip") %>' ></asp:Label>
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
