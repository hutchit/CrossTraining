<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cross Training Manager - Admin</title>
    <style type="text/css">
        .tabimages
        {
            margin: 2px 2px -1px 2px;
        }
        .tabbottom
        {
            width: 100%;
            margin: -3px 0px 0px 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LoginStatus ID="LoginStatus1" runat="server" 
            LogoutPageUrl="~/Logout.aspx" LogoutAction="Redirect" />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="DepartmentsView" runat="server">
                <asp:ImageButton ID="imgBtnDD" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/DepartmentsSelectedTab.png" />
                <asp:ImageButton ID="imgBtnED" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/EmployeesUnselectedTab.png" />
                <asp:ImageButton ID="imgBtnJD" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/jobsUnselectedTab.png" />
                <br />
                <asp:Image ID="Image1" runat="server" Height="16px" 
                    ImageUrl="~/images/tabBottom.png" CssClass="tabbottom" />
                <asp:ListView ID="lstVwDepartments" runat="server" 
                    InsertItemPosition="FirstItem" DataKeyNames="id" 
                    DataSourceID="sqlDepartments">
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
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
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
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
                                                id</th>
                                            <th runat="server">
                                                name</th>
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
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="sqlDepartments" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                    InsertCommand="INSERT INTO departments(name) VALUES (@name)" 
                    SelectCommand="SELECT * FROM [departments] ORDER BY [name]">
                    <InsertParameters>
                        <asp:Parameter Name="name" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="EmployeesView" runat="server">
                <asp:ImageButton ID="imgBtnDE" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/DepartmentsUnselectedTab.png" />
                <asp:ImageButton ID="imgBtnEE" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/EmployeesSelectedTab.png" />
                <asp:ImageButton ID="imgBtnJE" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/jobsUnselectedTab.png" />
                <br />
                <asp:Image ID="Image2" runat="server" CssClass="tabbottom" Height="16px" 
                    ImageUrl="~/images/tabBottom.png" />
                <asp:ListView ID="lstVwEmployees" runat="server" InsertItemPosition="FirstItem" 
                    DataKeyNames="id" DataSourceID="sqlEmployees">
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
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
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
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
                                                id</th>
                                            <th runat="server">
                                                department_id</th>
                                            <th runat="server">
                                                email</th>
                                            <th runat="server">
                                                first_name</th>
                                            <th runat="server">
                                                last_name</th>
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
                        </tr>
                    </EditItemTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
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
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="sqlEmployees" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                    InsertCommand="INSERT INTO employees(department_id, email, first_name, last_name) VALUES (@department_id, @email, @first_name, @last_name)" 
                    SelectCommand="SELECT * FROM [employees] ORDER BY [first_name], [last_name]">
                    <InsertParameters>
                        <asp:Parameter Name="department_id" />
                        <asp:Parameter Name="email" />
                        <asp:Parameter Name="first_name" />
                        <asp:Parameter Name="last_name" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="jobsView" runat="server">
                <asp:ImageButton ID="imgBtnDJ" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/DepartmentsUnselectedTab.png" />
                <asp:ImageButton ID="imgBtnEJ" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/EmployeesUnselectedTab.png" />
                <asp:ImageButton ID="imgBtnJJ" runat="server" CssClass="tabimages" 
                    ImageUrl="~/images/JobsSelectedTab.png" />
                <br />
                <asp:Image ID="Image3" runat="server" CssClass="tabbottom" Height="16px" 
                    ImageUrl="~/images/tabBottom.png" />
                <br />
                <asp:ListView ID="lstVwJobs" runat="server" InsertItemPosition="FirstItem" 
                    DataKeyNames="id" DataSourceID="sqlJobs">
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
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
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
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
                                                id</th>
                                            <th runat="server">
                                                name</th>
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
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="sqlJobs" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                    InsertCommand="INSERT INTO jobs(name) VALUES (@name)" 
                    SelectCommand="SELECT * FROM [jobs] ORDER BY [name]">
                    <InsertParameters>
                        <asp:Parameter Name="jobs" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
