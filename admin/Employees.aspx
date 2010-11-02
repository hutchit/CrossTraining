<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Employees.aspx.vb" Inherits="users_mytraining" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <style type="text/css">
        body
        {
            font: 80% 'Tahoma' , sans-serif;
            color: #000000;
            background: #E0E0E0;
            min-width: 760px;
            margin: 0;
            padding: 0;
        }
        #wrap
        {
            width: 900px;
            margin: 0 auto 0 auto;
        }
        #outerBorder
        {
            border: solid 4px #FF0000;
            -moz-border-radius: 15px;
            border-radius: 15px;
        }
        div.one
        {
            padding: 10px;
            margin-top: 10px;
            -moz-border-radius: 30px;
            -webkit-border-radius: 30px;
            -khtml-border-radius: 30px;
            border-style: solid;
            border-width: 2px;
            border-color: #FF0000;
            background: -moz-linear-gradient(top,  	#FFFFFF,  #C0C0C0);
        }
        div.two
        {
            padding: 10px;
            margin-top: 10px;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            -khtml-border-radius: 20px;
            border-style: solid;
            border-width: 2px;
            border-color: #FF0000;
            background-color: #FFFFFF;
        }
        a.tabSelected
        {
            text-decoration: none;
            color: white;
            margin-left: -3px;
            padding: 14px;
            padding-left: 20px;
            padding-right: 20px;
            -moz-border-radius: 15px 60px;
            -webkit-border-radius: 15px 60px;
            -khtml-border-radius: 15px 60px;
            border-radius: 15px 60px;
            -moz-border-radius-bottomright: 0px;
            border-bottom-right-radius: 0px;
            -moz-border-radius-bottomleft: 0px;
            border-bottom-left-radius: 0px;
            border-style: solid;
            border-width: 0px;
            border-color: #FF0000;
            background: -webkit-gradient(linear, left top, left bottom, from(#FF0000), to(#808080));
            background: -moz-linear-gradient(bottom,  #FF0000,  #808080);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF0000', endColorstr='#808080');
            font-weight: bold;
            font-family: "Times New Roman";
            font-size: 18px;
        }
        a.tabUnSelected
        {
            text-decoration: none;
            color: #5C5858;
            margin-left: -3px;
            padding: 14px;
            padding-left: 20px;
            padding-right: 20px;
            padding-bottom: 12px;
            -moz-border-radius: 15px 60px;
            -webkit-border-radius: 15px 60px;
            -khtml-border-radius: 15px 60px;
            border-radius: 15px 60px;
            -moz-border-radius-bottomright: 0px;
            border-bottom-right-radius: 0px;
            -moz-border-radius-bottomleft: 0px;
            border-bottom-left-radius: 0px;
            border-style: solid;
            border-width: 0px;
            border-color: #C0C0C0;
            background: -webkit-gradient(linear, left top, left bottom, from(#808080), to(#C0C0C0));
            background: -moz-linear-gradient(top,  #808080,  #C0C0C0);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#808080', endColorstr='#C0C0C0');
            font-weight: bold;
            font-family: "Times New Roman";
            font-size: 18px;
            z-index: -1;
        }
        a.tabUnSelected:hover
        {
            text-decoration: none;
            color: white;
            margin-left: -3px;
            padding: 14px;
            padding-left: 20px;
            padding-right: 20px;
            -moz-border-radius: 15px 60px;
            -webkit-border-radius: 15px 60px;
            -khtml-border-radius: 15px 60px;
            border-radius: 15px 60px;
            -moz-border-radius-bottomright: 0px;
            border-bottom-right-radius: 0px;
            -moz-border-radius-bottomleft: 0px;
            border-bottom-left-radius: 0px;
            border-style: solid;
            border-width: 0px;
            border-color: #FF0000;
            background: -webkit-gradient(linear, left top, left bottom, from(#FF0000), to(#808080));
            background: -moz-linear-gradient(bottom,  #FF0000,  #808080);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF0000', endColorstr='#808080');
            font-weight: bold;
            font-family: "Times New Roman";
            font-size: 18px;
        }
        div.toolbar
        {
            background: -moz-linear-gradient(left,  	#FFFFFF,  #C0C0C0);
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 20px;
            padding-bottom: 14px;
            margin-left: 30px;
            margin-right: 30px;
            margin-bottom: -12px;
            -moz-border-radius: 30px 30px 0px 0px;
            -webkit-border-radius: 30px;
            -khtml-border-radius: 30px;
            border-style: solid;
            border-bottom-style: none;
            border-width: 1px;
            border-color: #808080;
        }
        a.link:hover
        {
            color: black;
            text-decoration: none;
            font-weight: bold;
            font-family: "Times New Roman";
            font-size: 16px;
            margin-left: -4px;
        }
        a
        {
            color: black;
            text-decoration: none;
            font-family: "Times New Roman";
            font-size: 16px;
        }
    </style>
    <title>Cross Training Manager - Admin (Employees)</title>
</head>
<body>
    <div id="wrap">
        <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <br />
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%">
                                <a class="tabUnSelected" style="margin-left: 30px" href="Departments.aspx">Departments</a>
                                <a class="tabSelected" href="Employees.aspx">Employees</a> <a class="tabUnSelected" href="Jobs.aspx">
                                 Jobs</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href=""></a> &nbsp;|&nbsp; <a class="link" href="manage.aspx">
                                    Log Out</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="one">
                    <div class="toolbar">
                        <table width="100%" style="margin-bottom: -3px">
                            <tr>
                                <td>
                                <!--Navigation if needed
                                    <asp:LinkButton ID="lnkStatus" class="tabSelected" runat="server" Style="margin-left: 30px">Departments</asp:LinkButton>
                                    <asp:LinkButton ID="lnkHistory" class="tabUnSelected" runat="server">Employees</asp:LinkButton>
                                    <asp:LinkButton ID="lnkRequest" class="tabUnSelected" runat="server">Jobs</asp:LinkButton>
                                    -->
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <br />
                        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                            CreateUserButtonText="Create Employee">
                            <WizardSteps>
                                <asp:CreateUserWizardStep runat="server" Title="Create a New Employee" >
                                    <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    Create a New Employee</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="1">
                                                    First Name:</td>
                                                <td align="left" colspan="1">
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="1">
                                                    Last Name:</td>
                                                <td align="left" colspan="1">
                                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                        ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" 
                                                        AssociatedControlID="Password">Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                        ControlToValidate="Password" 
                                                        ErrorMessage="Password is required." 
                                                        ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                                        AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                                        ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." 
                                                        ToolTip="Confirm Password is required." 
                                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                                        ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                                        ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                                        ControlToValidate="Question" ErrorMessage="Security question is required." 
                                                        ToolTip="Security question is required." 
                                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                                        ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                                        ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                                        Display="Dynamic" 
                                                        ErrorMessage="The Password and Confirmation Password must match." 
                                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color:Red;">
                                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:CreateUserWizardStep>
                                <asp:CompleteWizardStep runat="server" />
                            </WizardSteps>
                        </asp:CreateUserWizard>
                        <br />
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        </form>
    </div>
</body>
</html>
