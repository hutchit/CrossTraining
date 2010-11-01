
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub departments_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnDD.Click, imgBtnDE.Click, imgBtnDJ.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub employees_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnED.Click, imgBtnEE.Click, imgBtnEJ.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub jobs_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnJJ.Click, imgBtnJD.Click, imgBtnJE.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub lstVwDepartments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lstVwDepartments.SelectedIndexChanged

    End Sub
End Class
