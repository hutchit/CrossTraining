<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Supervisors.aspx.vb" Inherits="users_mytraining" %>

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
                        <tr>
                            <td width="80%">
                                <a class="tabUnSelected" style="margin-left: 30px" href="Departments.aspx">Departments</a>
                                <a class="tabUnSelected" href="Employees.aspx">Employees</a> <a class="tabUnSelected" href="Jobs.aspx">
                                 Jobs</a>
                                <a class="tabSelected" href="Supervisors.aspx">
                                 Supervisors</a>
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
                        &nbsp;<b><span class="style1">Manage Supervisors</span><br />
                        </b>
                        <br />
                        <br />
                        &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#999999" 
                            Text="Supervisor"></asp:Label>
                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="first_name" DataValueField="id" 
                            Height="16px" Width="152px" AutoPostBack="True">
                        </asp:DropDownList>
                        <br />
                        &nbsp;<br />
                        &nbsp;<br />
                        &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Gray" 
                            Text="Supervisee"></asp:Label>
                        &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="first_name" DataValueField="id" 
                            Height="17px" Width="148px">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Height="27px" style="width: 41px" 
                            Text="Add " Width="100px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" 
                            DataKeyNames="id">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" 
                                            Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" 
                                            Text='<%# Eval("SupervisorFirstName") & " " & Eval("SupervisorLastName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="supervisee_idLabel" runat="server" 
                                            Text='<%# Eval("EmployeeFirstName") & " " & Eval("EmployeeLastName") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" 
                                            Text='<%# Eval("SupervisorFirstName") & " " & Eval("SupervisorLastName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" 
                                            Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="supervisee_idLabel" runat="server" 
                                            Text='<%# Eval("EmployeeFirstName") & " " & Eval("EmployeeLastName") %>' />
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
                                        <asp:TextBox ID="supervisee_idTextBox" runat="server" 
                                            Text='<%# Bind("supervisee_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="supervisor_idTextBox" runat="server" 
                                            Text='<%# Bind("supervisor_id") %>' />
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
                                                        Supervisor</th>
                                                    <th runat="server">
                                                        Supervisee</th>
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
                                <tr style="background-color:#008A8C;color: #FFFFFF;">
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
                                        <asp:TextBox ID="supervisee_idTextBox" runat="server" 
                                            Text='<%# Bind("supervisee_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="supervisor_idTextBox" runat="server" 
                                            Text='<%# Bind("supervisor_id") %>' />
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
                                        <asp:Label ID="idLabel" runat="server" 
                                            Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="supervisee_idLabel" runat="server" 
                                            Text='<%# Eval("supervisee_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="supervisor_idLabel" runat="server" 
                                            Text='<%# Eval("supervisor_id") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT [id], [first_name] FROM [employees]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            DeleteCommand="DELETE FROM supervisee_supervisor WHERE (id=@id)" 
                            InsertCommand="INSERT INTO supervisee_supervisor(supervisee_id, supervisor_id) VALUES (@supervisee_id, @supervisor_id)" 
                            SelectCommand="SELECT supervisee_supervisor.id, supervisee_supervisor.supervisee_id, supervisee_supervisor.supervisor_id, employees.first_name AS EmployeeFirstName, employees.last_name AS EmployeeLastName, employees_1.first_name AS SupervisorFirstName, employees_1.last_name AS SupervisorLastName FROM supervisee_supervisor INNER JOIN employees ON supervisee_supervisor.supervisee_id = employees.id INNER JOIN employees AS employees_1 ON supervisee_supervisor.supervisor_id = employees_1.id" 
                            
                            
                            UpdateCommand="UPDATE supervisee_supervisor SET supervisee_id = @supervisee_id, supervisor_id = @supervisor_id WHERE id=@id
">
                            <DeleteParameters>
                                <asp:Parameter Name="id" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="supervisee_id" />
                                <asp:Parameter Name="supervisor_id" />
                                <asp:Parameter Name="id" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="supervisee_id" />
                                <asp:Parameter Name="supervisor_id" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                        <br />
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        </form>
    </div>
</body>
</html>
