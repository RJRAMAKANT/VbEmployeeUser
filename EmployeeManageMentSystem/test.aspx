<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="test" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />
<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <title>Forget Password</title>
</head>
<body>
    <form id="form1" runat="server">
   <%--     <asp:ScriptManager ID="form_ser" runat="server"></asp:ScriptManager>--%>
        <div>
            <asp:Button ID="btnShowPopup" runat="server" Text="Show Popup" OnClick="ShowPopup"
                CssClass="btn btn-info btn-lg" />
            <div id="MyPopup" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                       
                            <h4 class="modal-title"></h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                       
                        <div class="modal-body">
                                     <div class="container">
                        <h1>OTP Verification</h1>
                        <p>Enter the OTP you received to <span id="email"></span></p>
                        <div class="otp-input">
                         <%--   <input type="number" min="0" max="9" required>
                            <input type="number" min="0" max="9" required>
                            <input type="number" min="0" max="9" required>
                            <input type="number" min="0" max="9" required>
                            <input type="number" min="0" max="9" required>
                            <input type="number" min="0" max="9" required>--%>
                        </div>
                        <button onclick="verifyOTP()">Verify</button>
                        <div class="resend-text">
                            Didn't receive the code? 
              <span class="resend-link" onclick="resendOTP()">Resend Code</span>
                            <span id="timer"></span>
                        </div>
                    </div>

                        </div>
                       
                            <button type="button" class="btn btn-danger" data-dismiss="modal">
                                Close</button>
                        
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
    <script src="assets/js/sweet.js"></script>

<%--<script type="text/javascript">
    function ShowPopup(title, body) {
        $("#MyPopup .modal-title").html(title);
        $("#MyPopup .modal-body").html(body);
        $("#MyPopup").modal("show");
    }
</script>--%>
</body>
</html>
