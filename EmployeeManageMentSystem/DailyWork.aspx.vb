Imports System.Net
Imports System.Web.Script.Serialization
Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient

Partial Class DailyWork
    Inherits System.Web.UI.Page
    Dim Cmd As New MySqlCommand
    '    Dim con As New SqlConnection
    Dim dr As MySqlDataReader
    Dim ds As New DataSet
    Dim da As New MySqlDataAdapter
    Dim Sql As String
    Dim Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
    Public firstname, lastname As String
    Public userid As Integer
    Public todayswork As String
    Public tearn As Integer
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("MySession") Is Nothing Then

            Response.Redirect("LoginForm.aspx")
        Else
            If Not Page.IsPostBack Then
                userid = Session("ID")
                firstname = Session("FirstName")
                lastname = Session("LastName")

                todaywork()
                Text_daily_eid.Text = userid

                Text_daily_ename.Text = firstname + " " + lastname
                Text_daily_edate.Text = Date.Today.ToString("dd/MM/yyyy")
                Text_daily_eday.Text = Date.Today.DayOfWeek.ToString()
                dailyWork_details.Text = todayswork
                LoadGridViewData()

                'LoadTableData()
                'gridpanel.Visible = True
            End If

        End If

    End Sub




    Protected Sub daily_work_submit_Click(sender As Object, e As EventArgs) Handles daily_work_submit.Click
        Dim query1 As String = "SELECT COUNT(*) FROM dailywork WHERE data = @date"
        Cmd.CommandText = query1
        Cmd.Parameters.AddWithValue("@date", Text_daily_edate.Text)
        Cmd.Connection = Con
        Con.Open()

        Dim rowlength1 As Integer = Convert.ToInt32(Cmd.ExecuteScalar())

        Con.Close() ' Close the connection after retrieving data

        If rowlength1 > 0 Then
            ' If data exists, perform update
            Dim empid As String = Text_daily_eid.Text
            Dim work As String = dailyWork_details.Text

            Dim query As String = "UPDATE dailywork SET work = @work WHERE id = @empid AND data = @date"
            Cmd.CommandText = query
            Cmd.Connection = Con

            ' Clear parameters before adding new ones
            Cmd.Parameters.Clear()
            Cmd.Parameters.AddWithValue("@empid", empid)
            Cmd.Parameters.AddWithValue("@work", work)
            Cmd.Parameters.AddWithValue("@date", Text_daily_edate.Text)

            Con.Open()
            Dim rowlength As Integer = Cmd.ExecuteNonQuery()
            Con.Close() ' Close connection after use

            If rowlength > 0 Then
                'GridView1.DataBind()
                ClientScript.RegisterStartupScript(Me.GetType(), "ShowMessage", "alert('WorkDetails Updated');", True)
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Toastr", "toastr.success('WorkDetails Updated successfully!');", True)


            Else
                ClientScript.RegisterStartupScript(Me.GetType(), "ShowMessage", "alert('Update Failed');", True)
            End If
        Else
            ' If data doesn't exist, perform insert
            Dim empid As String = Text_daily_eid.Text
            Dim today As String = Text_daily_edate.Text
            Dim weakday As String = Text_daily_eday.Text
            Dim empname As String = Text_daily_ename.Text
            Dim work As String = dailyWork_details.Text
            Dim comment As String = ""

            Dim query As String = "INSERT INTO dailywork(id, work, data, day, comment, empname) VALUES (@empid, @work, @today, @weakday, @comment, @empname)"
            Cmd.CommandText = query
            Cmd.Connection = Con

            ' Add parameters to prevent SQL injection and ensure proper data handling
            Cmd.Parameters.AddWithValue("@empid", empid)
            Cmd.Parameters.AddWithValue("@work", work)
            Cmd.Parameters.AddWithValue("@today", today)
            Cmd.Parameters.AddWithValue("@weakday", weakday)
            Cmd.Parameters.AddWithValue("@comment", comment)
            Cmd.Parameters.AddWithValue("@empname", empname)

            Con.Open()
            Dim rowlength As Integer = Cmd.ExecuteNonQuery()
            Con.Close() ' Close connection after use

            If rowlength > 0 Then
                updateMoney()
                ClientScript.RegisterStartupScript(Me.GetType(), "ShowMessage", "alert('WorkDetails Saved');", True)

            Else
                ClientScript.RegisterStartupScript(Me.GetType(), "ShowMessage", "alert('Insert Failed');", True)
            End If
        End If

        'LoadTableData()
        LoadGridViewData()

    End Sub

    Public Sub todaywork()
        Dim query As String = "SELECT work FROM dailywork WHERE data = @date AND id = @userid"
        Cmd.CommandText = query
        Cmd.Parameters.AddWithValue("@date", Date.Today.ToString("dd/MM/yyyy"))
        Cmd.Parameters.AddWithValue("@userid", userid)

        Cmd.Connection = Con
        Con.Open()
        dr = Cmd.ExecuteReader()

        If dr.Read() Then
            todayswork = dr("work").ToString()
        Else
            todayswork = " "
        End If

        dr.Close()
        Con.Close()
    End Sub


    Public Sub LoadGridViewData()
        Dim query As String = "SELECT id, empname, data, day, work, comment FROM dailywork WHERE id = @userid ORDER BY SLNO DESC"
        Dim user = Session("ID")
        Using Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
            Using Cmd As New MySqlCommand(query, Con)
                Cmd.Parameters.AddWithValue("@userid", User)

                Con.Open()

                Using dr As MySqlDataReader = Cmd.ExecuteReader()
                    GridView1.DataSource = dr
                    GridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub




    Protected Sub GridView1_Load(sender As Object, e As EventArgs) Handles GridView1.Load
        LoadGridViewData()
    End Sub

