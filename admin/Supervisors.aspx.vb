
Partial Class users_MyTraining
    Inherits System.Web.UI.Page
  
    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
  
        Dim sqlUser As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        sqlUser.InsertCommand = "INSERT INTO supervisee_supervisor(supervisee_id,supervisor_id) VALUES (@supervisee_id,@supervisor_id)"


        sqlUser.InsertParameters.Add("supervisor_id", DropDownList1.SelectedValue)
        sqlUser.InsertParameters.Add("supervisee_id", DropDownList2.SelectedValue)

   
        sqlUser.Insert()
        ListView1.DataBind()

    End Sub
End Class
