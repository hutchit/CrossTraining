
Partial Class users_Train
    Inherits System.Web.UI.Page

    Dim m_trainer As trainer

    Protected Sub completeTraining(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub rejectTraining(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim _user As MembershipUser = Membership.GetUser(Page.User.Identity.Name)
        m_trainer = New trainer(_user.UserName)
        SqlTraining.SelectParameters("trainer_id").DefaultValue = m_trainer.userid
    End Sub

    Protected Sub ListViewTrain_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles ListViewTrain.ItemDataBound
        Dim department_idLabel As Label = CType(e.Item.FindControl("department_idLabel"), Label)
        Dim supervisor_idLabel As Label = CType(e.Item.FindControl("supervisor_idLabel"), Label)
        Dim trainee_idLabel As Label = CType(e.Item.FindControl("trainee_idLabel"), Label)
        Dim job_idLabel As Label = CType(e.Item.FindControl("job_idLabel"), Label)
        Dim initial_experienceLabel As Label = CType(e.Item.FindControl("initial_experienceLabel"), Label)
        Dim final_experienceLabel As Label = CType(e.Item.FindControl("final_experienceLabel"), Label)
        Dim statusLabel As Label = CType(e.Item.FindControl("statusLabel"), Label)
        Dim trainee As New Employee()
        If trainee_idLabel.Text <> "" Then
            trainee = New Employee(CType(trainee_idLabel.Text, Integer))
        End If
        Dim supervisor As New Employee()
        If supervisor_idLabel.Text <> "" Then
            supervisor = New Employee(CType(supervisor_idLabel.Text, Integer))
        End If
        job_idLabel.Text = trainee.getJobName(job_idLabel.Text)
        statusLabel.Text = trainee.getStatus(statusLabel.Text)
        trainee_idLabel.Text = trainee.first_name & " " & trainee.last_name
        supervisor_idLabel.Text = supervisor.first_name & " " & supervisor.last_name
        department_idLabel.Text = supervisor.getDepartmentName(department_idLabel.Text)
    End Sub
End Class
