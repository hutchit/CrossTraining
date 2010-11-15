
Partial Class users_Train
    Inherits System.Web.UI.Page

    Dim m_trainer As trainer

    Protected Sub completeTraining(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim buttonSender As Button = CType(sender, Button)
        Dim hours As Double
        Dim trainingDate As String
        trainingDate = ""
        hours = 0
        For Each i As ListViewItem In ListViewTrain.Items
            Dim tb As DropDownList = CType(i.FindControl("hoursdropdown"), DropDownList)
            If tb.Attributes("trainingID") = buttonSender.Attributes("trainingID") Then
                hours = tb.SelectedItem.Text
            End If
            Dim datetextbox As TextBox = CType(i.FindControl("datetextbox"), TextBox)
            If datetextbox.Attributes("trainingID") = buttonSender.Attributes("trainingID") Then
                trainingDate = datetextbox.Text
            End If
        Next
        m_trainer.completeTraining(buttonSender.Attributes("trainingID"), m_trainer.getInitialExperience(buttonSender.Attributes("trainingID")), _
                                    hours, trainingDate)
        ListViewTrain.DataBind()

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
        Dim hoursDropDown As DropDownList = CType(e.Item.FindControl("hoursDropDown"), DropDownList)
        Dim datetextbox As TextBox = CType(e.Item.FindControl("datetextbox"), TextBox)
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

        Dim dec As Decimal
        dec = 0
        hoursDropDown.Items.Add("")
        While dec < 40
            dec += 0.5
            hoursDropDown.Items.Add(dec.ToString("##0.00"))
        End While

    End Sub
End Class
