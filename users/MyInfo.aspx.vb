
Partial Class users_Train
    Inherits System.Web.UI.Page
    Dim m_employee As Employee
    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '
    'End Sub


    Protected Sub ChangeQuestionButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChangeQuestionButton.Click
        Dim _user As MembershipUser = Membership.GetUser(Page.User.Identity.Name)
        _user.ChangePasswordQuestionAndAnswer(password.Text, newQuestion.Text, newAnswer.Text)
        newQuestion.Text = ""
        newAnswer.Text = ""
        password.Text = ""

        question.Text = _user.PasswordQuestion

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim _user As MembershipUser = Membership.GetUser(Page.User.Identity.Name)
        question.Text = _user.PasswordQuestion
        m_employee = New Employee(_user.UserName)
        lblWelcome.Text = "Welcome, " & m_user.first_name & " " & m_user.last_name
        Dim weather As Animaonline.Weather.WeatherData.GoogleWeatherData = Animaonline.Weather.GoogleWeatherAPI.GetWeather(Animaonline.Globals.LanguageCode.en_US, "Wichita")

        lblTemp.Text = weather.CurrentConditions.Temperature.Fahrenheit & "&deg; F"

        imgWeather.ImageUrl = "~/images/weather/" & weather.CurrentConditions.Condition & ".png"
    End Sub

 
    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

        'Enable/Disable admin panel link 

        Dim user1 As String

        user1 = User.Identity.Name


        If String.Compare("admin", user1) = 0 Then
            LinkButton1.Visible = True

        Else
            LinkButton1.Visible = False


        End If

    End Sub
End Class
