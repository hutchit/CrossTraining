<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Logout.aspx.vb" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <LINK REL=StyleSheet HREF="~/styles.css" TYPE="text/css" MEDIA=screen>
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 167px;
            width: 565px;
            position: relative;
            right: -311px;
            left: 311px;
            top: 3px;
        }
        .newStyle1
        {
            border: medium solid #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    &nbsp;<div class="one">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image1" runat="server" Height="88px" 
            ImageUrl="~/images/4125_1191_128_exit_shut down_shutdown_icon.png" 
            Width="88px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; YOU
        have Been Logged out.<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Please
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Login.aspx">Click here to Log In again</asp:LinkButton>
        .&nbsp;&nbsp;
    </div>
    &nbsp;</form>
</body>
</html>
