Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports MySql.Data.MySqlClient
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Dim Cmd As New MySqlCommand
    '    Dim con As New SqlConnection
    Dim dr As MySqlDataReader
    Dim ds As New DataSet
    Dim da As New MySqlDataAdapter
    Dim Sql As String
    Public userid, firstname, lastname As String
    Dim Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("MySession") Is Nothing Then

            Response.Redirect("LoginForm.aspx.aspx")
        Else
            If Not Page.IsPostBack Then
                userid = Session("id")
                firstname = Session("FirstName")
                lastname = Session("LastName")
                username.Text = firstname + " " + lastname


            End If
            '' LoadAll()
        End If

    End Sub

    Protected Sub logout_button_Click(sender As Object, e As EventArgs) Handles logout_button.Click
        Session.Clear()
        Session.Abandon()

        Response.Redirect("LoginForm.aspx")
    End Sub
End Class

