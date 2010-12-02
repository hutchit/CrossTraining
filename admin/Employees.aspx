<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Employees.aspx.vb" Inherits="users_mytraining" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <LINK REL=StyleSheet HREF="~\styles.css" TYPE="text/css" MEDIA=screen>
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
                        <tr width = "80%">
                            <td class="style1">
                                <a class="tabUnSelected" style="margin-left: 30px" href="Departments.aspx">Departments</a>
                                <a class="tabSelected" href="Employees.aspx">Employees</a> <a class="tabUnSelected" href="Jobs.aspx">
                                 Jobs</a>
                                 <a class="tabUnSelected" href="Supervisors.aspx">Supervisors</a>
                            </td>
                            <td width="20%" align="right">
                                <a class="link" href=""></a> &nbsp;|&nbsp; 
                                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" 
                                    LogoutPageUrl="~/Logout.aspx" />
&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <div class="one">
                    <div class="toolbar">
                        <table width="100%" style="margin-bottom: -3px">
                            <tr>
                                <td>
                                <!--Navigation if needed-->
                                    <asp:LinkButton ID="lnkCreateEmployee" class="tabSelected" runat="server" Style="margin-left: 30px">Create Employee</asp:LinkButton>
                                    <asp:LinkButton ID="lnkEmployeeList" class="tabUnSelected" runat="server">Employees List</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <br />
                        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                            CreateUserButtonText="Create Employee" Font-Names="Times New Romen" 
                            Font-Size="Medium">
                            <FinishNavigationTemplate>
                                <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                                    CommandName="MovePrevious" Text="Previous" />
                                <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                                    Text="Finish" />
                            </FinishNavigationTemplate>
                            <WizardSteps>
                                <asp:CreateUserWizardStep runat="server" Title="Create a New Employee">
                                    <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td align="center" colspan="2" style="font-size: 18px; font-weight: bold">
                                                    Create a New Employee</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="1">
                                                    First Name:</td>
                                                <td align="left" colspan="1">
                                                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="1">
                                                    Last Name:</td>
                                                <td align="left" colspan="1">
                                                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="1">
                                                    Departments</td>
                                                <td align="left" colspan="1">
                                                    <asp:DropDownList ID="ddDepartments" runat="server" 
                                                        DataSourceID="SqlDepartments" DataTextField="name" DataValueField="id" 
                                                        Width="125px">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDepartments" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                                                        SelectCommand="SELECT * FROM [departments]"></asp:SqlDataSource>
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
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                        ControlToValidate="Password" ErrorMessage="Password is required." 
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
                                                        ControlToValidate="ConfirmPassword" 
                                                        ErrorMessage="Confirm Password is required." 
                                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
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
                                                        ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
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
                                <asp:CompleteWizardStep runat="server">
                                    <ContentTemplate>
                                        <table border="0" style="font-family:Times New Romen;font-size:100%;">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    Complete</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Your account has been successfully created.</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                                        CommandName="Continue" onclick="ContinueButton_Click" Text="Continue" 
                                                        ValidationGroup="CreateUserWizard1" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:CompleteWizardStep>
                            </WizardSteps>
                        </asp:CreateUserWizard>
                        <br />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="80%">
                                <a class="tabUnSelected" style="margin-left: 30px" href="Departments.aspx">Departments</a>
                                <a class="tabSelected" href="Employees.aspx">Employees</a> <a class="tabUnSelected" href="Jobs.aspx">
                                 Jobs</a>
                                 <a class="tabUnSelected" href="Supervisors.aspx">Supervisors</a>
                            </td>
                            <td width="20%" align="right">
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
                                <!--Navigation if needed-->
                                    <asp:LinkButton ID="LinkButton1" class="tabUnSelected" runat="server" Style="margin-left: 30px">Create Employee</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" class="tabSelected" runat="server">Employees List</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <br />
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
                            DataSourceID="SqlEmployees">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" OnClick="deleteUser" userName='<%# Eval("username") %>' />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="department_idLabel" runat="server" 
                                            Text='<%# Eval("departmentName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="first_nameLabel" runat="server" 
                                            Text='<%# Eval("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" OnClick="deleteUser" userName='<%# Eval("username") %>' />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="department_idLabel" runat="server" 
                                            Text='<%# Eval("departmentName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="first_nameLabel" runat="server" 
                                            Text='<%# Eval("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" 
                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>
                                            No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                            Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                            Text="Clear" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="department_idTextBox" runat="server" 
                                            Text='<%# Bind("department_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="first_nameTextBox" runat="server" 
                                            Text='<%# Bind("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="last_nameTextBox" runat="server" 
                                            Text='<%# Bind("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="usernameTextBox" runat="server" 
                                            Text='<%# Bind("username") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                                    <th runat="server">
                                                    </th>
                                                    <th runat="server">
                                                        Id</th>
                                                    <th runat="server">
                                                        Department</th>
                                                    <th runat="server">
                                                        Email</th>
                                                    <th runat="server">
                                                        First Name</th>
                                                    <th runat="server">
                                                        Last Name</th>
                                                    <th runat="server">
                                                        Username</th>
                                                </tr>
                                                <tr ID="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" 
                                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <EditItemTemplate>
                                <tr style="background-color:#FF0000;color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                            Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                            Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:DropDownList SelectedValue='<%# Bind("department_id") %>' ID="DropDownList1" runat="server" DataSourceID="SqlDepartments"
                                            DataTextField="name" DataValueField="id" Width="125px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDepartments" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>"
                                            SelectCommand="SELECT * FROM [departments]"></asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="first_nameTextBox" runat="server" 
                                            Text='<%# Bind("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="last_nameTextBox" runat="server" 
                                            Text='<%# Bind("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:label ID="usernameTextBox" runat="server" 
                                            Text='<%# eval("username") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="department_idLabel" runat="server" 
                                            Text='<%# Eval("department_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="first_nameLabel" runat="server" 
                                            Text='<%# Eval("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlEmployees" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            DeleteCommand="DELETE FROM employees WHERE (id = @id)" 
                            SelectCommand="SELECT employees.id, employees.department_id, employees.email, employees.first_name, employees.last_name, employees.username, departments.name AS departmentName FROM employees INNER JOIN departments ON employees.department_id = departments.id" 
                            
                            UpdateCommand="UPDATE employees SET department_id = @department_id, email = @email, first_name = @first_name, last_name = @last_name, username = @username WHERE (id = @id)">
                            <DeleteParameters>
                                <asp:Parameter Name="id" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="department_id" />
                                <asp:Parameter Name="email" />
                                <asp:Parameter Name="first_name" />
                                <asp:Parameter Name="last_name" />
                                <asp:Parameter Name="username" />
                                <asp:Parameter Name="id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        </form>
    </div>
</body>
</html>
