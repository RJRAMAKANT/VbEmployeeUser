<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LeaveApply.aspx.vb" Inherits="LeaveApply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">



<div class="m-1" style="background-color:#193A4A; border-radius:10px;">
<div class="p-2" >
  <div class="alert alert-secondary text-center font-weight-bold" role="alert">APPLY YOUR LEAVE HERE !
  </div>
</div>
 

  <div class="row ml-3">
    <div class="form-group col-lg-3">
       <label for="" class="form-label font-weight-bold text-white form-label-top">Leave Application !</label>
      <%--<input type="text" class="form-control">--%>
        <asp:TextBox ID="availeave" class="form-control" ReadOnly runat="server"></asp:TextBox>
      <label for="" class="form-sub-label text-secondary text-sm">Available Leave</label>
      <span class="text-danger">*</span>
    </div>
    <div class="form-group col-lg-3">
      <label for="">&nbsp</label>
      <%--<input type="text"  class="form-control">--%>
        <asp:TextBox ID="LeaveFirstName" ReadOnly class="form-control" runat="server"></asp:TextBox>
      <label for="" class="form-sub-label text-secondary text-sm">FIRST NAME</label>
      <span class="text-danger">*</span>
    </div>
    <div class="form-group col-lg-2">
      <label for="">&nbsp</label>
      <%--<input type="text" class="form-control">--%>
        <asp:TextBox ID="LeaveLastName" class="form-control" runat="server"></asp:TextBox>
      <label for="" class="form-sub-label text-sm text-secondary">LastName</label>
    </div>
    <div class="form-group col-lg-3">
      <label for="" class="text-white">EMPLOYEE ID NUMBER</label>
      <span class="text-danger">*</span>
      <%--<input type="number" class="form-control" placeholder="ex: 3892" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="4">--%>
        <asp:TextBox class="form-control" ID="LeaveIdno" ReadOnly type="number" runat="server" placeholder="ex: 3892" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="4"></asp:TextBox>
      <label for="" class="form-sub-label text-sm  text-secondary">4-digit Employee ID Number</label>
    </div>
  </div>
 <div class="row ml-3">
   <div class="form-group col-lg-3">
     <label for="">&nbsp</label>
     <%--<input type="text" class="form-control">--%>
       <asp:TextBox ID="leavedesg" class="form-control" ReadOnly runat="server"></asp:TextBox>
     <label for="" class="form-sub-label text-sm text-secondary">POSITION</label>
     <span class="text-danger">*</span>
   </div>
<%--   <div class="form-group col-lg-5">
     <label for="">&nbsp</label>
     <input type="text" class="form-control">
     <label for="" class="form-sub-label text-sm text-secondary">DEPARTMENT OFFICE</label>
     <span class="text-danger">*</span>
   </div>--%>
   <div class="col-lg-3">
     <label for="">&nbsp</label>
     <%--<input type="text" class="form-control">--%>
       <asp:TextBox ID="LeaveManager" ReadOnly class="form-control" runat="server"></asp:TextBox>
     <label for="" class="form-sub-label text-sm text-secondary">MANAGER</label>
     <span class="text-danger">*</span>
   </div>
   <div class="form-group col-lg-5">
     <label for="">&nbsp</label>
     <%--<input type="text" class="form-control" placeholder="email@example.com">--%>
       <asp:TextBox ID="LeaveEmail" ReadOnly class="form-control" placeholder="email@example.com" runat="server"></asp:TextBox>
     <label for="" class="form-sub-label text-sm text-secondary">EMAIL ADDRESS</label>
     <span class="text-danger">*</span>
   </div>
   <div class="form-group col-lg-5">
     <label for="">&nbsp</label>
     <%--<input type="number" class="form-control">--%>
       <asp:TextBox ID="LeaveNumber" ReadOnly style="width:350px;" class="form-control" type="number" runat="server"></asp:TextBox>
     <label for="" class="form-sub-label text-sm text-secondary">PHONE NUMBER</label>
     <span class="text-danger">*</span>
   </div>
 </div>
<div class="p-1">
  <div class="alert alert-secondary text-center font-weight-bold" role="alert">DETAILS OF LEAVE 
  </div>
</div>
<div class="row ml-3">
  <div class="form-group col-lg-3">
    <label for="" class="text-white">Leave Start</label>
    <span class="text-danger">*</span>
    <%--<input type="date" class="form-control">--%>
      <asp:TextBox type="date"  class="form-control" runat="server"></asp:TextBox>
  </div>
  <div class="form-group col-lg-3">
    <label for="" class="text-white">Leave End</label>
    <span class="text-danger">*</span>
     <asp:TextBox type="date"  class="form-control" runat="server"></asp:TextBox>
  </div>
</div>
<%--</div>--%>
<div class="row ml-3">
  <div class="form-group col-lg-3">
    <label for="" class="text-white">Reason</label>
    <span class="text-danger">*</span>
   <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Leave Type" Value="" CssClass="text-secondary" />
                <asp:ListItem Text="Vacation Leave" Value="Vacation Leave" />
                <asp:ListItem Text="OutStation Leave" Value="Maternity/Paternity Leave" />
                <asp:ListItem Text="Sick Leave" Value="Sick Leave" />
                <asp:ListItem Text="OTHER" Value="Other" />
            </asp:DropDownList>
  </div>

     <div class="form-group col-lg-3">
    <label for="" class="text-white">Leave Type</label>
    <span class="text-danger">*</span>
   <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="form-control">
                <asp:ListItem Text="SELECT LEAVE TYPE" Value="" CssClass="text-secondary" />
                <asp:ListItem Text="Half Day" Value="Half Day" />
                <asp:ListItem Text="Full Day" Value="Full Day" />
            </asp:DropDownList>
  </div>


</div>
  <div class="row ml-3">
    <div class="form-group col-lg-6">
      <label for="">Leave Reason</label>
      <span class="text-danger">*</span>
      <textarea class="form-control" name="" id="" rows="3" cols="10"></textarea>

    </div>
    <div class="form-group col-lg-6">
      <button type="button" class="btn btn-primary p-2 font-weight-bold mt-5 w-25">Request Leave</button>  
    </div>
  </div>
<hr>
    </div>
</asp:Content>

