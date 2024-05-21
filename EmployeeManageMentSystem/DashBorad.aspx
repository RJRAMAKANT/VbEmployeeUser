<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DashBorad.aspx.vb" Inherits="DashBorad" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <style>
      @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);

/* Bootstrap Icons */
@import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");

</style>

            <div class="container-fluid mt-2">
                <!-- Card stats -->
                <div class="row g-6 mb-6">
                    <div class="col-xl-3 col-sm-6 col-12 ">
                        <div class="card shadow border-0 "  style="background-color: #01001f;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-md d-block mb-2">Apply Leaves</span>
                                        <span class="h3 font-bold mb-0"><h3><asp:Label runat="server" ForeColor="Gray" ID="Leave_label" Text="label"></asp:Label></h3></span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                            <i class="bi bi-people""></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-2 mb-0 text-sm">
                                    <span class="badge badge-pill bg-soft-success text-success me-2">
                                        <i class="bi bi-arrow-up me-1"></i>
                                    </span>
                                    <span class="text-nowrap text-md text-muted">Total Leave Available</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                      <a href="DailyWork.aspx"> <div class="card shadow border-0" style="background-color: #01001f;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-md d-block mb-2">Enter Dailywork</span>
                                        <span class="h3 font-bold mb-0"><%=workcount%></span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-primary text-white text-lg rounded-circle">
                                            <i class="bi bi-people"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-2 mb-0 text-sm">
                                    <span class="badge badge-pill bg-soft-success text-success me-2">
                                        <i class="bi bi-arrow-up me-1"></i>
                                    </span>
                                    <span class="text-nowrap text-md text-muted">Click Here</span>
                                </div>
                            </div>
                        </div></a>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0" style="background-color: #01001f;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-md d-block mb-2" style="color:white; font-weight:bold;">Update Address</span>
                                        <span class="h3 font-bold mb-0"><asp:Label runat="server" ForeColor="gray" ID="updateaddress_name"></asp:Label></span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-info text-white text-lg rounded-circle">
                                            <i class="bi bi-clock-history"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-2 mb-0 text-sm">
                                    <span class="badge badge-pill bg-soft-success text-danger me-2">
                                        <i class="bi bi-arrow-up me-1"></i>
                                    </span>
                                    <span class="text-nowrap text-md text-muted">Since last month</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0" style="background-color: #01001f;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2">Holdiday List</span>
                                        <span class="h3 font-bold mb-0">100%</span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-warning text-white text-lg rounded-circle">
                                            <i class="bi bi-minecart-loaded"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-2 mb-0 text-sm">
                                    <span class="badge badge-pill bg-soft-success text-success me-2">
                                        <i class="bi bi-arrow-up me-1"></i>
                                    </span>
                                    <span class="text-nowrap text-md text-muted"><asp:Label runat="server" ID="holiday_year"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>








 
</asp:Content>

