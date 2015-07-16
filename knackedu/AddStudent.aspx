<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="knackedu.AddStudent"
    MasterPageFile="~/afterlogin.Master" Title="MasterInfo - Student" %>

<%@ Register TagPrefix="uc" Src="~/Sidebar.ascx" TagName="ucSidebar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPContent" runat="server">
    <asp:Label runat="server" ID="lblErrorMsg" ForeColor="Red"></asp:Label>

    <section class="section-white">
        <div class="container">
            <div class="row">
                <div id="content" class="col-md-9 col-sm-12">
                    <div class="widget-title">
                        <h4>New Student Form</h4>
                        <hr>
                    </div>
                    <div class="stepwizard col-md-offset-3">
                        <div class="stepwizard-row setup-panel">
                            <div class="stepwizard-step">
                                <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                                <p>Personal Information</p>
                            </div>
                            <div class="stepwizard-step">
                                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                                <p>Other Information</p>
                            </div>
                            <div class="stepwizard-step">
                                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                                <p>Contact Details</p>
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-1">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3>Personal Information</h3>
                                <div class="form-group">
                                    <label class="control-label">Admission No</label>
                                    <asp:TextBox runat="server" ID="txtAdmissionNumber" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Category Code</label>
                                    <asp:TextBox runat="server" ID="txtCategoryCode" class="form-control mandCat"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Admission To Year</label>
                                    <select class="form-control">
                                        <option value="Select">Select</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Admission to Class</label>
                                    <select class="form-control">
                                        <option value="Select">Select</option>
                                        <option value="NURSERY">NURSERY</option>
                                        <option value="LKG">LKG</option>
                                        <option value="UKG">UKG</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Section</label>
                                    <select class="form-control">
                                        <option selected="selected" value="Select">Select</option>
                                        <option value="A1">A1</option>
                                        <option value="A2">A2</option>
                                        <option value="A3">A3</option>
                                        <option value="A4">A4</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">First Name</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="First Name" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Surname</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Surname" />
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Section</label>
                                    <select class="form-control">
                                        <option selected="selected" value="Select">Select</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Date Of admission</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Date Of admission" />
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Place Of Birth</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Place Of Birth" />
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Date Of Birth</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Date Of Birth" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Section</label>
                                    <select class="form-control">
                                        <option value="Select">Select</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Mother Tongue: </label>
                                    <input type="radio" checked="checked" class="control-label" />
                                    <label for="rdot">Telugu</label>&nbsp;&nbsp;&nbsp;
										
                                    <input type="radio" checked="checked" class="control-label" />
                                    <label for="rdot">Hindi</label>&nbsp;&nbsp;&nbsp;
										
                                    <input type="radio" checked="checked" class="control-label" />
                                    <label for="rdot">English</label>

                                </div>

                                <div class="form-group">
                                    <label class="control-label">Identity Mark1</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Identity Mark1" />
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Identity Mark2</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Identity Mark2" />
                                </div>

                                <asp:Button class="btn btn-lg pull-right" runat="server"
                                    ID="btnCategory" Text="Next" OnClientClick="javascript:return ValidateCategories();" />
                            </div>
                        </div>
                    </div>

                    <div class="row setup-content" id="step-2">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3>Other Information</h3>
                                <div class="form-group">
                                    <label class="control-label">Admission No</label>
                                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Admission To Year</label>
                                    <select>
                                        <option value="Select">Select</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                    </select>
                                </div>
                                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-3">
                        <div class="col-xs-6 col-md-offset-3">
                            <div class="col-md-12">
                                <h3>Contact Details</h3>
                                <button class="btn btn-success btn-lg pull-right" type="submit">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="sidebar" class="col-md-3 col-sm-12 pull-right">
                    <uc:ucSidebar ID="uctlSidebar" runat="server" />
                    <!-- end widget -->
                </div>
            </div>

        </div>
    </section>
</asp:Content>
