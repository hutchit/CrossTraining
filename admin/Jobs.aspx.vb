
Partial Class users_MyTraining
    Inherits System.Web.UI.Page
    Public Sub setDepartmentID(ByVal sender As Object, ByVal e As EventArgs)
        Dim dd As DropDownList = CType(sender, DropDownList)
        SqlJobs.InsertParameters("department_id").DefaultValue = dd.SelectedValue
    End Sub

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertButton.Click
        SqlJobs.InsertParameters("department_id").DefaultValue = ddDepartments.SelectedValue
        SqlJobs.InsertParameters("name").DefaultValue = nameTextBox.Text
        SqlJobs.Insert()
        ddDepartments.SelectedIndex = -1
        nameTextBox.Text = ""
    End Sub
End Class
