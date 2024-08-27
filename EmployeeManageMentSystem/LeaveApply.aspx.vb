Imports System.Net
Imports System.Web.Script.Serialization
Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Partial Class LeaveApply
    Inherits System.Web.UI.Page
    Dim Cmd As New MySqlCommand
    '    Dim con As New SqlConnection
    Dim dr As MySqlDataReader
    Dim ds As New DataSet
    Dim da As New MySqlDataAdapter
    Dim Sql As String
    Dim Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
    Public firstname, lastname, designation As String
    Public userid As String
    Public workcount As Integer
    Public Leaves As Integer
    Public tearn As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("MySession") Is Nothing Then

            Response.Redirect("LoginForm.aspx")
        Else
            If Not Page.IsPostBack Then
                userid = Session("ID")
                firstname = Session("FirstName")
                lastname = Session("LastName")
                designation = Session("designation")
                Dim Emailid As String = Session("Email")
                Dim manager As String = Session("manager")


                LoadLeave()
                LeaveFirstName.Text = firstname
                LeaveLastName.Text = lastname
                LeaveIdno.Text = userid
                leavedesg.Text = designation
                LeaveEmail.Text = Emailid
                LeaveManager.Text = manager
                LeaveNumber.Text = Session("PhoneNumber")
                'todaywork()
                'Text_daily_eid.Text = userid

                'Text_daily_ename.Text = firstname + " " + lastname
                'Text_daily_edate.Text = Date.Today.ToString("dd/MM/yyyy")
                'Text_daily_eday.Text = Date.Today.DayOfWeek.ToString()
                'dailyWork_details.Text = todayswork
                'LoadGridViewData()

                'LoadTableData()
                'gridpanel.Visible = True
            End If

        End If

    End Sub

    Public Sub LoadLeave()

        Dim query As String = "SELECT leaves FROM employee11 WHERE id ='" + userid + "'"
        Cmd.CommandText = query
        'Cmd.Parameters.AddWithValue("@userid", userid)
        Cmd.Connection = Con

        Con.Open()
        dr = Cmd.ExecuteReader()

        If dr.Read() Then
            availeave.Text = Convert.ToInt32(dr("leaves"))

        End If

        dr.Close()
        Con.Close()

    End Sub

End Class
