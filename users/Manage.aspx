<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Manage.aspx.vb" Inherits="users_manage" %>

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
        .style1
        {
            width: 118px;
        }
    </style>
    <title>Cross Training Manager - Manage</title>
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
                                <a class="tabSelected" style="margin-left: 30px" href="manage.aspx">Manage</a> <a
                                    class="tabUnSelected" href="train.aspx">Train</a> <a class="tabUnSelected" href="MyTraining.aspx">
                                        My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp; 
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
                                <td>
                                    <asp:LinkButton ID="lnkAssign" class="tabSelected" runat="server" Style="margin-left: 30px">Assign</asp:LinkButton>
                                    <asp:LinkButton ID="lnkApprove" class="tabUnSelected" runat="server">Approve</asp:LinkButton>
                                    <asp:LinkButton ID="lnkCharts" class="tabUnSelected" runat="server">System Charts</asp:LinkButton>
                                    <asp:LinkButton ID="lnkReports" class="tabUnSelected" runat="server">Governance Reports</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <table style="width:100%;">
                            <tr>
                                <td class="style1">
                                    Trainer Name</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="first_name" 
                                        DataValueField="trainer_id" Height="16px" Width="95px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    Trainee Name</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        DataSourceID="SqlDataSource3" DataTextField="first_name" 
                                        DataValueField="trainee_id" Width="94px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    Department</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" Height="23px" Text="Assign Trainning" 
                            Width="110px" />
                        <br />
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT training.trainer_id, employees.first_name FROM employees INNER JOIN supervisee_supervisor ON employees.id = supervisee_supervisor.supervisor_id CROSS JOIN departments CROSS JOIN jobs CROSS JOIN training">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT employees.first_name, training.trainee_id FROM training INNER JOIN employees ON training.id = employees.id">
                        </asp:SqlDataSource>
                        <br />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%">
                                <a class="tabSelected" style="margin-left: 30px" href="manage.aspx">Manage</a> <a
                                    class="tabUnSelected" href="train.aspx">Train</a> <a class="tabUnSelected" href="MyTraining.aspx">
                                        My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp; 
                                <asp:LoginStatus ID="LoginStatus2" runat="server" 
                                    LogoutPageUrl="~/Logout.aspx" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="one">
                    <div class="toolbar">
                        <table width="100%" style="margin-bottom: -3px">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" class="tabUnSelected" runat="server" Style="margin-left: 30px">Assign</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" class="tabSelected" runat="server">Approve</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" class="tabUnSelected" runat="server">System Charts</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton4" class="tabUnSelected" runat="server">Governance Reports</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="department_idLabel" runat="server" 
                                            Text='<%# Eval("department_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="first_nameLabel" runat="server" 
                                            Text='<%# Eval("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainer_idLabel" runat="server" 
                                            Text='<%# Eval("trainer_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainee_idLabel" runat="server" 
                                            Text='<%# Eval("trainee_id") %>' />
                                    </td>
                                    <td>
                                    <asp:Button ID="acceptButton" runat="server" employee_ID='<%# Eval("id") %>' 
                                            OnClick="acceptTranning" Text="Accept Request" />
                                     </td>
                                     <td>
                                    <asp:Button ID="resetButton" runat="server"  employee_ID='<%# Eval("id") %>' 
                                            OnClick="denyTrainning" Text="Deny Request" />
                                     </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFF8DC;">
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="department_idLabel" runat="server" 
                                            Text='<%# Eval("department_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="first_nameLabel" runat="server" 
                                            Text='<%# Eval("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainer_idLabel" runat="server" 
                                            Text='<%# Eval("trainer_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainee_idLabel" runat="server" 
                                            Text='<%# Eval("trainee_id") %>' />
                                    </td>
                                    <td>
                                    <asp:Button ID="acceptButton" runat="server" employee_ID='<%# Eval("id") %>' 
                                            OnClick="requestTraining" Text="Accept Request" />
                                     </td>
                                     <td>
                                    <asp:Button ID="resetButton" runat="server" employee_ID='<%# Eval("id") %>' 
                                            OnClick="requestTraining" Text="Deny Request" />
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
                                    <td>
                                        <asp:TextBox ID="department_idTextBox" runat="server" 
                                            Text='<%# Bind("department_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="last_nameTextBox" runat="server" 
                                            Text='<%# Bind("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="first_nameTextBox" runat="server" 
                                            Text='<%# Bind("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="trainer_idTextBox" runat="server" 
                                            Text='<%# Bind("trainer_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="trainee_idTextBox" runat="server" 
                                            Text='<%# Bind("trainee_id") %>' />
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
                                                        name</th>
                                                    <th runat="server">
                                                        department_id</th>
                                                    <th runat="server">
                                                        last_name</th>
                                                    <th runat="server">
                                                        first_name</th>
                                                    <th runat="server">
                                                        trainer_id</th>
                                                    <th runat="server">
                                                        trainee_id</th>
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
                                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="department_idTextBox" runat="server" 
                                            Text='<%# Bind("department_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="last_nameTextBox" runat="server" 
                                            Text='<%# Bind("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="first_nameTextBox" runat="server" 
                                            Text='<%# Bind("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="trainer_idTextBox" runat="server" 
                                            Text='<%# Bind("trainer_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="trainee_idTextBox" runat="server" 
                                            Text='<%# Bind("trainee_id") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="department_idLabel" runat="server" 
                                            Text='<%# Eval("department_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="first_nameLabel" runat="server" 
                                            Text='<%# Eval("first_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainer_idLabel" runat="server" 
                                            Text='<%# Eval("trainer_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainee_idLabel" runat="server" 
                                            Text='<%# Eval("trainee_id") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT jobs.name, jobs.department_id, employees.last_name, employees.first_name, training.trainer_id, training.trainee_id FROM training INNER JOIN jobs ON training.job_id = jobs.id CROSS JOIN employees CROSS JOIN supervisee_supervisor CROSS JOIN departments">
                        </asp:SqlDataSource>
                        <br />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <br />
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%">
                                <a class="tabSelected" style="margin-left: 30px" href="manage.aspx">Manage</a> <a
                                    class="tabUnSelected" href="train.aspx">Train</a> <a class="tabUnSelected" href="MyTraining.aspx">
                                        My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp; 
                                <asp:LoginStatus ID="LoginStatus3" runat="server" 
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
                                    <asp:LinkButton ID="LinkButton5" class="tabUnSelected" runat="server" Style="margin-left: 30px">Assign</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton6" class="tabUnSelected" runat="server">Approve</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton7" class="tabSelected" runat="server">System Charts</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton8" class="tabUnSelected" runat="server">Governance Reports</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <br />
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%">
                                <a class="tabSelected" style="margin-left: 30px" href="manage.aspx">Manage</a> <a
                                    class="tabUnSelected" href="train.aspx">Train</a> <a class="tabUnSelected" href="MyTraining.aspx">
                                        My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp; 
                                <asp:LoginStatus ID="LoginStatus4" runat="server" 
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
                                    <asp:LinkButton ID="LinkButton9" class="tabUnSelected" runat="server" Style="margin-left: 30px">Assign</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton10" class="tabUnSelected" runat="server">Approve</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton11" class="tabUnSelected" runat="server">System Charts</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton12" class="tabSelected" runat="server">Governance Reports</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        </form>
    </div>
</body>
</html>
