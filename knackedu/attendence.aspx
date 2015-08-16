<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attendence.aspx.cs" Inherits="knackedu.attendence"
    MasterPageFile="~/afterlogin.Master" %>
<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <div class="col-xs-6 col-md-offset-3">
                    <asp:UpdatePanel runat="server" ID="updateSec" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="col-md-12">
                                <div class="widget-title">
                                    <h4>Attendence</h4>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Class :</label>
                                    <asp:DropDownList ID="drpClass" runat="server" class="form-control drpgrade" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Section :</label>
                                    <asp:DropDownList ID="drpSection" runat="server" class="form-control drpgrade" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Date :</label>
                                    <asp:TextBox runat="server" ID="txtattendencedate" TextMode="Number" CssClass="form-control
                                        txtgrade"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-lg btn-primary pull-left" runat="server"
                                        ID="btnShow" Text="Show" OnClientClick="javascript:return ValidateGradeSystem();"
                                        OnClick="btnShow_Click" />
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg pull-right" runat="server"
                                        ID="btnReset" Text="Reset" OnClick="btnReset_Click" />
                                </div>

                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="clearfix"></div>
                <asp:GridView CssClass="table table-striped" ID="gvStudentMarks" runat="server"
                    BackColor="White" BorderColor="#999999"
                    PageSize="5" AllowSorting="true" AllowPaging="true"
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Brown" />
                    <PagerStyle BackColor="#999999" ForeColor="Brown" HorizontalAlign="Right" />
                    <Columns>
                        <asp:TemplateField HeaderText="Select" HeaderStyle-HorizontalAlign="Center"
                            HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkSelect"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center"
                            HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblFirstName" Text='<%# Bind("StudentName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reg No" HeaderStyle-HorizontalAlign="Center"
                            HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAdmissionId" Text='<%# Bind("AdmissionId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Button class="btn btn-lg btn-primary pull-left" runat="server"
                    ID="btnSubmit" Text="Submit" OnClientClick="javascript:return ValidateGradeSystem();"
                    OnClick="btnSubmit_Click" Visible="false" />
                <div class="clearfix"></div>
                <br />
                
            </div>
            <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                <uc:ucsidebar id="uctlSidebar" runat="server" />
                <!-- end widget -->
            </div>
        </div>
    </section>
</asp:Content>

