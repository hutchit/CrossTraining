<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Train.aspx.vb" Inherits="users_Train" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style type="text/css">
    body 
    {
    	font: 80% 'Tahoma', sans-serif;
        color: #000000;
        background: #E0E0E0;
        min-width: 760px;
        margin: 0;
        padding: 0;
    }
    #wrap 
    {
    	background-color: #ffffff;
        width: 800px;
        margin: 0 auto 0 auto;
    }
    #outerBorder
    {
    	border:solid 4px #FF0000;
    	-moz-border-radius: 15px;
        border-radius: 15px;
    }
</style>

    <title>Cross Training Manager - Train</title>
</head>
<body>
    <div id = "wrap">
    <form id="form1" runat="server">
    <div>
    
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:HyperLink ID="ManageLink" runat="server" NavigateUrl="~/users/Manage.aspx">Manage</asp:HyperLink>
                <asp:HyperLink ID="TrainLink" runat="server" NavigateUrl="~/users/Train.aspx">Train</asp:HyperLink>
                <asp:HyperLink ID="MyTrainingLink" runat="server" NavigateUrl="~/users/MyTraining.aspx">My Training</asp:HyperLink>
                <br />
                <div id = "outerBorder">
                </div>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
    </div>
</body>
</html>
