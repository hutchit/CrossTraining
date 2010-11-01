
Partial Class users_Train
    Inherits System.Web.UI.Page

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

    End Sub
End Class
