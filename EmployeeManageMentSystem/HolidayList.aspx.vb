'Imports System.Net
'Imports Newtonsoft.Json.Linq
'Partial Class HolidayList
'     Inherits System.Web.UI.Page

'    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
'        If Not IsPostBack Then
'            BindHolidayList()
'        End If
'    End Sub

'    Private Sub BindHolidayList()
'        Try
'            Dim year As Integer = DateTime.Now.Year
'            Dim requestUrl As String = $"https://date.nager.at/Api/v2/NextPublicHolidaysIN/{year}"

'            Dim request As HttpWebRequest = WebRequest.Create(requestUrl)
'            request.Method = "GET"

'            Using response As HttpWebResponse = request.GetResponse()
'                If response.StatusCode = HttpStatusCode.OK Then
'                    Using responseStream As System.IO.Stream = response.GetResponseStream()
'                        Using reader As New System.IO.StreamReader(responseStream)
'                            Dim jsonResponse As String = reader.ReadToEnd()
'                            Dim holidays As JArray = JArray.Parse(jsonResponse)

'                            Dim holidayList As New List(Of Holiday)()

'                            Dim slNo As Integer = 1
'                            For Each holiday As JObject In holidays
'                                Dim h As New Holiday()
'                                h.SlNo = slNo
'                                h.Date = holiday("date").ToString()
'                                h.HolidayName = holiday("localName").ToString()
'                                holidayList.Add(h)
'                                slNo += 1
'                            Next

'                            GridView1.DataSource = holidayList
'                            GridView1.DataBind()
'                        End Using
'                    End Using
'                Else
'                    Throw New Exception("Failed to fetch holidays.")
'                End If
'            End Using
'        Catch ex As Exception
'            Response.Write($"Error fetching holidays: {ex.Message}")
'        End Try
'    End Sub

'    Public Class Holiday
'        Public Property SlNo As Integer
'        Public Property [Date] As String
'        Public Property HolidayName As String
'    End Class

'End Class
