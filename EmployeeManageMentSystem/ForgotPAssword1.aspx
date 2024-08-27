<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ForgotPAssword1.aspx.vb" Inherits="ForgotPAssword1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

     <%-- <link href="assets/css/ModalCssvb.css" rel="stylesheet" />
     <script src="assets/js/Modaljsvb1.js"></script>
    <script src="assets/js/Modaljsvb2.js"></script>
     <script src="assets/js/sweet.js"></script>--%>
 <link href="assets/css/ModalCssvb.css" rel="stylesheet" />
       <script src="assets/js/Modaljsvb1.js"></script>
     <script src="assets/js/Modaljsvb2.js"></script>
        <script src="assets/js/sweet.js"></script>

  
   <%-- <script src="assets/js/Modaljsvb2.js"></script>--%>
 
 <%--     <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />--%>
<%--<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>--%>
   
<%--<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>--%>

    <title>Forget Password</title>
</head>
<body>
    <form id="form1" runat="server">
             <asp:ScriptManager id="form_ser" runat="server">    </asp:ScriptManager>
    
    <div>

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
                            
                          <%--  <asp:Button ID="otpsend" runat="server" class="btn btn-dark" Text="Send" OnClientClick="openModal();" />--%>
                            <%--<asp:Button ID="otpsend" runat="server" class="btn btn-dark" data-bs-toggle="modal" Text="Send" />
                           --%>
                            <asp:Button ID="otpsend" runat="server" class="btn btn-dark" Text="Send" data-bs-toggle="modal" OnClick="ShowPopup" />
                             
                            <a href="LoginForm.aspx" class="btn btn-light"><i class='bx bx-arrow-back me-1'></i>Back to Login</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>




    </div>
    <!-- end wrapper -->
    <%--modal--%>


    <div class="modal fade bg-dark" id="exampleDarkModal" tabindex="1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered bg-dark">
            <div class="modal-content bg-dark">
              
                <div class="modal-body text-white">


                    <div class="container">
                        <h1>OTP Verification</h1>
                        <p>Enter the OTP you received  <span id="email"></span></p>
                        <div class="otp-input">
                       <asp:TextBox ID="code1" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code2" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code3" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code4" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code5" runat="server"></asp:TextBox>
                            <asp:TextBox ID="code6" runat="server"></asp:TextBox>
                        </div>
                        <%--<button onclick="verifyOTP()">Verify</button>--%>
                        <asp:Button ID="VerifyOtp" CssClass="btn btn-warning" runat="server" Text="Verify" />
                        <div class="resend-text">
                            Didn't receive the code? 
              <%--<span class="resend-link" id="resend" runat="server">Resend Code</span>--%>
                            <asp:LinkButton ID="Sendcodeagain" style="display:none;" runat="server" Text="Resend Code"/>
                            <span id="timer"></span>
                        </div>
                    </div>




                </div>
               
                  <%--  <button type="button" class="btn btn-light" onclick="modalhide()">Close</button>--%>
                 
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
    <script src="assets/js/fogotpass.js"></script>
    <script src="assets/js/fogotpass.js"></script>

<%--    <script>
        function openModal() {
            $('#exampleDarkModal').modal('show');
        }
    </script>
     --%>

    <script>
        function modalhide() {
            $('#exampleDarkModal').modal('hide');
        }
</script>
</body>

     
    

</html>
