
Partial Class users_MyTraining
    Inherits System.Web.UI.Page

    Protected Sub btnResetDB_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResetDB.Click
        Dim sqlResetDB As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        sqlResetDB.DeleteCommand = "DELETE FROM jobs; DELETE FROM training; DELETE FROM departments; DELETE FROM supervisee_supervisor"
        sqlResetDB.Delete()
    End Sub
End Class
