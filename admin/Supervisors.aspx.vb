
Partial Class users_MyTraining
    Inherits System.Web.UI.Page
  
    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim supervisor_id As Integer = CType(DropDownList1.SelectedValue, Integer)
        Dim supervisee_id As Integer = CType(DropDownList2.SelectedValue, Integer)
        Dim supervisor As Employee = New Employee(supervisor_id)

        If Not supervisor.isSupervisor(supervisee_id) Then
            Dim sqlUser As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
            sqlUser.InsertCommand = "INSERT INTO supervisee_supervisor(supervisee_id,supervisor_id) VALUES (@supervisee_id,@supervisor_id)"
            sqlUser.InsertParameters.Add("supervisor_id", DropDownList1.SelectedValue)
            sqlUser.InsertParameters.Add("supervisee_id", DropDownList2.SelectedValue)
            sqlUser.Insert()
        End If

        ListView1.DataBind()
    End Sub
End Class
