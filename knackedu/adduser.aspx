<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="knackedu.adduser"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Create New User" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <div class="col-xs-6 col-md-offset-3">
                    <div class="col-md-12">
                        <div class="widget-title"> <h4>Create New User</h4>
                        </div>
                        <div class="form-group">
                            <label class="control-label">First Name:</label>
                            <asp:TextBox runat="server" ID="txtFirstName" class="form-control mandCat"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Last Name:</label>
                            <asp:TextBox runat="server" ID="txtLastName" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                        <label class="control-label">Age:</label>
                         <asp:DropDownList ID="drpAge" runat="server" class="form-control mandCat">
                             
                         </asp:DropDownList>
                        </div>
                        <div class="form-group">
                        <label class="control-label">Gender:</label>
                         <asp:DropDownList ID="drpGender" runat="server" class="form-control mandCat">
                             <asp:ListItem Selected="True" Text="Select" Value="0" ></asp:ListItem>
                             <asp:ListItem Text="Male" Value="1" ></asp:ListItem>
                             <asp:ListItem Text="Male" Value="2" ></asp:ListItem>
                         </asp:DropDownList>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Date Of Bitrh:</label>
                            <asp:TextBox runat="server" TextMode="Date" ID="txtDateOfBirth" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Contact No:</label>
                            <asp:TextBox runat="server" TextMode="Phone" ID="txtContactNo" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                        <label class="control-label">Qualification:</label>
                         <asp:DropDownList ID="drpQualification" runat="server" class="form-control mandCat">
                             <asp:ListItem Selected="True" Text="Select" Value="0" ></asp:ListItem>
                             <asp:ListItem Text="10th" Value="1" ></asp:ListItem>
                             <asp:ListItem Text="12th" Value="2" ></asp:ListItem>
                             <asp:ListItem Text="Graduate" Value="3" ></asp:ListItem>
                             <asp:ListItem Text="Post-Graduate" Value="4" ></asp:ListItem>
                             <asp:ListItem Text="Other Courses" Value="5" ></asp:ListItem>
                         </asp:DropDownList>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Address:</label>
                            <asp:TextBox runat="server" ID="txtAddress" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="widget-title"> <h5>Salary Details</h5>
                         </div>
                         <div class="form-group">
                            <label class="control-label">Basic:</label>
                            <asp:TextBox runat="server" TextMode="Number"  ID="txtBasic" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">DA:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtDA" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">HRA:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtHRA" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Prof Tax:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtProfTax" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Conveyance Allowance:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtConveyanceAllowance" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Capital Cost Allowance:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtCapitalCostAllowance" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Entertainment Allowance:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtEntertainmentAllowance" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Net Salary:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtNetSalary" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                        <label class="control-label">Select Department:</label>
                         <asp:DropDownList ID="drpSelectDepartment" runat="server" class="form-control mandCat">

                         </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Emp ID:</label>
                            <asp:TextBox runat="server" ID="txtEmpId" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Create User ID:</label>
                            <asp:TextBox runat="server" ID="txtCreateUserId" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Create Password:</label>
                            <asp:TextBox runat="server" TextMode="Password" ID="txtCreatePassword" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Confirm Password:</label>
                            <asp:TextBox runat="server" TextMode="Password"  ID="txtConfirmPassword" class="form-control mandCat"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <label class="control-label">Emp ID:</label>
                            <asp:TextBox runat="server" ID="TextBox1" class="form-control mandCat"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        <label class="control-label">Security Question:</label>
                         <asp:DropDownList ID="drpSecurityQuestion" runat="server" class="form-control mandCat">

                         </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Answer:</label>
                            <asp:TextBox runat="server" ID="txtAnswer" class="form-control mandCat"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Date Of Join:</label>
                            <asp:TextBox runat="server" TextMode="Date" ID="txtDateOfJoin" class="form-control mandCat"></asp:TextBox>
                        </div>
                        <div class="form-group">
                         <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success btn-lg pull-right" />
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
