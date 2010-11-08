Imports Microsoft.VisualBasic

Public Class Employee

    Dim sqlconnection As SqlDataSource
    Dim grid As GridView
    Private m_username As String
    Private m_userID As Integer
    Private m_first_name As String
    Private m_last_name As String
    Private m_department_name As String
    Private m_departmentID As Integer
    Private m_email As String


    Public Sub New(ByVal uname As String)
        sqlconnection = New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM employees WHERE username = @username")
        sqlconnection.SelectParameters.Add("username", uname)
        sqlconnection.UpdateCommand = "UPDATE employees SET department_id = @department_id, email = @email, first_name = @first_name, last_name = @last_name, username = @username WHERE (id = @id)"
        sqlconnection.UpdateParameters.Add("department_id", "")
        sqlconnection.UpdateParameters.Add("email", "")
        sqlconnection.UpdateParameters.Add("first_name", "")
        sqlconnection.UpdateParameters.Add("last_name", "")
        sqlconnection.UpdateParameters.Add("username", "")
        sqlconnection.UpdateParameters.Add("id", "")
        grid = New GridView
        grid.DataSource = sqlconnection
        updateAllProperties()
    End Sub

    Public ReadOnly Property userid() As Integer
        Get
            Return m_userID
        End Get
    End Property

    Public Property username() As String
        Get
            Return m_username
        End Get
        Set(ByVal value As String)
            m_username = value
        End Set
    End Property

    Public ReadOnly Property departmentName() As String
        Get
            Return m_department_name
        End Get
    End Property

    Public Property departmentID() As Integer
        Get
            Return m_departmentID
        End Get
        Set(ByVal value As Integer)
            m_departmentID = value
        End Set
    End Property

    Public Property email() As String
        Get
            Return m_email
        End Get
        Set(ByVal value As String)
            m_email = value
        End Set
    End Property

    Public Property first_name() As String
        Get
            Return m_first_name
        End Get
        Set(ByVal value As String)
            m_first_name = value
        End Set
    End Property

    Public Property last_name() As String
        Get
            Return m_last_name
        End Get
        Set(ByVal value As String)
            m_last_name = value
        End Set
    End Property

    Private Function getDepartment(ByVal id As Integer) As String
        Dim sqlDepartments As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM departments WHERE id = @id")
        sqlDepartments.SelectParameters.Add("id", id)
        Dim grid As New GridView
        grid.DataSource = sqlDepartments
        sqlDepartments.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        Return grid.Rows(0).Cells(1).Text
    End Function

    Public Function getJobName(ByVal id As Integer) As String
        Dim sqlJobs As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM jobs WHERE id = @id")
        sqlJobs.SelectParameters.Add("id", id)
        Dim grid As New GridView
        grid.DataSource = sqlJobs
        sqlJobs.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        Return grid.Rows(0).Cells(1).Text
    End Function

    Private Sub updateAllProperties()
        sqlconnection.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        m_username = grid.Rows(0).Cells(5).Text.Trim
        m_userID = grid.Rows(0).Cells(0).Text.Trim
        m_departmentID = grid.Rows(0).Cells(1).Text.Trim
        m_department_name = getDepartment(departmentID).Trim
        m_first_name = grid.Rows(0).Cells(3).Text.Trim
        m_last_name = grid.Rows(0).Cells(4).Text.Trim
        m_email = grid.Rows(0).Cells(2).Text.Trim
    End Sub

    Private Sub updateDB()
        sqlconnection.UpdateParameters("id").DefaultValue = userid
        sqlconnection.UpdateParameters("department_id").DefaultValue = departmentID
        sqlconnection.UpdateParameters("first_name").DefaultValue = first_name
        sqlconnection.UpdateParameters("last_name").DefaultValue = last_name
        sqlconnection.UpdateParameters("email").DefaultValue = email
        sqlconnection.UpdateParameters("username").DefaultValue = username
        sqlconnection.Update()
    End Sub

    Public Function trainingAvailable(ByVal jobId As Integer) As Boolean
        Dim sqltraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM training WHERE trainee_id = @trainee_id and job_id = @job_id")
        Dim grid As New GridView
        sqltraining.SelectParameters.Add("trainee_id", userid)
        sqltraining.SelectParameters.Add("job_id", jobId)
        grid.DataSource = sqltraining
        sqltraining.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        If grid.Rows.Count = 0 Or grid.Rows.Count = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function requestTraining(ByVal job_id As Integer, ByVal initial_experience As Integer, ByVal status As Integer) As String
        Dim sqlTraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        Dim level As Integer = trainingLevel(job_id)
        Dim message As String = ""
        Select Case level
            Case 0
                initial_experience = 0
                message = "Training Requested"
            Case 1
                initial_experience = 1
                message = "Training Requested"
            Case 2
                message = "No Training Available"
                initial_experience = 2
            Case 3
                message = "Pending Training Request"
                initial_experience = 3
            Case 4
                message = "Pending Training Request"
                initial_experience = 4
            Case 5
                message = "Error"
                initial_experience = 5
        End Select

        If initial_experience = 0 Or initial_experience = 1 Then
            sqlTraining.InsertCommand = "INSERT INTO training(trainee_id, department_id, job_id, initial_experience, status) VALUES (@trainee_id, @department_id, @job_id, @initial_experience, @status)"
            sqlTraining.InsertParameters.Add("trainee_id", userid)
            sqlTraining.InsertParameters.Add("department_id", departmentID)
            sqlTraining.InsertParameters.Add("job_id", job_id)
            sqlTraining.InsertParameters.Add("initial_experience", initial_experience)
            sqlTraining.InsertParameters.Add("status", status)

            sqlTraining.Insert()
        End If

        Return message
    End Function


    Public Function trainingLevel(ByVal jobid As Integer) As Integer
        Dim sqltraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM training WHERE trainee_id = @trainee_id and job_id = @job_id")
        Dim grid As New GridView
        sqltraining.SelectParameters.Add("trainee_id", userid)
        sqltraining.SelectParameters.Add("job_id", jobid)
        grid.DataSource = sqltraining
        sqltraining.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()

        If grid.Rows.Count = 0 Then
            Return 0 'Has not been requested yet
        ElseIf grid.Rows.Count = 1 And grid.Rows(0).Cells(7).Text = "&nbsp;" Then
            Return 3 'Pending request for training
        ElseIf grid.Rows.Count = 1 And grid.Rows(0).Cells(7).Text = "1" Then
            Return 1 'Is trained for this job
        ElseIf (grid.Rows.Count = 2 And grid.Rows(0).Cells(7).Text = "2") Or (grid.Rows.Count = 2 And grid.Rows(1).Cells(7).Text = "2") Then
            Return 2 'Can train people on this job
        ElseIf (grid.Rows.Count = 2 And grid.Rows(0).Cells(7).Text = "&nbsp;" And grid.Rows(0).Cells(6).Text = "1") Or (grid.Rows.Count = 2 And grid.Rows(1).Cells(7).Text = "&nbsp;" And grid.Rows(1).Cells(6).Text = "1") Then
            Return 4 'Pending request to become a trainer
        Else
            Return 5 'Unknown case
        End If
    End Function
End Class
