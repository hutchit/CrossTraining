Imports System.Data
Partial Class users_MyTraining
    Inherits System.Web.UI.Page

    Dim m_user As Employee

    Protected Sub lnkStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkStatus.Click, LinkButton1.Click, LinkButton4.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub lnkHistory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkHistory.Click, LinkButton2.Click, LinkButton5.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub lnkRequest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkRequest.Click, LinkButton3.Click, LinkButton6.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub requestTraining(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim button1 As Button = CType(sender, Button)
        message.Text = m_user.requestTraining(button1.Attributes("jobID").ToString, 0, 1, DropDownList1.SelectedValue) + " for " & m_user.getJobName(button1.Attributes("jobID").ToString)
        ListView1.DataBind()
        If department.SelectedValue <> "" Then
            fillJobsDropdown(m_user.userid, department.SelectedValue)
        End If
        If message.Text.Contains("Requested") Then
            message.ForeColor = Drawing.Color.Green
        Else
            message.ForeColor = Drawing.Color.Red
        End If
        lblTrainingRequested.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlEmployee As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM employees WHERE username = @username")
        Dim _user As MembershipUser = Membership.GetUser(Page.User.Identity.Name)
        m_user = New Employee(_user.UserName)


        name.Text = m_user.first_name + " " + m_user.last_name
        SqlTraining.SelectParameters("trainee_id").DefaultValue = m_user.userid
        lblHistoryTitle.Text = "Training History for " + m_user.first_name + " " + m_user.last_name
        lblWelcome.Text = "Welcome, " & m_user.first_name & " " & m_user.last_name
        Dim weather As Animaonline.Weather.WeatherData.GoogleWeatherData = Animaonline.Weather.GoogleWeatherAPI.GetWeather(Animaonline.Globals.LanguageCode.en_US, "Wichita")

        lblTemp.Text = weather.CurrentConditions.Temperature.Fahrenheit & "&deg; F"

        imgWeather.ImageUrl = "~/images/weather/" & weather.CurrentConditions.Condition & ".png"
    End Sub


    Private Sub fillJobsDropdown(ByVal employeeID As Integer, ByVal department_id As Integer)
        jobs.Items.Clear()
        Dim sqlJobs As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM jobs WHERE department_id = @department_id")
        sqlJobs.SelectParameters.Add("department_id", department_id)
        Dim grid As New GridView
        grid.DataSource = sqlJobs
        sqlJobs.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        For Each row As GridViewRow In grid.Rows
            Dim level As Integer = m_user.trainingLevel(row.Cells(0).Text)
            Select Case level
                Case 0
                    Dim i As New ListItem
                    i.Text = row.Cells(1).Text.ToString.Trim
                    i.Value = row.Cells(0).Text.ToString.Trim
                    jobs.Items.Add(i)
                Case 1
                    Dim i As New ListItem
                    i.Text = row.Cells(1).Text.ToString.Trim
                    i.Value = row.Cells(0).Text.ToString.Trim
                    jobs.Items.Add(i)
                Case 2
                Case 3
                Case 4
                Case 5
            End Select
        Next
    End Sub


    Protected Sub submitRequest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submitRequest.Click
        If jobs.Items.Count > 0 Then
            lblTrainingRequested.Text = m_user.requestTraining(jobs.Text, 0, 1, department.SelectedValue) + " for " + jobs.SelectedItem.Text
            fillJobsDropdown(m_user.userid, department.SelectedValue)
        Else
            lblTrainingRequested.Text = "No Jobs available"
        End If
        If lblTrainingRequested.Text.Contains("Requested") Then
            lblTrainingRequested.ForeColor = Drawing.Color.Green
        Else
            lblTrainingRequested.ForeColor = Drawing.Color.Red
        End If
        message.Text = ""
        ListView1.DataBind()
    End Sub

    Protected Sub jobs_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles jobs.SelectedIndexChanged
        lblTrainingRequested.Text = ""
    End Sub

    Protected Sub ListView1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles ListView1.ItemDataBound
        If e.Item.ItemType = ListViewItemType.DataItem Then
            Dim l As Label = CType(e.Item.FindControl("statusLabel"), Label)
            Dim requestButton = CType(e.Item.FindControl("requestButton"), Button)
            Dim level As Integer = m_user.trainingLevel(l.Attributes("jobID").ToString.Trim)
            Select Case level
                Case 0
                    l.Text = "None"
                Case 1
                    l.Text = "Trained"
                    requestButton.Text = "Become a Trainer"
                Case 2
                    l.Text = "Can Train"
                    requestButton.Enabled = False
                    requestButton.Text = "Already  a Trainer"
                Case 3
                    l.Text = "None"
                    requestButton.Enabled = False
                    requestButton.Text = "Pending Training Request"
                Case 4
                    l.Text = "Trained"
                    requestButton.Enabled = False
                    requestButton.Text = "Pending Training Request"
                Case 5
                    l.Text = "Error"
                    requestButton.Enabled = False
                    requestButton.Text = "Error"
            End Select
        End If
    End Sub

    Protected Sub department_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles department.DataBound
        department.SelectedValue = m_user.departmentID
        If Not Page.IsPostBack Then
            fillJobsDropdown(m_user.userid, department.SelectedValue)
        End If
    End Sub

    Protected Sub department_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles department.SelectedIndexChanged
        fillJobsDropdown(m_user.userid, department.SelectedValue)
    End Sub

    Protected Sub trainingHistoryListview_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles trainingHistoryListview.ItemDataBound
        Dim department_idLabel As Label = CType(e.Item.FindControl("department_idLabel"), Label)
        Dim supervisor_idLabel As Label = CType(e.Item.FindControl("supervisor_idLabel"), Label)
        Dim trainer_idLabel As Label = CType(e.Item.FindControl("trainer_idLabel"), Label)
        Dim job_idLabel As Label = CType(e.Item.FindControl("job_idLabel"), Label)
        Dim initial_experienceLabel As Label = CType(e.Item.FindControl("initial_experienceLabel"), Label)
        Dim final_experienceLabel As Label = CType(e.Item.FindControl("final_experienceLabel"), Label)
        Dim statusLabel As Label = CType(e.Item.FindControl("statusLabel"), Label)
        Dim trainer As New Employee()
        If trainer_idLabel.Text <> "" Then
            trainer = New Employee(CType(trainer_idLabel.Text, Integer))
        End If
        Dim supervisor As New Employee()
        If supervisor_idLabel.Text <> "" Then
            supervisor = New Employee(CType(supervisor_idLabel.Text, Integer))
        End If
        job_idLabel.Text = trainer.getJobName(job_idLabel.Text)
        statusLabel.Text = trainer.getStatus(statusLabel.Text)
        trainer_idLabel.Text = trainer.first_name & " " & trainer.last_name
        supervisor_idLabel.Text = supervisor.first_name & " " & supervisor.last_name
        department_idLabel.Text = supervisor.getDepartmentName(department_idLabel.Text)
    End Sub
End Class
