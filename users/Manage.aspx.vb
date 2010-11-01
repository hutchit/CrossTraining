
Partial Class users_Manage
    Inherits System.Web.UI.Page

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
