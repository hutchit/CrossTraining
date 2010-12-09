Imports System.Data
Imports System.Web.Services.Description
Imports System.Data.SqlClient

Partial Class users_Manage
    Inherits System.Web.UI.Page
    Dim m_user As Employee
    Protected Sub lnkAssign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAssign.Click, LinkButton9.Click, LinkButton5.Click, LinkButton1.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub lnkApprove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkApprove.Click, LinkButton10.Click, LinkButton6.Click, LinkButton2.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub lnkCharts_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCharts.Click, LinkButton11.Click, LinkButton7.Click, LinkButton3.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub lnkReports_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkReports.Click, LinkButton12.Click, LinkButton8.Click, LinkButton4.Click
        MultiView1.ActiveViewIndex = 3
    End Sub

    'Protected Sub acceptTraining(ByVal sender As Object, ByVal e As System.EventArgs)

    '    Dim button1 As Button = CType(sender, Button)
    '    Dim status1 As Integer = 2

    '    Dim user_status As String = m_user.getStatus(status1)



    'End Sub



    'Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad
    '    Dim sqlsuper As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM employees WHERE username = @username")
    '    Dim u_name As String = User.Identity.Name
    '    sqlsuper.SelectParameters.Add("username", u_name)
    '    sqlsuper.SelectCommand = "SELECT supervisee_supervisor.supervisor_id FROM supervisee_supervisor INNER JOIN employees ON supervisee_supervisor.supervisor_id = employees.id WHERE employees.username=@username"
    '    Label1.Text = sqlsuper.SelectCommand("supervisee_supervisor.supervisor_id").ToString

    'End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Dim sqlassign As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
    '    Dim _id As Integer = DropDownList3.SelectedValue
    '    Dim trainer1 As Integer = DropDownList1.SelectedValue
    '    sqlassign.UpdateCommand = "UPDATE training SET status = @status, trainer_id=@trainer_id"
    '    sqlassign.SelectCommand = "SELECT id from training WHERE id=@id"
    '    sqlassign.SelectParameters.Add("id", _id)
    '    sqlassign.SelectCommand = "SELECT id from training WHERE id=@id"
    '    sqlassign.UpdateParameters.Add("status", "")
    '    sqlassign.UpdateParameters.Add("trainer_id", "")


    '    sqlassign.SelectParameters("id").DefaultValue = _id

    '    sqlassign.UpdateParameters("status").DefaultValue = 1

    '    sqlassign.UpdateParameters("trainer_id").DefaultValue = trainer1
    '    ' sqlassign.UpdateParameters.Add("status", 2)
    '    ' sqlassign.UpdateParameters.Add("trainer_id", DropDownList1.SelectedValue)
    '    sqlassign.Update()


    'End Sub

    Protected Sub acceptTraining(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim button1 As Button = CType(sender, Button)
        Dim trainer1 As Integer = DropDownList1.SelectedValue
        Dim train_id As Integer = Convert.ToInt32(button1.Attributes("training_ID").ToString)
        Dim supervisor1 As Integer = Label1.Text
        Dim sqlTraining1 As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")

        sqlTraining1.UpdateCommand = "UPDATE training SET status = @status, trainer_id=@trainer_id, supervisor_id=@supervisor_id WHERE training.id = @id"
        sqlTraining1.UpdateParameters.Add("id", train_id)
        sqlTraining1.UpdateParameters.Add("status", 2)
        sqlTraining1.UpdateParameters.Add("trainer_id", trainer1)
        sqlTraining1.UpdateParameters.Add("supervisor_id", supervisor1)
        sqlTraining1.Update()
        ListView1.DataBind()
        ListView2.DataBind()
        fillJobsDropdown(DropDownList5.SelectedValue, DropDownList8.SelectedValue)
    End Sub


    Protected Sub denyTraining(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim button1 As Button = CType(sender, Button)
        Dim trainer1 As Integer = DropDownList1.SelectedValue
        Dim train_id As Integer = Convert.ToInt32(button1.Attributes("training_ID").ToString)

        Dim sqlTraining1 As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")

        sqlTraining1.UpdateCommand = "UPDATE training SET status = @status WHERE training.id = @id"
        sqlTraining1.UpdateParameters.Add("id", train_id)
        sqlTraining1.UpdateParameters.Add("status", 0)
        sqlTraining1.Update()
        ListView1.DataBind()
        ListView2.DataBind()
    End Sub




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim user1 As String

        user1 = User.Identity.Name

        Dim sqlTraining2 As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        Dim grid As New GridView
        Dim id As Integer
        sqlTraining2.SelectCommand = "SELECT supervisee_supervisor.supervisor_id FROM employees INNER JOIN supervisee_supervisor ON employees.id = supervisee_supervisor.supervisor_id WHERE (employees.username = @username)"
        sqlTraining2.SelectParameters.Add("username", user1)
        sqlTraining2.SelectCommand = "SELECT supervisee_supervisor.supervisor_id FROM employees INNER JOIN supervisee_supervisor ON employees.id = supervisee_supervisor.supervisor_id WHERE (employees.username = @username)"

        grid.DataSource = sqlTraining2
        sqlTraining2.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        If grid.Rows.Count <> 0 Then
            id = grid.Rows(0).Cells(0).Text.Trim
          
        End If
        Dim _user As MembershipUser = Membership.GetUser(Page.User.Identity.Name)
        m_user = New Employee(_user.UserName)
        Label1.Text = id
        lblWelcome.Text = "Welcome, " & m_user.first_name & " " & m_user.last_name
        Dim weather As Animaonline.Weather.WeatherData.GoogleWeatherData = Animaonline.Weather.GoogleWeatherAPI.GetWeather(Animaonline.Globals.LanguageCode.en_US, "Wichita")

        lblTemp.Text = weather.CurrentConditions.Temperature.Fahrenheit & "&deg; F"

        imgWeather.ImageUrl = "~/images/weather/" & weather.CurrentConditions.Condition & ".png"

        Label4.Visible = False


    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim user_id As Integer = DropDownList5.SelectedValue
        Dim did As Integer = DropDownList8.SelectedValue
        Dim jobID As Integer = DropDownList6.SelectedValue
        Dim iniEx As Integer = 1
        Dim status As Integer = 2
        Dim suprID As Integer = Label1.Text

        Dim sqlTraining3 As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        sqlTraining3.InsertParameters.Add("trainee_id", user_id)
        sqlTraining3.InsertParameters.Add("department_id", did)
        sqlTraining3.InsertParameters.Add("job_id", jobID)
        sqlTraining3.InsertParameters.Add("supervisor_id", suprID)

        If chkTrainer.Checked = True Then
            sqlTraining3.InsertCommand = "INSERT INTO training(trainer_id,trainee_id, department_id, job_id, initial_experience, final_experience, status,supervisor_id,date, hours) VALUES (@trainer_id, @trainee_id, @department_id, @job_id, @initial_experience, @final_experience, @status, @supervisor_id, @training_date, @hours)"
            sqlTraining3.InsertParameters.Add("status", 3)
            sqlTraining3.InsertParameters.Add("initial_experience", 0)
            sqlTraining3.InsertParameters.Add("final_experience", 2)
            sqlTraining3.InsertParameters.Add("trainer_id", suprID)
            sqlTraining3.InsertParameters.Add("training_date", DateTime.Now.Date.ToString("MM/dd/yyyy"))
            sqlTraining3.InsertParameters.Add("hours", 0)
        Else
            Dim trainer As Integer = DropDownList7.SelectedValue
            Dim exp As Integer = New Employee(user_id).trainingLevel(jobID)
            sqlTraining3.InsertCommand = "INSERT INTO training(trainer_id,trainee_id, department_id, job_id, initial_experience, status,supervisor_id) VALUES (@trainer_id, @trainee_id, @department_id, @job_id, @initial_experience, @status, @supervisor_id)"
            sqlTraining3.InsertParameters.Add("status", 2)
            'If exp = 3 Then
            '    sqlTraining3.InsertParameters.Add("initial_experience", 0)
            '    sqlTraining3.InsertParameters.Add("status", 0)
            'ElseIf exp = 1 Then
            sqlTraining3.InsertParameters.Add("initial_experience", exp)

            sqlTraining3.InsertParameters.Add("trainer_id", trainer)
        End If

        sqlTraining3.Insert()
        ListView2.DataBind()

        Label4.Visible = True
        DropDownList7.DataBind()
        If chkTrainer.Checked Then
            chkTrainer.Checked = False
        End If
        fillJobsDropdown(DropDownList5.SelectedValue, DropDownList8.SelectedValue)
    End Sub

    Private Sub fillJobsDropdown(ByVal employeeID As Integer, ByVal department_id As Integer)
        DropDownList6.Items.Clear()
        Dim sqlJobs As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM jobs WHERE department_id = @department_id")
        sqlJobs.SelectParameters.Add("department_id", department_id)
        Dim grid As New GridView
        grid.DataSource = sqlJobs
        sqlJobs.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        For Each row As GridViewRow In grid.Rows
            Dim level As Integer = New Employee(DropDownList5.SelectedValue).trainingLevel(row.Cells(0).Text)
            Select Case level
                Case 0
                    Dim i As New ListItem
                    i.Text = row.Cells(1).Text.ToString.Trim
                    i.Value = row.Cells(0).Text.ToString.Trim
                    DropDownList6.Items.Add(i)
                Case 1
                    Dim i As New ListItem
                    i.Text = row.Cells(1).Text.ToString.Trim
                    i.Value = row.Cells(0).Text.ToString.Trim
                    DropDownList6.Items.Add(i)
                Case 2
                Case 3
                Case 4
                Case 5
            End Select
        Next
    End Sub

    Protected Sub DropDownList8_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList8.DataBound
        Dim sv As Integer
        If DropDownList5.SelectedValue <> "" Then
            sv = New Employee(CType(DropDownList5.SelectedValue, Integer)).departmentID
            DropDownList8.SelectedValue = sv
            fillJobsDropdown(DropDownList5.SelectedValue, DropDownList8.SelectedValue)
        End If
    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.SelectedIndexChanged
        DropDownList8.DataBind()
    End Sub

    Protected Sub DropDownList6_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList6.DataBound
        DropDownList7.DataBind()
    End Sub

    Protected Sub DropDownList6_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList6.SelectedIndexChanged
        DropDownList7.DataBind()
    End Sub
    Private Function buildReport() As HtmlTable
        Dim table As New HtmlTable
        Dim sqlDepartments As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * from Departments")
        Dim dgDepartments As New DataGrid
        sqlDepartments.Select(System.Web.UI.DataSourceSelectArguments.Empty)
        dgDepartments.DataSource = sqlDepartments
        dgDepartments.DataBind()
        table = reportHeader()
        table.Attributes.Add("class", "reportTable")
        For Each row As DataGridItem In dgDepartments.Items
            Dim rowhtml As New HtmlTableRow
            Dim rowJobs As New HtmlTableRow
            Dim cellJobs As New HtmlTableCell
            Dim notTrained As New HtmlTableCell
            Dim trained As New HtmlTableCell
            Dim trainer As New HtmlTableCell
            notTrained.Attributes.Add("class", "reportData")
            trained.Attributes.Add("class", "reportData")
            trainer.Attributes.Add("class", "reportData")
            cellJobs.Attributes.Add("class", "reportData")
            cellJobs.Style.Add("text-align", "left")
            notTrained.InnerText = 0
            trained.InnerText = 0
            trainer.InnerText = 0
            cellJobs.ColSpan = 4
            Dim jobsTable As HtmlTable = buildJobsTable(row.Cells(0).Text)
            For Each r As HtmlTableRow In jobsTable.Rows
                notTrained.InnerText = CType(notTrained.InnerText, Integer) + CType(r.Cells(1).InnerText, Integer)
                trained.InnerText = CType(trained.InnerText, Integer) + CType(r.Cells(2).InnerText, Integer)
                trainer.InnerText = CType(trainer.InnerText, Integer) + CType(r.Cells(3).InnerText, Integer)
            Next
            cellJobs.Controls.Add(jobsTable)
            Dim cellDepartment As New HtmlTableCell
            cellDepartment.Attributes.Add("class", "reportData")
            cellDepartment.Style.Add("text-align", "left")
            cellDepartment.Style.Add("width", "175px")
            'cellDepartment.Attributes.Add("onclick", "showhide(this)")
            rowJobs.Style.Add("display", "none")
            cellJobs.Style.Add("background-color", "black")
            cellDepartment.InnerHtml = "&nbsp;<img alt='plus' onclick='showhide(this)' src=""../images/plus.png"" onmouseover='mouseOver(this)' onmouseout='mouseOut(this)' width='10px' />&nbsp;" & row.Cells(1).Text
            'cellDepartment.InnerText = row.Cells(1).Text
            rowhtml.Cells.Add(cellDepartment)
            rowhtml.Cells.Add(notTrained)
            rowhtml.Cells.Add(trained)
            rowhtml.Cells.Add(trainer)
            rowJobs.Cells.Add(cellJobs)
            table.Rows.Add(rowhtml)
            table.Rows.Add(rowJobs)
        Next
        Return table
    End Function

    Private Function reportHeader() As HtmlTable
        Dim table As New HtmlTable
        Dim row As New HtmlTableRow
        Dim row2 As New HtmlTableRow
        Dim blankCell As New HtmlTableCell
        Dim trainingLevels As New HtmlTableCell
        trainingLevels.ColSpan = 3
        trainingLevels.Attributes.Add("class", "headerCell")
        trainingLevels.InnerText = "Training Levels"
        row2.Cells.Add(blankCell)
        row2.Cells.Add(trainingLevels)
        table.Rows.Add(row2)
        Dim departmentCell As New HtmlTableCell
        Dim notTrainedCell As New HtmlTableCell
        Dim trainedCell As New HtmlTableCell
        Dim trainerCell As New HtmlTableCell
        departmentCell.InnerText = "Department"
        notTrainedCell.InnerText = "None"
        trainedCell.InnerText = "Trained"
        trainerCell.InnerText = "Can Train"
        trainedCell.Attributes.Add("class", "headerCell")
        trainerCell.Attributes.Add("class", "headerCell")
        departmentCell.Attributes.Add("class", "headerCell")
        notTrainedCell.Attributes.Add("class", "headerCell")
        row.Cells.Add(departmentCell)
        row.Cells.Add(notTrainedCell)
        row.Cells.Add(trainedCell)
        row.Cells.Add(trainerCell)
        table.Rows.Add(row)
        Return table
    End Function

    Private Function buildJobsTable(ByVal department As Integer) As HtmlTable
        Dim table As New HtmlTable
        table.Style.Add("float", "right")
        Dim sqlJobs As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * from Jobs WHERE department_id = @department_id")
        Dim dgJobs As New DataGrid
        sqlJobs.SelectParameters.Add("department_id", department)
        sqlJobs.Select(System.Web.UI.DataSourceSelectArguments.Empty)
        dgJobs.DataSource = sqlJobs
        dgJobs.DataBind()
        table.Attributes.Add("class", "reportTable")
        For Each row As DataGridItem In dgJobs.Items
            Dim rowhtml As New HtmlTableRow
            Dim rowEmployees As New HtmlTableRow
            Dim cellEmployee As New HtmlTableCell
            cellEmployee.ColSpan = 4
            Dim cellJobs As New HtmlTableCell
            cellJobs.InnerText = row.Cells(1).Text
            cellJobs.Attributes.Add("class", "reportData")
            cellJobs.Style.Add("width", "150px")
            rowhtml.Cells.Add(cellJobs)
            Dim notTrainedCell As New HtmlTableCell
            Dim trainedCell As New HtmlTableCell
            Dim trainerCell As New HtmlTableCell
            getTotals(row.Cells(0).Text, notTrainedCell, trainedCell, trainerCell)
            rowhtml.Cells.Add(notTrainedCell)
            rowhtml.Cells.Add(trainedCell)
            rowhtml.Cells.Add(trainerCell)
            rowEmployees.Cells.Add(cellEmployee)
            table.Rows.Add(rowhtml)
            'table.Rows.Add(rowEmployees)
        Next
        Return table
    End Function

    Private Sub getTotals(ByVal job As Integer, ByRef notTrained As HtmlTableCell, ByRef trained As HtmlTableCell, ByRef trainer As HtmlTableCell)
        notTrained.Attributes.Add("class", "reportData")
        trained.Attributes.Add("class", "reportData")
        trainer.Attributes.Add("class", "reportData")
        notTrained.Style.Add("width", "100px")
        trained.Style.Add("width", "100px")
        trainer.Style.Add("width", "98px")
        Dim sqlEmployees As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * from Employees")
        Dim dgEmployees As New DataGrid
        sqlEmployees.Select(System.Web.UI.DataSourceSelectArguments.Empty)
        dgEmployees.DataSource = sqlEmployees
        dgEmployees.DataBind()
        Dim intNotTrained As Integer
        Dim intTrained As Integer
        Dim intTrainer As Integer
        For Each row As DataGridItem In dgEmployees.Items
            Dim employee As New Employee(CType(row.Cells(0).Text, Integer))
            Dim level As Integer = employee.trainingLevel(job)

            If level = 0 Then
                intNotTrained += 1
            ElseIf level = 1 Then
                intTrained += 1
            ElseIf level = 2 Then
                intTrainer += 1
            End If
        Next
        notTrained.InnerText = intNotTrained
        trained.InnerText = intTrained
        trainer.InnerText = intTrainer
    End Sub

    Protected Sub content_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles content.Load
        content.Controls.Add(buildReport)
    End Sub

    Protected Sub DropDownList9_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList9.SelectedIndexChanged
        If DropDownList9.SelectedValue = -1 Then
            SqlDataSourceTable.SelectCommand = "SELECT Trainee.username AS Trainee, Trainer.username AS Trainer, departments.name, jobs.name AS Job, training.date, training.hours FROM jobs INNER JOIN employees AS Trainee INNER JOIN training ON Trainee.id = training.trainee_id INNER JOIN employees AS Trainer ON training.trainer_id = Trainer.id INNER JOIN departments ON training.department_id = departments.id ON jobs.id = training.job_id WHERE (training.status = @status) AND (training.date >= @startdate) AND (training.date <= @enddate)"
        Else
            SqlDataSourceTable.SelectCommand = "SELECT Trainee.username AS Trainee, Trainer.username AS Trainer, departments.name, jobs.name AS Job, training.date, training.hours FROM jobs INNER JOIN employees AS Trainee INNER JOIN training ON Trainee.id = training.trainee_id INNER JOIN employees AS Trainer ON training.trainer_id = Trainer.id INNER JOIN departments ON training.department_id = departments.id ON jobs.id = training.job_id WHERE (training.department_id = @id) AND (training.status = @status) AND (training.date >= @startdate) AND (training.date <= @enddate)"
        End If

        ListView3.DataBind()

    End Sub

    Protected Sub DropDownList8_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList8.SelectedIndexChanged
        fillJobsDropdown(DropDownList5.SelectedValue, DropDownList8.SelectedValue)
    End Sub
End Class