
Partial Class users_MyTraining
    Inherits System.Web.UI.Page
  
    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
  
        Dim sqlUser As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")

        sqlUser.SelectCommand = "SELECT CONT(*) FROM supervisee_supervisor WHERE (supervisee_id = @supervisee_id) AND (supervisor_id = @supervisor_id)"
        sqlUser.SelectParameters.Add("supervisor_id", DropDownList1.SelectedValue)
        sqlUser.SelectParameters.Add("supervisee_id", DropDownList2.SelectedValue)

        If sqlUser.Select() = "0" Then
            sqlUser.InsertCommand = "INSERT INTO supervisee_supervisor(supervisee_id,supervisor_id) VALUES (@supervisee_id,@supervisor_id)"
            sqlUser.InsertParameters.Add("supervisor_id", DropDownList1.SelectedValue)
            sqlUser.InsertParameters.Add("supervisee_id", DropDownList2.SelectedValue)
            sqlUser.Insert()
        End If

        ListView1.DataBind()
    End Sub
End Class
