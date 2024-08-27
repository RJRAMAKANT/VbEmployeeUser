<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ResetPAssword.aspx.vb" Inherits="ResetPAssword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    	<meta charset="utf-8">
	<    <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
    <!--plugins-->
    <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
    <!-- loader-->
    <link href="assets/css/pace.min.css" rel="stylesheet" />
    <script src="assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap-extended.css" rel="stylesheet">
    <link href="../../../../fonts.googleapis.com/css276c7.css?family=Roboto:wght@400;500&amp;display=swap" rel="stylesheet">
    <link href="assets/css/app.css" rel="stylesheet">
    <link href="assets/css/icons.css" rel="stylesheet">
    <link href="assets/css/sweet.css" rel="stylesheet" />
    <script src="assets/js/sweet.js"></script>
    <title>Reset Password</title>
</head>
<body>
    <form id="form1" runat="server">
    	<div class="wrapper">
		<div class="authentication-reset-password d-flex align-items-center justify-content-center">
		 <div class="container">
			<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-3">
				<div class="col mx-auto">
					<div class="card">
						<div class="card-body">
							<div class="p-4">
								<div class="mb-4 text-center">
									<img src="assets/images/logo-icon.png" width="60" alt="" />
								</div>
								<div class="text-start mb-4">
									<h5 class="">Genrate New Password</h5>
									<p class="mb-0">We received your reset password request. Please enter your new password!</p>
								</div>
								<div class="mb-3 mt-4">
									<label class="form-label">New Password</label>
									<%--<input type="text" class="form-control" placeholder="Enter new password" />--%>
                                   <asp:TextBox ID="newpass" class="form-control" placeholder="Enter new password" runat="server"></asp:TextBox>
								</div>
								<div class="mb-4">
									<label class="form-label">Confirm Password</label>
									<%--<input type="text" class="form-control" placeholder="Confirm password" />--%>
                                    <asp:TextBox ID="newpass1" class="form-control" placeholder="Confirm password" runat="server"></asp:TextBox>
								</div>
								<div class="d-grid gap-2">
						<%--			<button type="button" class="btn btn-primary">Change Password</button> <a href="authentication-login.html" class="btn btn-light"><i class='bx bx-arrow-back mr-1'></i>Back to Login</a>--%>
								     <asp:Button ID="resetpass" runat="server" class="btn btn-primary" Text="Change Password" /><a href="LoginForm.aspx" class="btn btn-light"><i class='bx bx-arrow-back mr-1'></i>Back to Login</a>
                                </div>
							</div>
           
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
	</div>
    </form>

     <!-- Bootstrap JS -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <!--plugins-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
    <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
    <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
    <!--app JS-->
    <script src="assets/js/app.js"></script>


</body>
</html>
