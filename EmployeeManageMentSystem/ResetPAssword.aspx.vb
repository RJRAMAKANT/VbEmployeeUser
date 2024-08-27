Imports System
Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Imports System.Net.Mail

Imports System.Data.SqlClient

Imports System.IO


Imports System.Text

Imports System.Security
Partial Class ResetPAssword
    Inherits System.Web.UI.Page
    Dim emailurl As String
    Dim Cmd As New MySqlCommand
    '    Dim con As New SqlConnection
    Dim dr As MySqlDataReader
    Dim ds As New DataSet
    Dim da As New MySqlDataAdapter
    Dim Sql As String
    'Dim otp As Integer
    Private Shared otp As Integer
    Dim Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        emailurl = Request.QueryString("emailcode1")



    End Sub


    Protected Sub resetpass_Click(sender As Object, e As EventArgs) Handles resetpass.Click
        Dim pass1 As String = newpass.Text.Trim()
        Dim pass2 As String = newpass1.Text.Trim()

        ' Check if passwords match
        If pass1 <> pass2 Then
            'Dim myscript As String = "Swal.fire({icon: 'error', title: 'Error!', text: 'Passwords do not match.'}).then(function() {});"
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", myscript, True)
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Both PAssword Should Match.');", True)
            Exit Sub
        End If

        Dim query As String = "UPDATE employee11 SET password = @passwordnew WHERE Email = @Email"

        Using Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString),
              Cmd As New MySqlCommand(query, Con)
            Try
                ' Add parameters to the command
                Cmd.Parameters.AddWithValue("@passwordnew", pass1)
                Cmd.Parameters.AddWithValue("@Email", emailurl)

                Con.Open()
                Dim rowsAffected As Integer = Cmd.ExecuteNonQuery()

                ' Check if any rows were affected
                If rowsAffected > 0 Then
               
                    'Dim myscript As String = "Swal.fire({icon: 'success', title: 'Sorry !', text: Password updated successfully.}).then(function() {});"
                    'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", myscript, True)
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Password updated successfully.');", True)
                    Response.Redirect("LoginForm.aspx")
                Else
                    Dim errorScript As String = "Swal.fire({icon: 'error', title: 'Sorry!', text: 'Wrong Email ID.'}).then(function() {});"
                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", errorScript, True)
                End If
            Catch ex As Exception
                ' Log the exception or handle it as necessary
                'Dim errorScript As String = "Swal.fire({icon: 'error', title: 'Error!', text: 'An error occurred while updating the password.'}).then(function() {});"
                'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "MyScript", errorScript, True)
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('An error occurred while updating the password..');", True)

            Finally
                Con.Close()
            End Try
        End Using
    End Sub

    
End Class
