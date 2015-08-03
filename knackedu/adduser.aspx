<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="knackedu.adduser"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Create New User" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div class="row">

                <div id="content" class="col-md-9 col-sm-12">
                    <div class="widget-title">
                        <h4>Create New User</h4>
                        <hr />
                    </div>
                    <div class="stepwizard col-md-offset-3">
                        <div class="stepwizard-row setup-panel">
                            <div class="stepwizard-step">
                                <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                                <p>Personal Information</p>
                            </div>
                            <div class="stepwizard-step">
                                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                                <p>Salary Information</p>
                            </div>
                            <div class="stepwizard-step">
                                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                                <p>Login Information</p>
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-1">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3 style="margin-left: 0px">Personal Information</h3>
                            </div>
                            <div class="form-group">
                                <label class="control-label">First Name:</label>
                                <asp:TextBox runat="server" ID="txtFirstName" class="form-control mandCat" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Last Name:</label>
                                <asp:TextBox runat="server" ID="txtLastName" class="form-control mandCat" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Age:</label>
                                <asp:DropDownList ID="drpAge" runat="server" class="form-control mandCat" required="required">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Gender:</label>
                                <asp:DropDownList ID="drpGender" runat="server" class="form-control mandCat" required="required">
                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Male" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Date Of Bitrh:</label>
                                <asp:TextBox runat="server" TextMode="Date" ID="txtDateOfBirth" class="form-control mandCat" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Contact No:</label>
                                <asp:TextBox runat="server" TextMode="Phone" ID="txtContactNo" class="form-control mandCat" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Qualification:</label>
                                <asp:DropDownList ID="drpQualification" runat="server" class="form-control mandCat" required="required">
                                    <asp:ListItem Selected="True" Text="Select" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10th" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="12th" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Graduate" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Post-Graduate" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Other Courses" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Address:</label>
                                <asp:TextBox runat="server" ID="txtAddress" class="form-control mandCat" required="required"></asp:TextBox>
                            </div>
                            <button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-2">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3>Salary Information</h3>
                                <div class="form-group">
                                    <label class="control-label">Basic:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtBasic" class="form-control mandCat"
                                        required="required"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">DA:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtDA" class="form-control mandCat"
                                        required="required"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">HRA:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtHRA" class="form-control mandCat"
                                        required="required"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Prof Tax:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtProfTax" class="form-control mandCat"
                                        required="required"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Conveyance Allowance:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtConveyanceAllowance"
                                        required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Capital Cost Allowance:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtCapitalCostAllowance"
                                        required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Entertainment Allowance:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtEntertainmentAllowance"
                                        required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Net Salary:</label>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtNetSalary"
                                        required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Select Department:</label>
                                    <asp:DropDownList ID="drpSelectDepartment" runat="server"
                                        required="required" class="form-control mandCat">
                                    </asp:DropDownList>
                                </div>
                                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-3">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3>Other Information</h3>

                                <div class="form-group">
                                    <label class="control-label">Emp ID:</label>
                                    <asp:TextBox runat="server" ID="txtEmpId" required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Create User ID:</label>
                                    <asp:TextBox runat="server" ID="txtCreateUserId" required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Create Password:</label>
                                    <asp:TextBox runat="server" TextMode="Password" required="required" ID="txtCreatePassword" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Confirm Password:</label>
                                    <asp:TextBox runat="server" TextMode="Password" required="required" ID="txtConfirmPassword" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">User ID:</label>
                                    <asp:TextBox runat="server" ID="txtUserId" required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Security Question:</label>
                                    <asp:DropDownList ID="drpSecurityQuestion" required="required" runat="server" class="form-control mandCat">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Answer:</label>
                                    <asp:TextBox runat="server" ID="txtAnswer" required="required" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Date Of Join:</label>
                                    <asp:TextBox runat="server" TextMode="Date" required="required" ID="txtDateOfJoin" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button runat="server" ID="btnSubmit" Text="Submit"
                                        CssClass="btn btn-lg btn-primary_new pull-right" OnClick="btnSubmit_Click" />
                                    <asp:Button runat="server" CssClass="btn btn-primary_new pull-left" Text="Clear" ID="btnClear"
                                        OnClick="btnClear_Click" />
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="clearfix"></div>
                    <br />

                    <asp:GridView CssClass="table table-striped" ID="gvGradeSystem" runat="server"
                        BackColor="White" BorderColor="#999999"
                        PageSize="5" AllowSorting="true" AllowPaging="false"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Brown" />
                        <PagerStyle BackColor="#999999" ForeColor="Green" HorizontalAlign="Center"
                            CssClass="pagination" />
                        <Columns>
                            <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center"
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                ItemStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblName" Text='<%# Bind("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User ID" HeaderStyle-HorizontalAlign="Center"
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                ItemStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="UserId" Text='<%# Bind("UserId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department Name" HeaderStyle-HorizontalAlign="Center"
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                ItemStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Dept" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="btnEditCat" CommandName="Edt"
                                        CommandArgument='<%#Eval("Id") %>'
                                        Text="Edit" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center"
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="btnDelCat" CommandName="Del"
                                        CommandArgument='<%#Eval("Id") %>'
                                        Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>

                    <div class="clearfix"></div>
                </div>
                <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                    <uc:ucSidebar ID="uctlSidebar" runat="server" />
                    <!-- end widget -->
                </div>
            </div>

        </div>

    </section>
</asp:Content>
