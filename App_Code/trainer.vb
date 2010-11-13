Imports Microsoft.VisualBasic

Public Class trainer
    Inherits Employee

    Public Sub New(ByVal uname As String)
        MyBase.New(uname)
    End Sub

    Public Sub New(ByVal uid As Integer)
        MyBase.New(uid)
    End Sub

    Public Function completeTraining(ByVal training As Integer, ByVal initial_experience As Integer, ByVal status As Integer, ByVal did As Integer) As String
        Dim sqlTraining As New SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("ProjectConnectionString").ToString(), "")
        Dim level As Integer = trainingLevel(0)
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
            sqlTraining.UpdateCommand = ""
            sqlTraining.UpdateParameters.Add("trainee_id", userid)
            sqlTraining.UpdateParameters.Add("department_id", did)
            sqlTraining.UpdateParameters.Add("date", 0)
            sqlTraining.UpdateParameters.Add("final_experience", initial_experience)
            sqlTraining.UpdateParameters.Add("status", status)

            sqlTraining.Insert()
        End If

        Return message
    End Function
End Class
