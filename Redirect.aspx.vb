﻿
Partial Class Redirect
    Inherits System.Web.UI.Page


    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad
        Dim user1 As String

        user1 = User.Identity.Name
        Label1.Text = user1
        Response.BufferOutput = True


        If String.Compare("admin", user1) = 0 Then
            Response.Redirect("admin/Departments.aspx")
        Else
            Response.Redirect("users/MyTraining.aspx")


        End If
    End Sub

End Class
