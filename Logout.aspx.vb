
Partial Class Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Dim user1 As String
        user1 = User.Identity.Name


    End Sub
End Class
