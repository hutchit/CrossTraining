<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Logout.aspx.vb" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;YOU
        have Been Logged out.<br />
        <br />
    </div>
    <asp:LoginStatus ID="LoginStatus1" runat="server" BackColor="Red" 
        BorderColor="Black" BorderStyle="Inset" ForeColor="White" Height="44px" 
        LoginText="Click Here to Login Again" LogoutAction="Redirect" 
        LogoutPageUrl="~/admin/Departments.aspx" Width="214px" />
    &nbsp; </form>
</body>
</html>
