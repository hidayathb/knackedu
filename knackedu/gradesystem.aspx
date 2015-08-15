<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gradesystem.aspx.cs" Inherits="knackedu.gradesystem"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Grade System" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>
    <section class="section-white">
        <div class="container">
            <div id="content setup-content" class="col-md-9 col-sm-12">
                <asp:UpdatePanel ID="GradeUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-md-5">
                            <div class="widget-title">
                                <h4>Create Grading System</h4>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Please Enter First Mark<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox runat="server" ID="txtFirstMark" MaxLength="2" TextMode="Number" class="form-control txtgrade"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Please Enter Second Mark<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox runat="server" ID="txtSecondMark" MaxLength="3" TextMode="Number" class="form-control txtgrade"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Exam Type<font color="#FF3300">&nbsp;*</font></label>
                                <asp:DropDownList ID="drpExamType" runat="server" class="form-control drpgrade">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Enter Grade<font color="#FF3300">&nbsp;*</font></label>
                                <asp:DropDownList ID="drpGrade" runat="server" class="form-control drpgrade">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Select Marks<font color="#FF3300">&nbsp;*</font></label>
                                <asp:DropDownList ID="drpMarks" runat="server" class="form-control drpgrade">
                                    <asp:ListItem Selected="True" Text="Select" Value="Select"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Button class="btn btn-primary nextBtn btn-lg pull-left" runat="server"
                                    ID="btnClear" Text="Clear" OnClick="btnClear_Click" />
                                <asp:Button class="btn btn-primary nextBtn btn-lg pull-right" runat="server"
                                    ID="btn" Text="Submit" OnClick="btn_Click" OnClientClick="javascript:return ValidateGradeSystem();" />

                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <asp:GridView CssClass="table table-striped" ID="gvGradeSystem" runat="server"
                            OnPageIndexChanging="gvGradeSystem_PageIndexChanging" OnRowCommand="gvGradeSystem_RowCommand"
                            BackColor="White" BorderColor="#999999"
                            PageSize="5" AllowSorting="true" AllowPaging="true"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="false">
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Brown" />
                            <PagerStyle BackColor="#999999" ForeColor="Brown" HorizontalAlign="Right" />
                            <Columns>
                                <asp:TemplateField HeaderText="First Mark" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblFirstMark" Text='<%# Bind("FirstMarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Second Mark" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSecondMark" Text='<%# Bind("SecondMarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exam Type" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblExamType" Text='<%# Bind("ExamType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Grade" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblGrade" Text='<%# Bind("Grade") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marks" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-VerticalAlign="Middle">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMarks" Text='<%# Bind("Marks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnEditCat" CommandName="Edt"
                                            CommandArgument='<%#Eval("Id") +"|"+ Eval("FirstMarks")  +"|"+ Eval("SecondMarks") 
                                +"|"+ Eval("ExamTypeId")+"|"+ Eval("GradeId")+"|"+ Eval("Marks")%>'
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
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvGradeSystem" />
                        <asp:AsyncPostBackTrigger ControlID="btn" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnClear" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="clearfix"></div>
            </div>
            <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                <uc:ucSidebar ID="uctlSidebar" runat="server" />
                <!-- end widget -->
            </div>
        </div>
    </section>
</asp:Content>
