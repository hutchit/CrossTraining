
Partial Class users_MyTraining
    Inherits System.Web.UI.Page


    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
        Dim user As New CreateUserWizard
        user = CType(sender, CreateUserWizard)

        Dim sqlUser As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        sqlUser.InsertCommand = "INSERT INTO employees(department_id, email, first_name, last_name, username) VALUES (@department_id, @email, @first_name, @last_name, @username)"
        Dim ddDepartments As DropDownList = CType(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddDepartments"), DropDownList)
        Dim txtFirstName As TextBox = CType(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtFirstName"), TextBox)
        Dim txtLastName As TextBox = CType(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtLastName"), TextBox)

        sqlUser.InsertParameters.Add("department_id", ddDepartments.SelectedValue)
        sqlUser.InsertParameters.Add("email", CreateUserWizard1.Email)
        sqlUser.InsertParameters.Add("first_name", txtFirstName.Text)
        sqlUser.InsertParameters.Add("last_name", txtLastName.Text)
        sqlUser.InsertParameters.Add("username", CreateUserWizard1.UserName)
        sqlUser.Insert()
        ListView1.DataBind()
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click, lnkEmployeeList.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click, lnkCreateEmployee.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub ContinueButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        CreateUserWizard1.ActiveStepIndex = 0
        Context.Response.Redirect(Context.Request.Url.AbsoluteUri)
        Context.Response.End()
    End Sub
    Protected Sub deleteUser(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim b As Button = CType(sender, Button)
        Membership.DeleteUser(b.Attributes("userName"), True)
    End Sub
End Class
