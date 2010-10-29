<%@ Page Language="VB" AutoEventWireup="false" CodeFile="User Form.aspx.vb" Inherits="User_Form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Label ID="Label1" runat="server" ForeColor="#99FF33" Text="Department"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" ForeColor="#CCFF66"></asp:TextBox>
    <p>
&nbsp; Job Type&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Request" />
    </p>
    </form>
</body>
</html>
