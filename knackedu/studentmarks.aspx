<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentmarks.aspx.cs" Inherits="knackedu.studentmarks"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Student Marks Info" %>

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
                                    <h4>Student Marks</h4>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Class :</label>
                                    <asp:DropDownList ID="drpClass" runat="server" class="form-control drpgrade" AutoPostBack="true"
                                        OnSelectedIndexChanged="drpClass_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Section :</label>
                                    <asp:DropDownList ID="drpSection" runat="server" class="form-control drpgrade" AutoPostBack="true"
                                       OnSelectedIndexChanged="drpSection_SelectedIndexChanged" ></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Exam Type :</label>
                                    <asp:DropDownList ID="drpExamType" runat="server" class="form-control drpgrade"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Reg No :</label>
                                    <asp:DropDownList ID="drpRegNo" runat="server" class="form-control drpgrade" 
                                        OnSelectedIndexChanged="drpRegNo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Student Name :</label>
                                    <asp:TextBox runat="server" ID="txtStudentName" ReadOnly="true" class="form-control txtgrade"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Absent :</label>
                                    <br />
                                    <asp:ListBox runat="server" ID="lstAbsentSubjects" SelectionMode="Multiple" AutoPostBack="true"
                                        OnSelectedIndexChanged="lstAbsentSubjects_SelectedIndexChanged"
                                        CssClass="form-control"
                                        ></asp:ListBox>
                                </div>
                                <div class="widget-title">
                                    <h2>Subjects</h2>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Hindi :</label>
                                    <asp:TextBox runat="server" ID="txtHindi" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">English :</label>
                                    <asp:TextBox runat="server" ID="txtEnglish" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Mathematics :</label>
                                    <asp:TextBox runat="server" ID="txtMathematics" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Science :</label>
                                    <asp:TextBox runat="server" ID="txtScience" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Social Studies :</label>
                                    <asp:TextBox runat="server" ID="txtSocialStudies" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Computer :</label>
                                    <asp:TextBox runat="server" ID="txtComputer" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">G.K :</label>
                                    <asp:TextBox runat="server" ID="txtGK" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Sanskrit :</label>
                                    <asp:TextBox runat="server" ID="txtSanskrit" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Drawing :</label>
                                    <asp:TextBox runat="server" ID="txtDrwaing" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-lg btn-primary pull-right" runat="server"
                                        ID="btnShow" Text="Show" />
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg pull-right" runat="server"
                                        ID="btnReset" Text="Reset" />
                                </div>

                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lstAbsentSubjects" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="drpClass" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="drpSection" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="drpRegNo" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="clearfix"></div>
                <br />
                <asp:GridView CssClass="table table-striped" ID="gvGradeSystem" runat="server"
                    BackColor="White" BorderColor="#999999"
                    PageSize="5" AllowSorting="true" AllowPaging="true"
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false">
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
