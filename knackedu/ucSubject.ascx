<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSubject.ascx.cs" Inherits="knackedu.ucSubject" %>
<div class="form-group">
    <asp:Label runat="server" ID="lblSubjectName" Text="<%= SubjectName %>" CssClass="control-label"></asp:Label>
    <asp:TextBox runat="server" ID="txtSubject" class="form-control txtgrade"
        onkeyup="ChangeMarks(this);" TextMode="Number"></asp:TextBox>
</div>