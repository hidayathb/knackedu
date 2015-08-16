<%@ Page Title="Contact" Language="C#" MasterPageFile="~/beforelogin.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="knackedu.Contact" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="CPContent">
    <section class="section-white">
        <div class="container">
            <div class="row">
                <div id="content" class="col-md-9 col-sm-12">
                    <div class="widget-title">
                        <h4 style="margin-left: 15px">Contact Form</h4>
                        <hr style="margin-left: 15px">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label class="control-label">Full Name<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox ID="txtFullName" required="required" runat="server" MaxLength="200" CssClass="form-control txtmandStep"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Email<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="200" CssClass="form-control txtmandStep" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Address<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox ID="txtDateOfAdmission" TextMode="MultiLine" runat="server" MaxLength="200"
                                    CssClass="form-control txtmandStep" required="required"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Country<font color="#FF3300">&nbsp;*</font></label>
                                <asp:DropDownList ID="drpCountry" runat="server" CssClass="form-control drpmandStep" required="required">
                                    <asp:ListItem Text="India" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label class="control-label">State<font color="#FF3300">&nbsp;*</font></label>
                                <asp:DropDownList ID="drpState" runat="server" CssClass="form-control drpmandStep"
                                    required="required">
                                    <asp:ListItem Selected="True">Select</asp:ListItem>
                                    <asp:ListItem Text="Andhra Pradesh" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Arunachal Pradesh" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Assam" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Bihar" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Chandigarh" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Chhattisgarh" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Dadra and Nagar Haveli" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Daman and Diu" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Delhi" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Goa" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Gujarat" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Haryana" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Himachal Pradesh" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Jammu and Kashmir" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Jharkhand" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Karnataka" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Kerala" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Madhya Pradesh" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Maharashtra" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Manipur" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Meghalaya" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Mizoram" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Nagaland" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Orissa" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Punjab" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Sikkim" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Tamil Nadu" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Tripura" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Uttar Pradesh" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Uttarakhand" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="West Bengal" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label class="control-label">City<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox ID="txtCity" runat="server" MaxLength="200"
                                    CssClass="form-control txtmandStep" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Zip Code<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox ID="txtZip" runat="server" MaxLength="200"
                                    CssClass="form-control txtmandStep" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Phone<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox ID="txtPhone" runat="server" MaxLength="200"
                                    CssClass="form-control txtmandStep" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Comments<font color="#FF3300">&nbsp;*</font></label>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" MaxLength="200"
                                    CssClass="form-control txtmandStep" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button class="btn btn-lg btn-primary pull-left" runat="server"
                                    ID="btnSubmit" Text="Submit" />
                            </div>
                            <div class="form-group">
                                <asp:Button class="btn btn-primary btn-lg pull-right" runat="server"
                                    ID="btnReset" Text="Reset" />
                            </div>

                        </div>
                    </div>
                    <!-- end widget -->
                </div>
            </div>

        </div>
    </section>
</asp:Content>
