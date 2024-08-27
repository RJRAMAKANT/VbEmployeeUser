Imports System
Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Imports System.Net.Mail

Imports System.Data.SqlClient

Imports System.IO


Imports System.Text

Imports System.Security
Partial Class ForgotPAssword1
    Inherits System.Web.UI.Page
    Dim Cmd As New MySqlCommand
    '    Dim con As New SqlConnection
    Dim dr As MySqlDataReader
    Dim ds As New DataSet
    Dim da As New MySqlDataAdapter
    Dim Sql As String
    'Dim otp As Integer
    Private Shared otp As Integer
    Dim Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)

    Protected Sub ShowPopup(ByVal sender As Object, ByVal e As EventArgs)

        Dim emailvalue As String = emailtext.Text.Trim
        If String.IsNullOrEmpty(emailvalue) Then
            Dim myscript As String = "Swal.fire({icon: 'error', title: 'Sorry !', text: 'Email Id Can not be Empty'}).then(function() {});"
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", myscript, True)
           
        Else

            'Dim script = " $('#exampleDarkModal').modal('show');"
            'ClientScript.RegisterStartupScript(Me.GetType(), "script", script, True)
            Dim query As String = "Select id, FirstName, LastName,designation,Email,manager,PhoneNumber from employee11 where Email=@Email"
            Cmd.CommandText = query
            Cmd.Parameters.AddWithValue("@Email", emailtext.Text.Trim())

            Cmd.Connection = Con
            Con.Open()
            dr = Cmd.ExecuteReader()

            If dr.Read() Then

                SendEmail()
                Dim script = " $('#exampleDarkModal').modal('show');"
                ClientScript.RegisterStartupScript(Me.GetType(), "script", script, True)
            Else
                Dim myscript As String = "Swal.fire({icon: 'error', title: 'Sorry !', text: 'Wrong Email ID'}).then(function() {});"
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", myscript, True)
            End If
            Con.Close()

           
        End If

    End Sub

    Protected Sub VerifyOtp_Click(sender As Object, e As EventArgs) Handles VerifyOtp.Click

        Dim c1 As String = code1.Text.Trim()
        Dim c2 As String = code2.Text.Trim()
        Dim c3 As String = code3.Text.Trim()
        Dim c4 As String = code4.Text.Trim()
        Dim c5 As String = code5.Text.Trim()
        Dim c6 As String = code6.Text.Trim()


        Dim Finalcode As String = c1 & c2 & c3 & c4 & c5 & c6


        Dim FinalcodeInt As Integer = otp

        If Integer.TryParse(Finalcode, FinalcodeInt) Then

            If FinalcodeInt.Equals(FinalcodeInt) Then
                Dim emailcode As String = emailtext.Text.Trim ' Replace with actual email retrieval logic
                Dim redirectUrl As String = "ResetPAssword.aspx?emailcode1=" & Server.UrlEncode(emailcode)
                Response.Redirect(redirectUrl)
            Else

                Dim myscript As String = "Swal.fire({icon: 'error', title: 'Sorry !', text: 'Wrong OTP'}).then(function() {});"
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", myscript, True)

            End If
        Else

        End If
    End Sub


    Protected Sub Sendcodeagain_Click(sender As Object, e As EventArgs) Handles Sendcodeagain.Click
        SendEmail()
        Dim script = " $('#exampleDarkModal').modal('show');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", script, True)
        Dim myscript As String = "Swal.fire({icon: 'success', title: 'Sorry !', text: 'OTP Sent Again'}).then(function() {});"
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", myscript, True)
    End Sub






Sub SendEmail()
        Try
            ' Generate a 6-digit random number
            Dim random As New Random()
            otp = 0
            otp = random.Next(100000, 1000000) ' Generates a number between 100000 and 999999

            Dim Smtp_Server As New SmtpClient()
            Dim e_mail As New MailMessage()

            ' Configure the SMTP server
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential("ncdirstrokeregistry@gmail.com", "ubxc moto wjuh lrwl")
            Smtp_Server.Port = 587
            Smtp_Server.EnableSsl = True
            Smtp_Server.Host = "smtp.gmail.com"

            ' Set up the email message
            e_mail.From = New MailAddress("ncdirstrokeregistry@gmail.com")
            e_mail.To.Add(emailtext.Text.Trim)
            e_mail.Subject = "Forgot Password Request"

            ' Create the email body
            Dim body As String = "<html><body>"
            body &= "<h2>Hi! A Forgot Password Request was made. Here is your OTP:</h2>"
            body &= "<p><strong>OTP: " & otp.ToString() & "</strong></p>"
            body &= "<br><br>"
            body &= "</body></html>"

            e_mail.Body = body
            e_mail.IsBodyHtml = True

            ' Send the email
            Smtp_Server.Send(e_mail)
            'MsgBox("Mail Sent")

        Catch ex As SmtpException
            ' Handle SMTP specific exceptions
            MsgBox("SMTP Error: " & ex.Message)
        Catch ex As Exception
            ' Handle general exceptions
            MsgBox("Error: " & ex.Message)
        End Try
    End Sub

  
  
End Class
