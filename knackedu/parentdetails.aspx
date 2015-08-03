<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/parentafterlogin.Master"
    CodeBehind="parentdetails.aspx.cs" Inherits="knackedu.parentdetails" Title=":: Knackedu :: Parent Details" %>

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
                    </div>
                </div>
                <div class="clearfix"></div>
                <br />
                <div class="clearfix"></div>
            </div>
        </div>
    </section>
</asp:Content>
