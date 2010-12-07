Imports Microsoft.VisualBasic

Public Class Employee

    Dim sqlconnection As SqlDataSource
    Dim grid As GridView
    Dim message As String = ""
    Private m_username As String
    Private m_userID As Integer
    Private m_first_name As String
    Private m_last_name As String
    Private m_department_name As String
    Private m_departmentID As Integer
    Private m_email As String

    Public Sub New()
        m_email = ""
        m_departmentID = 0
        m_department_name = ""
        m_last_name = ""
        m_first_name = ""
        m_userID = 0
        m_username = ""
        grid = New GridView
        sqlconnection = New SqlDataSource
    End Sub

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

    Public Sub New(ByVal uid As Integer)
        sqlconnection = New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM employees WHERE id = @id")
        sqlconnection.SelectParameters.Add("id", uid)
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
        If grid.Rows.Count > 0 Then
            Return grid.Rows(0).Cells(1).Text
        Else
            Return ""
        End If
    End Function

    Public Function getJobName(ByVal id As Integer) As String
        Dim sqlJobs As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM jobs WHERE id = @id")
        sqlJobs.SelectParameters.Add("id", id)
        Dim grid As New GridView
        grid.DataSource = sqlJobs
        sqlJobs.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        If grid.Rows.Count > 0 Then
            Return grid.Rows(0).Cells(1).Text
        Else
            Return ""
        End If
    End Function

    Public Function getDepartmentName(ByVal id As Integer) As String
        Dim sqlDepartments As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM departments WHERE id = @id")
        sqlDepartments.SelectParameters.Add("id", id)
        Dim grid As New GridView
        grid.DataSource = sqlDepartments
        sqlDepartments.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        If grid.Rows.Count > 0 Then
            Return grid.Rows(0).Cells(1).Text
        Else
            Return ""
        End If
    End Function

    Private Sub updateAllProperties()
        sqlconnection.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        If grid.Rows.Count <> 0 Then
            m_username = grid.Rows(0).Cells(5).Text.Trim
            m_userID = grid.Rows(0).Cells(0).Text.Trim
            m_departmentID = grid.Rows(0).Cells(1).Text.Trim
            m_department_name = getDepartment(departmentID).Trim
            m_first_name = grid.Rows(0).Cells(3).Text.Trim
            m_last_name = grid.Rows(0).Cells(4).Text.Trim
            m_email = grid.Rows(0).Cells(2).Text.Trim
        End If

    End Sub

    Private Sub updateDB()
        If userid <> 0 Then
            sqlconnection.UpdateParameters("id").DefaultValue = userid
            sqlconnection.UpdateParameters("department_id").DefaultValue = departmentID
            sqlconnection.UpdateParameters("first_name").DefaultValue = first_name
            sqlconnection.UpdateParameters("last_name").DefaultValue = last_name
            sqlconnection.UpdateParameters("email").DefaultValue = email
            sqlconnection.UpdateParameters("username").DefaultValue = username
            sqlconnection.Update()
        End If
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

    Public Function requestTraining(ByVal job_id As Integer, ByVal initial_experience As Integer, ByVal status As Integer, ByVal did As Integer) As String
        Dim sqlTraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        Dim level As Integer = trainingLevel(job_id)
        'Dim message As String = ""
        'Select Case level
        '    Case 0
        '        initial_experience = 0
        '        message = "Training Requested"
        '    Case 1
        '        initial_experience = 1
        '        message = "Training Requested"
        '    Case 2
        '        message = "No Training Available"
        '        initial_experience = 2
        '    Case 3
        '        message = "Pending Training Request"
        '        initial_experience = 3
        '    Case 4
        '        message = "Pending Training Request"
        '        initial_experience = 4
        '    Case 5
        '        message = "Error"
        '        initial_experience = 5
        'End Select
        initial_experience = setExperience(level)

        If initial_experience = 0 Or initial_experience = 1 Then
            sqlTraining.InsertCommand = "INSERT INTO training(trainee_id, department_id, job_id, initial_experience, status) VALUES (@trainee_id, @department_id, @job_id, @initial_experience, @status)"
            sqlTraining.InsertParameters.Add("trainee_id", userid)
            sqlTraining.InsertParameters.Add("department_id", did)
            sqlTraining.InsertParameters.Add("job_id", job_id)
            sqlTraining.InsertParameters.Add("initial_experience", initial_experience)
            sqlTraining.InsertParameters.Add("status", status)

            sqlTraining.Insert()
        End If

        Return message
    End Function
    Public Function setExperience(ByVal level1 As Integer) As Integer
        Dim init_experience As Integer

        Select Case level1
            Case 0
                init_experience = 0
                message = "Training Requested"
                Return init_experience
            Case 1
                init_experience = 1
                message = "Training Requested"
                Return init_experience
            Case 2
                message = "No Training Available"
                init_experience = 2
                Return init_experience
            Case 3
                message = "Pending Training Request"
                init_experience = 3
                Return init_experience
            Case 4
                message = "Pending Training Request"
                init_experience = 4
                Return init_experience
            Case 5
                message = "Error"
                init_experience = 5
                Return init_experience
        End Select

    End Function


    Public Function trainingLevel(ByVal jobid As Integer) As Integer
        Dim sqltraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM training WHERE trainee_id = @trainee_id and job_id = @job_id")
        Dim grid As New GridView
        sqltraining.SelectParameters.Add("trainee_id", userid)
        sqltraining.SelectParameters.Add("job_id", jobid)
        grid.DataSource = sqltraining
        sqltraining.Select(DataSourceSelectArguments.Empty)
        grid.DataBind()
        Dim trained As Integer = 0
        Dim pending As Integer = 0
        For Each row As GridViewRow In grid.Rows
            If row.Cells(7).Text = "2" Then
                Return 2
            ElseIf row.Cells(7).Text = "1" Then
                trained = 1
            ElseIf row.Cells(6).Text = "0" And (row.Cells(8).Text = "1" Or row.Cells(8).Text = "2") Then
                pending = 1
            ElseIf row.Cells(6).Text = "1" And (row.Cells(8).Text = "1" Or row.Cells(8).Text = "2") Then
                pending = 1
            End If
        Next
        If trained = 0 And pending = 0 Then
            Return 0
        ElseIf trained = 1 And pending = 0 Then
            Return 1
        ElseIf pending = 1 And trained = 0 Then
            Return 3
        ElseIf pending = 1 And trained = 1 Then
            Return 1
        Else
            Return 5
        End If
        'If grid.Rows.Count = 0 Then
        '    Return 0 'Has not been requested yet
        'ElseIf grid.Rows.Count = 1 And grid.Rows(0).Cells(7).Text = "&nbsp;" Then
        '    Return 3 'Pending request for training
        'ElseIf grid.Rows.Count = 1 And grid.Rows(0).Cells(7).Text = "1" Then
        '    Return 1 'Is trained for this job
        'ElseIf (grid.Rows.Count = 2 And grid.Rows(0).Cells(7).Text = "2") Or (grid.Rows.Count = 2 And grid.Rows(1).Cells(7).Text = "2") Then
        '    Return 2 'Can train people on this job
        'ElseIf (grid.Rows.Count = 2 And grid.Rows(0).Cells(7).Text = "&nbsp;" And grid.Rows(0).Cells(6).Text = "1") Or (grid.Rows.Count = 2 And grid.Rows(1).Cells(7).Text = "&nbsp;" And grid.Rows(1).Cells(6).Text = "1") Then
        '    Return 4 'Pending request to become a trainer
        'Else
        '    Return 5 'Unknown case
        'End If
    End Function

    Public Function getStatus(ByVal status As Integer) As String
        Select Case status
            Case 0
                Return "Rejected"
            Case 1
                Return "Requested"
            Case 2
                Return "Approved"
            Case 3
                Return "Completed"
        End Select
        Return "Error"
    End Function

    Public Function isSupervisor() As Boolean
        Dim sqlSupervisor As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM Supervisee_Supervisor WHERE Supervisor_id = @id")
        Dim gridSupervisor As New GridView
        sqlSupervisor.SelectParameters.Add("id", userid)
        gridSupervisor.DataSource = sqlSupervisor
        sqlSupervisor.Select(DataSourceSelectArguments.Empty)
        gridSupervisor.DataBind()
        If gridSupervisor.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    

End Class
