Imports System

Partial Public Class test
    Inherits System.Web.UI.Page

    Protected Sub ShowPopup(ByVal sender As Object, ByVal e As EventArgs)
        Dim title As String = "Greetings"
        Dim body As String = "Welcome to ASPSnippets.com"
        '
        Dim script = " $('#MyPopup').modal('show');"
        ClientScript.RegisterStartupScript(Me.GetType(), "Popup", script, True)
    End Sub
End Class