Public Sub TotalEarning()
        Dim user = Session("ID")
        Dim query As String = "SELECT totalearn FROM employee11 WHERE id = @userid"
        Using Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
            Using Cmd As New MySqlCommand(query, Con)
                Cmd.Parameters.AddWithValue("@userid", user)

                Con.Open()
                Using dr As MySqlDataReader = Cmd.ExecuteReader()
                    If dr.Read() Then
                        tearn = Convert.ToInt32(dr("totalearn"))
                    End If
                End Using
            End Using
        End Using
    End Sub



   Public Sub updateMoney()
        Dim money As Integer
        Dim user = Session("ID")

        Dim query As String = "SELECT DecryptStringWithoutKey(salary) AS salary FROM employee11 WHERE id = @userid"
        Using Con As New MySqlConnection(ConfigurationManager.ConnectionStrings("local").ConnectionString)
            Using Cmd As New MySqlCommand(query, Con)

                Cmd.Parameters.AddWithValue("@userid", user)

                Con.Open()
                Using dr As MySqlDataReader = Cmd.ExecuteReader()
                    If dr.Read() Then
                        money = Convert.ToInt32(dr("salary"))
                    End If
                End Using
            End Using

            ' Calculate the number of days in the current month
            Dim currentDate As DateTime = DateTime.Now
            Dim currentYear As Integer = currentDate.Year
            Dim currentMonth As Integer = currentDate.Month
            Dim daysInCurrentMonth As Integer = DateTime.DaysInMonth(currentYear, currentMonth)

            ' Calculate the daily money
            Dim DailyMoney As Integer = money / daysInCurrentMonth
            TotalEarning()
            ' Update the total earnings in the database
            Dim query1 As String = "UPDATE employee11 SET totalearn = @tearn + @DailyMoney WHERE id = @userid"

            Using Cmd As New MySqlCommand(query1, Con)
                Cmd.Parameters.AddWithValue("@userid", user)
                Cmd.Parameters.AddWithValue("@DailyMoney", DailyMoney)
                Cmd.Parameters.AddWithValue("@tearn", tearn)
                'Con.Open()
                Cmd.ExecuteNonQuery()
                Con.Close()
            End Using
        End Using
    End Sub

End Class

