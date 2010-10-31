
Partial Class PasswordRecovery
    Inherits System.Web.UI.Page

    Protected Sub PasswordRecovery1_SendingMail(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MailMessageEventArgs) Handles PasswordRecovery1.SendingMail
        Dim mm As New Net.Mail.MailMessage()

        mm.From = e.Message.From

        mm.Subject = e.Message.Subject.ToString()

        mm.[To].Add(e.Message.[To](0))

        mm.Body = e.Message.Body
        Dim smtp As New Net.Mail.SmtpClient()
        smtp.EnableSsl = True

        smtp.Send(mm)
        e.Cancel = True
    End Sub
End Class
