Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Partial Class LoginForm
    Inherits System.Web.UI.Page
    Dim Cmd As New MySqlCommand
    '    Dim con As New SqlConnection
    Dim dr As MySqlDataReader
    Dim ds As New DataSet
    Dim da As New MySqlDataAdapter
    Dim Sql As String

    Dim Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
 
    Protected Sub Btn_signIn_Click(sender As Object, e As EventArgs) Handles Btn_signIn.Click
        If UserName.Text.Trim() = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Please Enter UserId.');", True)
            Return
        ElseIf Password.Text.Trim() = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Please Enter Password.');", True)
            Return
        Else
            Dim query As String = "Select id, FirstName, LastName from employee11 where Email=@Email and Password=EncryptStringWithoutKey(@Password)"
            Cmd.CommandText = query
            Cmd.Parameters.AddWithValue("@Email", UserName.Text.Trim())
            Cmd.Parameters.AddWithValue("@Password", Password.Text.Trim())
            Cmd.Connection = Con
            Con.Open()
            dr = Cmd.ExecuteReader()

            If dr.Read() Then
                Session("MySession") = "User"
                Session("ID") = Convert.ToString(dr("id"))
                Session("FirstName") = Convert.ToString(dr("FirstName"))
                Session("LastName") = Convert.ToString(dr("LastName"))
                Session.Timeout = 20
                Response.Redirect("DashBorad.aspx")
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Please Enter Correct UserId/Password.');", True)
            End If
            Con.Close()
        End If
    End Sub




End Class
