Imports System.Net
Imports System.Web.Script.Serialization
Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient

Partial Class DashBorad
    Inherits System.Web.UI.Page
    Dim Cmd As New MySqlCommand
    '    Dim con As New SqlConnection
    Dim dr As MySqlDataReader
    Dim ds As New DataSet
    Dim da As New MySqlDataAdapter
    Dim Sql As String
    Dim Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
    Public firstname, lastname As String
    Public userid As String
    Public workcount As Integer
    Public Leaves As Integer
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("MySession") Is Nothing Then

            Response.Redirect("LoginForm.aspx")
        Else
            If Not Page.IsPostBack Then      
                userId = Session("ID")
                firstname = Session("FirstName")
                lastname = Session("LastName")
                LoadLeave()
                Leave_label.Text = Leaves
                holiday_year.Text = Date.Today().ToString("yyyy")
                updateaddress_name.Text = firstname + " " + lastname
                Loadwork()




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
            Leaves = Convert.ToInt32(dr("leaves"))

        End If

        dr.Close()
        Con.Close()

    End Sub
    Public Sub Loadwork()
        Dim query As String = "SELECT count(work) AS workcount FROM dailywork WHERE id = @userid"
        Cmd.CommandText = query
        Cmd.Parameters.AddWithValue("@userid", userid)
        Cmd.Connection = Con

        Con.Open()
        dr = Cmd.ExecuteReader()

        If dr.Read() Then
            If Not IsDBNull(dr("workcount")) Then
                workcount = Convert.ToInt32(dr("workcount"))
            Else
                workcount = 0 ' Assign 0 if the value is DBNull
            End If
        End If

        dr.Close()
        Con.Close()
    End Sub





    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
    '    Dim address As String = TextBox1.Text

    '    ' Replace "YOUR_API_KEY" with your actual API key
    '    Dim apiKey As String = "663de319625ff634151088cxw53bdf6"
    '    Dim url As String = "https://geocode.xyz/" & address & "?json=1&auth=" & apiKey

    '    ' Ensure TLS 1.2 is used for the request
    '    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12

    '    Dim client As New WebClient()

    '    Try
    '        Dim json As String = client.DownloadString(url)

    '        ' Parsing JSON using JavaScriptSerializer
    '        Dim serializer As New JavaScriptSerializer()

    '        ' Deserialize the JSON response
    '        Dim jsonObject As Object = serializer.Deserialize(Of Object)(json)

    '        ' Check if JSON contains the expected structure
    '        If TypeOf jsonObject Is Dictionary(Of String, Object) Then
    '            Dim latitude As String = jsonObject("latt")
    '            Dim longitude As String = jsonObject("longt")
    '            TextBox2.Text = latitude
    '            TextBox3.Text = longitude
    '        End If
    '    Catch ex As Exception
    '        ' Handle any exceptions
    '        TextBox2.Text = "Error occurred: " & ex.Message
    '    End Try
    'End Sub

End Class
