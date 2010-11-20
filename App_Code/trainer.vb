Imports Microsoft.VisualBasic

Public Class trainer
    Inherits Employee

    Public Sub New(ByVal uname As String)
        MyBase.New(uname)
    End Sub

    Public Sub New(ByVal uid As Integer)
        MyBase.New(uid)
    End Sub

    Public Function completeTraining(ByVal training As Integer, ByVal initial_experience As Integer, ByVal hours As Decimal, ByVal trainingDate As String) As String
        Dim sqlTraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        Dim level As Integer = initial_experience
        Dim final_experience As Integer = 0
        Dim status As Integer = 0
        Dim message As String = ""
        Select Case level
            Case 0
                final_experience = 1
                status = 3
                message = "Training Completed"
            Case 1
                final_experience = 2
                status = 3
                message = "Training Completed"
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

        If final_experience = 1 Or final_experience = 2 And hours > 0 And trainingDate <> "" Then
            sqlTraining.UpdateCommand = "UPDATE training SET final_experience = @final_experience, status = @status, hours = @hours, date = @date WHERE id = @id "
            sqlTraining.UpdateParameters.Add("id", training)
            sqlTraining.UpdateParameters.Add("hours", hours)
            sqlTraining.UpdateParameters.Add("date", trainingDate)
            sqlTraining.UpdateParameters.Add("final_experience", final_experience)
            sqlTraining.UpdateParameters.Add("status", status)

            sqlTraining.Update()
        End If

        Return message
    End Function

    Public Function rejectTraining(ByVal training As Integer, ByVal initial_experience As Integer, ByVal trainingDate As String) As String
        Dim sqlTraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        Dim hours As Integer = 0
        Dim final_experience As Integer = initial_experience
        Dim status As Integer = 0
        Dim message As String = "Training Canceled"

        sqlTraining.UpdateCommand = "UPDATE training SET final_experience = @final_experience, status = @status, hours = @hours, date = @date WHERE id = @id "
            sqlTraining.UpdateParameters.Add("id", training)
            sqlTraining.UpdateParameters.Add("hours", hours)
            sqlTraining.UpdateParameters.Add("date", trainingDate)
            sqlTraining.UpdateParameters.Add("final_experience", final_experience)
            sqlTraining.UpdateParameters.Add("status", status)

            sqlTraining.Update()

        Return message
    End Function

    Function getInitialExperience(ByVal id As Integer) As Integer

        If id <> 0 Then
            Dim sqlTraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "SELECT * FROM training WHERE id = @id")
            sqlTraining.SelectParameters.Add("id", id)
            sqlTraining.Select(System.Web.UI.DataSourceSelectArguments.Empty)
            Dim dgrid As New GridView
            dgrid.DataSource = sqlTraining
            dgrid.DataBind()
            If dgrid.Rows.Count > 0 Then
                Return dgrid.Rows(0).Cells(6).Text
            End If
        End If


        Return -1

    End Function
End Class
