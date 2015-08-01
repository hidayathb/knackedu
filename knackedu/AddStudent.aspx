<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="knackedu.AddStudent"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Student" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>

    <section class="section-white">
        <div class="container">
            <div class="row">
                <div id="content" class="col-md-9 col-sm-12">
                    <div class="row setup-content" id="step-1">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <div class="widget-title">
                                    <h4>Student Form</h4>
                                </div>
                                <h3>Personal Information</h3>
                                <%--<div class="form-group">
                                    <label class="control-label">Admission No</label>
                                    <asp:TextBox runat="server" ID="txtAdmissionNumber" class="form-control txtmandStep"></asp:TextBox>
                                </div>--%>
                                <div class="form-group">
                                    <label class="control-label">Admission To Year</label>
                                    <asp:DropDownList runat="server" ID="drpAdmsYear" CssClass="form-control drpmandStep">
                                        <asp:ListItem Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                                        <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                                        <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                                        <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                                        <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                                        <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                                        <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                                        <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                                        <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Admission to Class</label>
                                    <asp:DropDownList ID="drpAdmissiontoclass" runat="server" CssClass="form-control drpmandStep">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Section</label>
                                    <asp:DropDownList runat="server" ID="drpSection" CssClass="form-control drpmandStep">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">First Name</label>
                                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Surname</label>
                                    <asp:TextBox ID="txtSurName" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Gender</label>
                                    <asp:DropDownList runat="server" ID="drpGender" CssClass="form-control drpmandStep">
                                        <asp:ListItem Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Date Of admission</label>
                                    <asp:TextBox ID="txtDateOfAdmission" TextMode="Date" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Place Of Birth</label>
                                    <asp:TextBox ID="txtPlaceOfBirth" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Date Of Birth</label>
                                    <asp:TextBox ID="txtDateOfBirth" TextMode="Date" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Age</label>
                                    <asp:DropDownList runat="server" ID="drpAge" CssClass="form-control drpmandStep">
                                        <asp:ListItem Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                        <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                        <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                        <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                        <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Mother Tongue</label>
                                    <asp:DropDownList ID="drpMothertongue" runat="server" CssClass="form-control drpmandStep">
                                        <asp:ListItem Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="Telugu" Value="Telugu"></asp:ListItem>
                                        <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Identity Mark1</label>
                                    <asp:TextBox ID="txtIdentity1" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Identity Mark2</label>
                                    <asp:TextBox ID="txtIdentity2" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Caste</label>
                                    <asp:DropDownList ID="drpCaste" runat="server" CssClass="form-control drpmandStep">
                                        <asp:ListItem Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="OC" Value="OC"></asp:ListItem>
                                        <asp:ListItem Text="SC" Value="SC"></asp:ListItem>
                                        <asp:ListItem Text="ST" Value="ST"></asp:ListItem>
                                        <asp:ListItem Text="BC" Value="BC"></asp:ListItem>
                                        <asp:ListItem Text="OBC" Value="OBC"></asp:ListItem>
                                        <asp:ListItem Text="General" Value="General"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Physically Changellenged</label>
                                    <asp:RadioButtonList runat="server" ID="rdblPhysicallyChanlenged">
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                        <asp:ListItem>Yes</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Class studied in previous year</label>
                                    <asp:TextBox ID="txtclassprevyear" TextMode="Number" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Bus Facility</label>
                                    <asp:RadioButtonList runat="server" ID="rdblstBusFacility">
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                        <asp:ListItem>Yes</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <%--<asp:Button class="btn btn-primary nextBtn btn-lg pull-right" runat="server"
                                    ID="btnStep1" Text="Next" OnClientClick="javascript:return ValidateStudent()"  />--%>
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step_2">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3>Other Information</h3>
                                <div class="form-group">
                                    <label class="control-label">Last School Attended</label>
                                    <asp:TextBox ID="txtSchoolAttended" runat="server" MaxLength="200"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Address of the school</label>
                                    <asp:TextBox ID="txtPrevSchoolAddress" runat="server" MaxLength="200" TextMode="MultiLine"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Father's Name</label>
                                    <asp:TextBox ID="txtFatherName" runat="server" MaxLength="200"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Mother's Name</label>
                                    <asp:TextBox ID="txtMotherName" runat="server" MaxLength="200"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="200"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Father's Occupation</label>
                                    <asp:TextBox ID="txtFathersOccupation" runat="server" MaxLength="200"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Mother's Occupation</label>
                                    <asp:TextBox ID="txtMothersOccupation" runat="server" MaxLength="200"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Nationality</label>
                                    <asp:TextBox ID="txtNationality" runat="server" MaxLength="200"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Religion</label>
                                    <asp:DropDownList ID="drpReligion" runat="server" CssClass="form-control drpmandStep">
                                        <asp:ListItem Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="Telugu" Value="Hinduism"></asp:ListItem>
                                        <asp:ListItem Text="Hindi" Value="Islam"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="Christianity"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="Sikhism"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="Jainism"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="Buddhism"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Father's Income</label>
                                    <asp:TextBox ID="txtFathersIncome" runat="server" MaxLength="200" TextMode="Number"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <%--<button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>--%>
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step_3">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3>Contact Details</h3>
                                <div class="form-group">
                                    <label class="control-label">Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" MaxLength="200" TextMode="MultiLine"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">State</label>
                                    <asp:DropDownList ID="drpState" runat="server" CssClass="form-control drpmandStep">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">City</label>
                                    <asp:DropDownList ID="drpCity" runat="server" CssClass="form-control drpmandStep">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">District</label>
                                    <asp:DropDownList ID="drpDistrict" runat="server" CssClass="form-control drpmandStep">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Pin Code</label>
                                    <asp:TextBox ID="txtpincode" runat="server" MaxLength="6"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Contact No</label>
                                    <asp:TextBox ID="txtContactNo" runat="server" MaxLength="10"
                                        CssClass="form-control txtmandStep"></asp:TextBox>
                                </div>
                                <asp:Button runat="server" CssClass="btn btn-success btn-lg pull-left" Text="Submit" ID="btnSubmit"
                                    OnClick="txtSubmit_Click" OnClientClick="javascript:return ValidateStudent();" />
                                <asp:Button runat="server" CssClass="btn btn-success btn-lg pull-right" Text="Clear" ID="btnClear"
                                    OnClick="btnClear_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <br />
                    <asp:UpdatePanel ID="upStudent" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView CssClass="table table-striped" ID="gvStudents" runat="server"
                                BackColor="White" BorderColor="#999999"
                                PageSize="5" AllowSorting="true" AllowPaging="true"
                                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false">
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Brown" />
                                <PagerStyle BackColor="#999999" ForeColor="Brown" HorizontalAlign="Right" />
                                <Columns>
                                    <asp:TemplateField HeaderText="AdmissionId" HeaderStyle-HorizontalAlign="Center"
                                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblAdmissionId" Text='<%# Bind("AdmissionId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="First Name" HeaderStyle-HorizontalAlign="Center"
                                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblFirstName" Text='<%# Bind("FirstName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class" HeaderStyle-HorizontalAlign="Center"
                                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblClassName" Text='<%# Bind("ClassName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Section" HeaderStyle-HorizontalAlign="Center"
                                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblSectionName" Text='<%# Bind("SectionName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                    <uc:ucSidebar ID="uctlSidebar" runat="server" />
                    <!-- end widget -->
                </div>
            </div>

        </div>
    </section>
</asp:Content>
