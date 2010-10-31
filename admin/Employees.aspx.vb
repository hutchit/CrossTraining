
Partial Class users_MyTraining
    Inherits System.Web.UI.Page


    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
        Dim user As New CreateUserWizard
        user = CType(sender, CreateUserWizard)
        Dim sqlUser As New SqlDataSource

    End Sub
End Class
