<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/parentafterlogin.Master"
    CodeBehind="parentevents.aspx.cs" Inherits="knackedu.parentevents" Title=":: Knackedu :: Parent Home" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <section class="section-white">
        <div class="container">
            <div id="sidebar" class="col-md-3 col-sm-12 pull-left">
                <uc:ucSidebar ID="uctlSidebar" runat="server" />
            </div>
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <div class="col-xs-12">
                    <div class="col-md-10">
                        <h3>Event Calender</h3>
                        <br />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White"
                            DayNameFormat="Shortest"
                            names="Verdana" size="10pt" Font-Size="10pt" ForeColor="#5cab22"
                            Height="300px" Width="95%" Font-Bold="True"
                            OnSelectionChanged="Calendar1_SelectionChanged"
                            OnVisibleMonthChanged="Calendar1_VisibleMonthChanged" CellPadding="1"
                            Font-Names="Verdana" OnDayRender="cal_DayRender" CssClass="table-bordered">
                            <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#333" ForeColor="#fff" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                            <TodayDayStyle BackColor="Salmon" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <NextPrevStyle ForeColor="#CCCCFF" Font-Size="12pt" />
                            <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
                            <TitleStyle BackColor="#5cab22" Font-Size="10pt" ForeColor="#ffffff"
                                Font-Bold="True" Height="40px" />
                        </asp:Calendar>
                        <br />
                        <h3>Main Events In This Month</h3>
                        <asp:GridView ID="gvEvents" runat="server" CssClass="table table-striped"
                            AutoGenerateColumns="False"
                            BorderStyle="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" Value=' <%# Eval("id") %>' ID="Hfield" />
                                        <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("eventname")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblEventDate" runat="server" Text='<%# Eval("eventdate")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblEventDesc" runat="server" Text='<%# Eval("eventdesc")%>'></asp:Label>
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
