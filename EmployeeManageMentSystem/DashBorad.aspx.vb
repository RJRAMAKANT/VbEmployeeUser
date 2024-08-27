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
    Public tearn As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("MySession") Is Nothing Then

            Response.Redirect("LoginForm.aspx")
        Else
            If Not Page.IsPostBack Then      
                userId = Session("ID")
                firstname = Session("FirstName")
                lastname = Session("LastName")
                TotalEarning()
                LoadLeave()
                Leave_label.Text = Leaves
                holiday_year.Text = Date.Today().ToString("yyyy")
                updateaddress_name.Text = tearn
                Loadwork()
                Alldetails()
                graphpanel.Visible = True
                GetDataForYear()
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
    Public Sub TotalEarning()

        Dim query As String = "SELECT totalearn FROM employee11 WHERE id ='" + userid + "'"
        Cmd.CommandText = query
        'Cmd.Parameters.AddWithValue("@userid", userid)
        Cmd.Connection = Con

        Con.Open()
        dr = Cmd.ExecuteReader()

        If dr.Read() Then
            tearn = Convert.ToInt32(dr("totalearn"))

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

    Protected Sub profilebtn_Click(sender As Object, e As EventArgs) Handles profilebtn.Click
        profilepanel.Visible = True
        contactpanel.Visible = False
        projectpanel.Visible = False
        graphpanel.Visible = True
    End Sub


    Protected Sub contactbtn_Click(sender As Object, e As EventArgs) Handles contactbtn.Click
        profilepanel.Visible = False
        contactpanel.Visible = True
        projectpanel.Visible = False
        graphpanel.Visible = True
    End Sub

    Protected Sub projectbtn_Click(sender As Object, e As EventArgs) Handles projectbtn.Click
        profilepanel.Visible = False
        contactpanel.Visible = False
        projectpanel.Visible = True
        graphpanel.Visible = True
    End Sub








    Public Sub Alldetails()
        Dim uuser As String = Session("ID")
        Dim query As String = "SELECT ID, FirstName, LastName, Email, PhoneNumber, Department, HireDate, DecryptStringWithoutKey(salary) as ssal, DOB, Gender, Address, About, leaves, status, totalearn, designation, manager, Project FROM employee11 WHERE id = @userid1"
        Cmd.CommandText = query
        Cmd.Parameters.AddWithValue("@userid1", uuser)
        Cmd.Connection = Con

        Con.Open()
        dr = Cmd.ExecuteReader()

        If dr.Read() Then

            empid.Text = dr("ID").ToString()
            namelabel.Text = dr("FirstName").ToString() & " " & dr("LastName").ToString()
            dsglabel.Text = dr("designation").ToString
            aboutlabel.Text = dr("About").ToString
            dptlabel.Text = dr("Department").ToString
            cempidlabel.Text = dr("ID").ToString()
            cempnamelabel.Text = dr("FirstName").ToString() & " " & dr("LastName").ToString()
            emailLabel.Text = dr("Email").ToString()
            phoneNumberLabel.Text = dr("PhoneNumber").ToString()
            pemplabel.Text = dr("ID").ToString()
            pempnamelabel.Text = dr("FirstName").ToString() & " " & dr("LastName").ToString()
            'departmentLabel.Text = dr("Department").ToString()
            hireDateLabel.Text = Convert.ToDateTime(dr("HireDate")).ToString("yyyy-MM-dd")
            Dim sal As Integer = Convert.ToInt32(dr("ssal"))
            salaryLabel.Text = sal
            doblabel.Text = Convert.ToDateTime(dr("DOB")).ToString("yyyy-MM-dd")
            genderlabel.Text = dr("Gender").ToString()
            addresslabel.Text = dr("Address").ToString()

            statusLabel.Text = dr("status").ToString()
            'designationLabel.Text = dr("designation").ToString()
            managerLabel.Text = dr("manager").ToString()
            projectLabel.Text = dr("Project").ToString()
        End If

        dr.Close()
        Con.Close()

    End Sub


 Public Sub GetDataForYear()
        ' Dim connectionString As String = ConfigurationManager.ConnectionStrings("local").ConnectionString

        Dim curentyear As String = DateTime.Now.Year.ToString()
        Dim query As String = "SELECT " & _
                        "CASE MONTH(dates.month_date) " & _
                        "    WHEN 1 THEN 'Jan' " & _
                        "    WHEN 2 THEN 'Feb' " & _
                        "    WHEN 3 THEN 'Mar' " & _
                        "    WHEN 4 THEN 'Apr' " & _
                        "    WHEN 5 THEN 'May' " & _
                        "    WHEN 6 THEN 'Jun' " & _
                        "    WHEN 7 THEN 'Jul' " & _
                        "    WHEN 8 THEN 'Aug' " & _
                        "    WHEN 9 THEN 'Sep' " & _
                        "    WHEN 10 THEN 'Oct' " & _
                        "    WHEN 11 THEN 'Nov' " & _
                        "    WHEN 12 THEN 'Dec' " & _
                        "    ELSE 'Unknown' " & _
                        "END AS MonthName, " & _
                        "COALESCE(COUNT(dailywork.data), 0) AS WorkingDays " & _
                        "FROM ( " & _
                        "    SELECT '2024-01-01' + INTERVAL (n-1) MONTH AS month_date " & _
                        "    FROM ( " & _
                        "        SELECT 1 AS n " & _
                        "        UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL " & _
                        "        SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL " & _
                        "        SELECT 11 UNION ALL SELECT 12 " & _
                        "    ) AS months " & _
                        ") AS dates " & _
                        "LEFT JOIN demo.dailywork ON MONTH(dates.month_date) = MONTH(STR_TO_DATE(dailywork.data, '%d-%m-%Y')) AND YEAR(dates.month_date) = '" + curentyear + "' " & _
                        "GROUP BY MONTH(dates.month_date) " & _
                        "ORDER BY MONTH(dates.month_date)"

        Cmd.CommandText = query
        Cmd.Connection = Con

        Con.Open()
        dr = Cmd.ExecuteReader()

        If dr.HasRows Then
            Dim dt As New DataTable()
            dt.Load(dr)

            ' Populate data into ASP table
            For Each row As DataRow In dt.Rows
                Dim monthName As String = row("MonthName").ToString()
                Dim workingDays As Integer = Convert.ToInt32(row("WorkingDays"))

                Dim tr As New TableRow()
                Dim tcMonthName As New TableCell()
                Dim tcWorkingDays As New TableCell()

                tcMonthName.Text = monthName
                tcWorkingDays.Text = workingDays.ToString()

                tr.Cells.Add(tcMonthName)
                tr.Cells.Add(tcWorkingDays)

                graphtable.Rows.Add(tr)
            Next
        Else
            
        End If

        Con.Close()
    End Sub



End Class
