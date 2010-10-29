<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loging Page</title>
    <style type="text/css">
        #Button2
        {
            width: 80px;
        }
        #Button1
        {
            width: 78px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jerredsProjectConnectionString %>" 
                SelectCommand="SELECT * FROM [training]"></asp:SqlDataSource>
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="supervisee_id" 
                DataSourceID="SqlDataSource2" InsertItemPosition="FirstItem">
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="supervisee_idLabel" runat="server" 
                                Text='<%# Eval("supervisee_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supervisor_idLabel" runat="server" 
                                Text='<%# Eval("supervisor_id") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="supervisee_idLabel" runat="server" 
                                Text='<%# Eval("supervisee_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supervisor_idLabel" runat="server" 
                                Text='<%# Eval("supervisor_id") %>' />
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
                                            supervisee_id</th>
                                        <th runat="server">
                                            supervisor_id</th>
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
                                            ShowLastPageButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                SelectCommand="SELECT * FROM [supervisee_supervisor]"></asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
                DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <tr style="background-color: #FFFBD6;color: #333333;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="trainee_idLabel" runat="server" 
                                Text='<%# Eval("trainee_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="trainer_idLabel" runat="server" 
                                Text='<%# Eval("trainer_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supervisor_idLabel" runat="server" 
                                Text='<%# Eval("supervisor_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="department_idLabel" runat="server" 
                                Text='<%# Eval("department_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="job_idLabel" runat="server" Text='<%# Eval("job_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="initial_experienceLabel" runat="server" 
                                Text='<%# Eval("initial_experience") %>' />
                        </td>
                        <td>
                            <asp:Label ID="final_experienceLabel" runat="server" 
                                Text='<%# Eval("final_experience") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        </td>
                        <td>
                            <asp:Label ID="hoursLabel" runat="server" Text='<%# Eval("hours") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color: #FAFAD2;color: #284775;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="trainee_idLabel" runat="server" 
                                Text='<%# Eval("trainee_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="trainer_idLabel" runat="server" 
                                Text='<%# Eval("trainer_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supervisor_idLabel" runat="server" 
                                Text='<%# Eval("supervisor_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="department_idLabel" runat="server" 
                                Text='<%# Eval("department_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="job_idLabel" runat="server" Text='<%# Eval("job_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="initial_experienceLabel" runat="server" 
                                Text='<%# Eval("initial_experience") %>' />
                        </td>
                        <td>
                            <asp:Label ID="final_experienceLabel" runat="server" 
                                Text='<%# Eval("final_experience") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        </td>
                        <td>
                            <asp:Label ID="hoursLabel" runat="server" Text='<%# Eval("hours") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
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
                            <asp:TextBox ID="trainee_idTextBox" runat="server" 
                                Text='<%# Bind("trainee_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="trainer_idTextBox" runat="server" 
                                Text='<%# Bind("trainer_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="supervisor_idTextBox" runat="server" 
                                Text='<%# Bind("supervisor_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="department_idTextBox" runat="server" 
                                Text='<%# Bind("department_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="job_idTextBox" runat="server" Text='<%# Bind("job_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="initial_experienceTextBox" runat="server" 
                                Text='<%# Bind("initial_experience") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="final_experienceTextBox" runat="server" 
                                Text='<%# Bind("final_experience") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="hoursTextBox" runat="server" Text='<%# Bind("hours") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                        <th runat="server">
                                            id</th>
                                        <th runat="server">
                                            trainee_id</th>
                                        <th runat="server">
                                            trainer_id</th>
                                        <th runat="server">
                                            supervisor_id</th>
                                        <th runat="server">
                                            department_id</th>
                                        <th runat="server">
                                            job_id</th>
                                        <th runat="server">
                                            initial_experience</th>
                                        <th runat="server">
                                            final_experience</th>
                                        <th runat="server">
                                            status</th>
                                        <th runat="server">
                                            hours</th>
                                        <th runat="server">
                                            date</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" 
                                style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #FFCC66;color: #000080;">
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
                            <asp:TextBox ID="trainee_idTextBox" runat="server" 
                                Text='<%# Bind("trainee_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="trainer_idTextBox" runat="server" 
                                Text='<%# Bind("trainer_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="supervisor_idTextBox" runat="server" 
                                Text='<%# Bind("supervisor_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="department_idTextBox" runat="server" 
                                Text='<%# Bind("department_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="job_idTextBox" runat="server" Text='<%# Bind("job_id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="initial_experienceTextBox" runat="server" 
                                Text='<%# Bind("initial_experience") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="final_experienceTextBox" runat="server" 
                                Text='<%# Bind("final_experience") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="hoursTextBox" runat="server" Text='<%# Bind("hours") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="trainee_idLabel" runat="server" 
                                Text='<%# Eval("trainee_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="trainer_idLabel" runat="server" 
                                Text='<%# Eval("trainer_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supervisor_idLabel" runat="server" 
                                Text='<%# Eval("supervisor_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="department_idLabel" runat="server" 
                                Text='<%# Eval("department_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="job_idLabel" runat="server" Text='<%# Eval("job_id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="initial_experienceLabel" runat="server" 
                                Text='<%# Eval("initial_experience") %>' />
                        </td>
                        <td>
                            <asp:Label ID="final_experienceLabel" runat="server" 
                                Text='<%# Eval("final_experience") %>' />
                        </td>
                        <td>
                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        </td>
                        <td>
                            <asp:Label ID="hoursLabel" runat="server" Text='<%# Eval("hours") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </asp:View>
    </asp:MultiView>
    </form>
</body>
</html>
