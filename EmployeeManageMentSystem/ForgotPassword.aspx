<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ForgotPassword.aspx.vb" Inherits="ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--favicon-->
    <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
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

    <!-- Theme Style CSS -->
    <link rel="stylesheet" href="assets/css/dark-theme.css" />
    <link rel="stylesheet" href="assets/css/semi-dark.css" />
    <link rel="stylesheet" href="assets/css/header-colors.css" />
    <link href="assets/css/forgotpass.css" rel="stylesheet" />
    <title>Forget Password</title>
</head>

<body class="">
    <!-- wrapper -->
   
     


    <form runat="server" id="form2">
        <asp:ScriptManager id="forgotform" runat="server">    </asp:ScriptManager>
    <div class="wrapper">
        <div class="authentication-forgot d-flex align-items-center justify-content-center">
            <div class="card forgot-box">
                <div class="card-body">
                    <div class="p-3">
                        <div class="text-center">
                            <img src="assets/images/icons/forgot-2.png" width="100" alt="" />
                        </div>
                        <h4 class="mt-5 font-weight-bold">Forgot Password?</h4>
                        <p class="text-muted">Enter your registered email ID to reset the password</p>
                        <div class="my-4">
                            <label class="form-label">Email id</label>
                            <%--<input type="text" class="form-control" placeholder="example@user.com" />--%>
                            <asp:TextBox ID="emailtext" class="form-control" placeholder="example@user.com"  runat="server"></asp:TextBox>
                        </div>
                        <div class="d-grid gap-2">
                            
                           <%-- <asp:Button ID="sendbtn" runat="server" class="btn btn-dark" data-bs-toggle="modal"  OnClientClick="modalclick();" Text="Send" />--%>
                           <%-- <asp:Button ID="otpsend" runat="server" class="btn btn-dark" data-bs-toggle="modal" Text="Send" />--%>
                            <asp:Button ID="otpsend" runat="server" class="btn btn-dark" Text="Send" OnClientClick="openModal();" />
                       
                             
                            <a href="LoginForm.aspx" class="btn btn-light"><i class='bx bx-arrow-back me-1'></i>Back to Login</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>




    </div>
    <!-- end wrapper -->
    <%--modal--%>


    <div class="modal fade bg-dark" id="exampleDarkModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered bg-dark">
            <div class="modal-content bg-dark">
              
                <div class="modal-body text-white">


                    <div class="container">
                        <h1>OTP Verification</h1>
                        <p>Enter the OTP you received to <span id="email"></span></p>
                        <div class="otp-input" runat="server">
                            <input type="number" min="0" max="9" required >
                            <input type="number" min="0" max="9" required >
                            <input type="number" min="0" max="9" required >
                            <input type="number" min="0" max="9" required >
                            <input type="number" min="0" max="9" required >
                            <input type="number" min="0" max="9" required >

                           <%--   <asp:TextBox ID="code1" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code2" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code3" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code4" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code5" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code6" runat="server"></asp:TextBox>--%>
                        </div>
                        <button onclick="verifyOTP()">Verify</button>
                        <div class="resend-text">
                            Didn't receive the code? 
              <span class="resend-link" onclick="resendOTP()">Resend Code</span>
                            <span id="timer"></span>
                        </div>
                    </div>




                </div>
               
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                 
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
    <script src="assets/js/fogotpass.js"></script>
    <script src="assets/js/fogotpass.js"></script>
    <script src="assets/js/sweet.js"></script>
<%--    <script>
        function modalclick() {
            console.log('modalclick function called');
            if ($('#exampleDarkModal').length > 0) {
                console.log('Modal element found');
                $('#exampleDarkModal').modal('show');
            } else {
                console.log('Modal element not found');
            }
        }
    </script>
     <script type="text/javascript">
         function openModal() {
             $("#exampleDarkModal").modal("show");
         }
</script>--%>
    <script>
        function openModal() {
            $('#exampleDarkModal').modal('show');
        }
    </script>
</body>

</html>
