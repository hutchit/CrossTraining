<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MyInfo.aspx.vb" Inherits="users_train" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <LINK REL=StyleSheet HREF="~/styles.css" TYPE="text/css" MEDIA=screen>
    <title>Cross Training Manager - My Info</title>
</head>
<body>
        <form id="form1" runat="server">
    <div id="wrap">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <br />
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%">
                                <a class="tabUnSelected" style="margin-left: 30px" href="Manage.aspx">Manage</a>
                                <a class="tabUnSelected" href="Train.aspx">Train</a> <a class="tabUnSelected" href="MyTraining.aspx">
                                    My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                    PostBackUrl="~/admin/Departments.aspx">Admin Panel</asp:LinkButton>
                                &nbsp;| <a class="link" href="MyInfo.aspx">My Info</a>
                                <!-- This was here before, but it wasn't working
                                     &nbsp;<a class="link" href="~/users/manage.aspx">Log Out</a>
                                     currently replacing it with the LoginStatus control after reading some ASP tutorials 
                                -->
                                &nbsp;|&nbsp;
                                <!-- This was here before, but it wasn't working
                                     &nbsp;<a class="link" href="~/users/manage.aspx">Log Out</a>
                                     currently replacing it with the LoginStatus control after reading some ASP tutorials 
                                -->
                                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" 
                                    LogoutPageUrl="~/Logout.aspx" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="one">
                    <div class="toolbar">
                        <table width="100%" style="margin-bottom: -3px">
                            <tr>
                                <td class="Title">
                                    My Info
                                    <!--Navigation controls if needed
<asp:LinkButton ID="lnkStatus" class="tabSelected" runat="server" style="margin-left:30px">Status</asp:LinkButton>
<asp:LinkButton ID="lnkHistory" class="tabUnSelected" runat="server" style="margin-left:30px">History</asp:LinkButton>
<asp:LinkButton ID="lnkRequest" class="tabUnSelected" runat="server" style="margin-left:30px">Request</asp:LinkButton>
-->
                                </td>
                            </tr>
                        </table>
                        
                    </div>
                    <div class="two">
                            <asp:Panel ID="ResetPasswordPanel" runat="server" BackColor="#F7F6F3" 
                                BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="3px" 
                                style="padding:4px;" Width="500px">
                                <asp:Label ID="ResetPasswordPanelLabel" runat="server" BackColor="#5D7B9D" 
                                    BorderColor="#5D7B9D" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" 
                                    Font-Names="Tahoma" ForeColor="White" style="text-align:center" 
                                    Text="Change Your Security Question" Width="99%"></asp:Label>
                                <br />
                                <asp:Table ID="ResetPasswordTable" runat="server" 
                                    style="font-family:Tahoma; text-align:center">
                                    <asp:TableRow ID="OldQuestionRow" runat="server">
                                        <asp:TableCell ID="QuestionCell1" runat="server" style="text-align:right">
                                        <asp:Label ID="QuestionLabel1" runat="server" Text="Question:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell ID="QuestionCell2" runat="server" style="text-align:left">
                                        <asp:Label ID="question" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="PasswordRow" runat="server">
                                        <asp:TableCell ID="PasswordCell1" runat="server" style="text-align:right">
                                        <asp:Label ID="PasswordLabel1" runat="server" Text="Password:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell ID="PasswordCell2" runat="server" style="text-align:left">
                                        <asp:TextBox ID="password" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="NewQuestionRow" runat="server">
                                        <asp:TableCell ID="NewQuestionCell" runat="server" style="text-align:right">
                                        <asp:Label ID="NewQuestionLabel" runat="server" Text="New Question:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell ID="NewQuestionDropdown" runat="server" style="text-align:left">
                                        <asp:DropDownList ID="newQuestion" runat="server" Width="300px">
                                            <asp:ListItem Text="" />
                                            <asp:ListItem Text="In what city was your first job?" />
                                            <asp:ListItem Text="In what city were you born?" />
                                            <asp:ListItem Text="What High School did you graduate from?" />
                                            <asp:ListItem Text="What is your favorite food?" />
                                            <asp:ListItem Text="What was the make and model of your first car?" />
                                        </asp:DropDownList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="NewAnswerRow" runat="server" style="text-align:right">
                                        <asp:TableCell ID="NewAnswerCell1" runat="server">
                                        <asp:Label ID="NewAnswerLabel" runat="server" Text="New Answer:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell ID="NewAnswerCell2" runat="server" style="text-align:left">
                                        <asp:TextBox ID="newAnswer" runat="server" Width="300px"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="ButtonsRow" runat="server" style="text-align:center">
                                        <asp:TableCell ID="ButtonsRowSpacer" runat="server" colspan="2" 
                                            style="text-align:center">
                                        <asp:Table ID="ButtonsTable" runat="server" Width="100%">
                                            <asp:TableRow>
                                                <asp:TableCell ID="ChangeQuestionButtonCell" runat="server" 
                                                    style="text-align:right">
                                                <asp:Button ID="ChangeQuestionButton" runat="server" BackColor="#FFFBFF" 
                                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" 
                                                    Font-Size="0.9em" ForeColor="#284775" Text="Change Question" />
                                                </asp:TableCell>
                                                <asp:TableCell ID="CancelButtonCell" runat="server" style="text-align:left">
                                                <asp:Button ID="QuestionCancel" runat="server" BackColor="#FFFBFF" 
                                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" 
                                                    Font-Size="0.9em" ForeColor="#284775" PostBackUrl="~/users/Default.aspx" 
                                                    Text="Cancel" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:Label ID="ResetPasswordPanelLabel1" runat="server" BackColor="#5D7B9D" 
                                    BorderColor="#5D7B9D" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" 
                                    Font-Names="Tahoma" ForeColor="White" style="text-align:center" 
                                    Text="Change Your Password" Width="99%"></asp:Label>
                                <br />
                                <asp:ChangePassword ID="ChangePassword1" runat="server">
                                    <ChangePasswordTemplate>
                                        <table border="0" cellpadding="1" cellspacing="0" 
                                            style="border-collapse:collapse;">
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0">

                                                        <tr>
                                                            <td align="right">
                                                                <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                                                    AssociatedControlID="CurrentPassword">Password:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                                                    ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                                                    ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Label ID="NewPasswordLabel" runat="server" 
                                                                    AssociatedControlID="NewPassword">New Password:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                                                    ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                                                    ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                                                    AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                                                    ControlToValidate="ConfirmNewPassword" 
                                                                    ErrorMessage="Confirm New Password is required." 
                                                                    ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="2">
                                                                <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                                    ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                                                    Display="Dynamic" 
                                                                    ErrorMessage="The Confirm New Password must match the New Password entry." 
                                                                    ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="2" style="color:Red;">
                                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
<asp:Button ID="ChangePasswordPushButton" runat="server" BackColor="#FFFBFF" 
BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" 
Font-Size="0.9em" ForeColor="#284775"
CommandName="ChangePassword" Text="Change Password" 
ValidationGroup="ChangePassword1" />

                                                            </td>
                                                            <td>
<asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" 
Font-Size="0.9em" ForeColor="#284775"
BackColor="#FFFBFF" CommandName="Cancel" Text="Cancel" />                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ChangePasswordTemplate>
                                </asp:ChangePassword>
                            </asp:Panel>
                            <br />
                            <br />
                            <br />
                            <asp:LoginName ID="LoginName1" runat="server" Visible="False" />
                            <br />
                            <br />
                            <br />
                        </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
        </form>
    </body>
</html>
