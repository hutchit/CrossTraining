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

        Label1.Text = id


    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim user_id As Integer = DropDownList5.SelectedValue
        Dim did As Integer = DropDownList8.SelectedValue
        Dim jobID As Integer = DropDownList6.SelectedValue
        Dim iniEx As Integer = 1
        Dim status As Integer = 2
        Dim suprID As Integer = Label1.Text
        Dim trainer As Integer = DropDownList7.SelectedValue


        Dim sqlTraining3 As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        sqlTraining3.InsertCommand = "INSERT INTO training(trainer_id,trainee_id, department_id, job_id, initial_experience, status,supervisor_id) VALUES (@trainer_id, @trainee_id, @department_id, @job_id, @initial_experience, @status, @supervisor_id)"
        sqlTraining3.InsertParameters.Add("trainer_id", trainer)
        sqlTraining3.InsertParameters.Add("trainee_id", user_id)
        sqlTraining3.InsertParameters.Add("department_id", did)
        sqlTraining3.InsertParameters.Add("job_id", jobID)
        sqlTraining3.InsertParameters.Add("initial_experience", iniEx)
        sqlTraining3.InsertParameters.Add("status", status)
        sqlTraining3.InsertParameters.Add("supervisor_id", suprID)
        sqlTraining3.Insert()
        ListView2.DataBind()

    End Sub
End Class