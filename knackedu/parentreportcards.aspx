<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/parentafterlogin.Master"
    CodeBehind="parentreportcards.aspx.cs" Inherits="knackedu.parentreportcards" Title=":: Knackedu :: Report Cards" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <section class="section-white">
        <div class="container">
            <div id="sidebar" class="col-md-3 col-sm-12 pull-left">
                <uc:ucSidebar ID="uctlSidebar" runat="server" />
            </div>
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <div class="col-xs-12">
                    <div class="col-md-8">
                        <div>
                            <h4>Student Details</h4>
                            <asp:Label CssClass="control-label" ForeColor="Red" ID="lblMsg" runat="server"></asp:Label>
                            <table class="table table-striped" style="margin: 0px">
                                <tr>
                                    <td class="col-md-4"><b>Student Name</b></td>
                                    <td>
                                        <asp:Label ID="lblstudent" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td><b>Class Section</b></td>
                                    <td>
                                        <asp:Label ID="lblsection" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td><b>Admission</b></td>
                                    <td>
                                        <asp:Label ID="lbladmission" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td><b>Date of Birth</b></td>

                                    <td>
                                        <asp:Label ID="lbldob" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td><b>Mother's Name</b></td>
                                    <td>
                                        <asp:Label ID="lblmothername" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td><b>Father's Name</b></td>

                                    <td>
                                        <asp:Label ID="lblfathername" runat="server"></asp:Label>
                                    </td>

                                </tr>

                                <tr>
                                    <td><b>Residential Address</b></td>
                                    <td>
                                        <asp:Label ID="lbladdress" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td><b>Telephone No.</b></td>

                                    <td>
                                        <asp:Label ID="lbltel" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td><b>Mobile No.</b></td>
                                    <td>
                                        <asp:Label ID="lblmob" runat="server"></asp:Label>
                                    </td>

                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div class="clearfix"></div>
                        <div>
                            <asp:GridView ID="gvTimtable" runat="server" class="table table-striped"
                                AutoGenerateColumns="False"
                                BorderStyle="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Exam">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" Value=' <%# Eval("id") %>' ID="Hfield" />
                                            <asp:Label ID="lblExamType" runat="server" Text='<%# Eval("ExamType")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="FirstName" runat="server" Text='<%# Eval("FirstName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="ClassName" runat="server" Text='<%# Eval("ClassName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Section Name">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="SectionName" runat="server" Text='<%# Eval("SectionName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hindi">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="Hindi" runat="server" Text='<%# Eval("Hindi")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="English">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="Mathematics" runat="server" Text='<%# Eval("English")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mathematics">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="Mathematics" runat="server" Text='<%# Eval("Mathematics")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Computer">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="Computer" runat="server" Text='<%# Eval("Computer")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <br />
                <div class="clearfix"></div>
            </div>
        </div>
    </section>
</asp:Content>
