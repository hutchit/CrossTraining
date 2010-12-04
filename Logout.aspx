<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Logout.aspx.vb" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <LINK REL=StyleSheet HREF="~/styles.css" TYPE="text/css" MEDIA=screen>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="name"></asp:Label>
        , YOU
        have Been Logged out.<br />
        <br />
        Please
               <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Login.aspx">Click here to Log In again</asp:LinkButton>
    </div>
    &nbsp; </form>
</body>
</html>
