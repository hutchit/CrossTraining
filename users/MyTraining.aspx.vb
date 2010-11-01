
Partial Class users_MyTraining
    Inherits System.Web.UI.Page

    Protected Sub lnkStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkStatus.Click, LinkButton1.Click, LinkButton4.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub lnkHistory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkHistory.Click, LinkButton2.Click, LinkButton5.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub lnkRequest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkRequest.Click, LinkButton3.Click, LinkButton6.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
End Class
