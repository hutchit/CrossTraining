
Partial Class users_MyTraining
    Inherits System.Web.UI.Page
  
    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Dim user As New CreateUserWizard
        'user = CType(sender, CreateUserWizard)

        Dim sqlUser As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        sqlUser.InsertCommand = "INSERT INTO supervisee_supervisor(supervisee_id,supervisor_id) VALUES (@supervisee_id,@supervisor_id)"

        ' Dim supervisor As DropDownList = DropDownList1.DataValueField
        'CType(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddDepartments"), DropDownList)
        ' Dim txtFirstName As TextBox = CType(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtFirstName"), TextBox)
        ' Dim txtLastName As TextBox = CType(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtLastName"), TextBox)

        'Dim supervisor As Integer
        'Dim supervisee As Integer

        'supervisor = CType(DropDownList1.SelectedValue, Integer)
        'supervisee = CType(DropDownList2.DataValueField, Integer)

        sqlUser.InsertParameters.Add("supervisor_id", DropDownList1.SelectedValue)
        sqlUser.InsertParameters.Add("supervisee_id", DropDownList2.SelectedValue)

        'sqlUser.InsertParameters.Add("first_name", txtFirstName.Text)
        'sqlUser.InsertParameters.Add("last_name", txtLastName.Text)
        'sqlUser.InsertParameters.Add("username", CreateUserWizard1.UserName)
        sqlUser.Insert()

    End Sub
End Class
