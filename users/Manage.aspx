<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Manage.aspx.vb" Inherits="users_manage" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

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
                        <br />
                        <b>ASSIGN TRAINNING</b><br />
                        <br />
                        <br />
                        <br />
                        <b>EMPLOYEE NAME</b>
                        <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource5" DataTextField="first_name" DataValueField="id">
                        </asp:DropDownList>
                        <b>
                        <br />
                        <br />
                        DEPATMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource8" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <br />
                        <br />
                        JOB NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>&nbsp;<asp:DropDownList ID="DropDownList6" runat="server" 
                            AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="name" 
                            DataValueField="id">
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:CheckBox ID="chkTrainer" runat="server" Text="Create Trainer" />
                        <br />
                        <br />
                        <b>TRAINER</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="first_name" 
                            DataValueField="trainee_id">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Assign" Width="85px" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT jobs.name, jobs.id FROM jobs INNER JOIN departments ON jobs.department_id = departments.id WHERE (departments.id = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList8" Name="id" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT departments.name, departments.id FROM employees INNER JOIN departments ON employees.department_id = departments.id WHERE (employees.id = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList5" Name="id" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
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
                        <asp:Label ID="Label3" runat="server" ForeColor="White" Text="2"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" ForeColor="White" Text="1"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="2" ForeColor="White"></asp:Label>
                        <br />
                        <b>Select your Employee</b>
                        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource5" DataTextField="first_name" 
                            DataValueField="id" Height="16px" Width="91px">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Assign Trainer</b>&nbsp;
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="first_name" 
                            DataValueField="trainee_id">
                        </asp:DropDownList>
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Expr1" 
                            DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Expr2Label" runat="server" Text='<%# Eval("Expr2") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="job_idLabel" runat="server" Text='<%# Eval("job_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="initial_experienceLabel" runat="server" 
                                            Text='<%# Eval("initial_experience") %>' />
                                    </td>
                                    <td>
                                        <asp:Button ID="acceptButton" runat="server" OnClick="acceptTraining" 
                                            Text="Accept Request" training_ID='<%# Eval("Expr1") %>' />
                                    </td>
                                    <td>
                                        <asp:Button ID="resetButton" runat="server" OnClick="denyTraining" 
                                            Text="Deny Request" training_ID='<%# Eval("Expr1") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFF8DC;">
                                    <td>
                                        <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Expr2Label" runat="server" Text='<%# Eval("Expr2") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="job_idLabel" runat="server" Text='<%# Eval("job_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="initial_experienceLabel" runat="server" 
                                            Text='<%# Eval("initial_experience") %>' />
                                    </td>
                                    <td>
                                        <asp:Button ID="acceptButton" runat="server" OnClick="acceptTraining" 
                                            Text="Accept Request" training_ID='<%# Eval("Expr1") %>' />
                                    </td>
                                    <td>
                                        <asp:Button ID="resetButton" runat="server" OnClick="denyTraining" 
                                            Text="Deny Request" training_ID='<%# Eval("Expr1") %>' />
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
                                        <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Expr2TextBox" runat="server" Text='<%# Bind("Expr2") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="job_idTextBox" runat="server" Text='<%# Bind("job_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="initial_experienceTextBox" runat="server" 
                                            Text='<%# Bind("initial_experience") %>' />
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
                                                        TrainingID</th>
                                                    <th runat="server">
                                                        status</th>
                                                    <th runat="server">
                                                        name</th>
                                                    <th runat="server">
                                                        Department</th>
                                                    <th runat="server">
                                                        job_id</th>
                                                    <th runat="server">
                                                        initial_experience</th>
                                                    <th id="Th1" runat="server">
                                                        Accept Request</th>
                                                    <th id="Th2" runat="server">
                                                        Deny Request</th>
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
                                        <asp:Label ID="Expr1Label1" runat="server" Text='<%# Eval("Expr1") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Expr2TextBox" runat="server" Text='<%# Bind("Expr2") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="job_idTextBox" runat="server" Text='<%# Bind("job_id") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="initial_experienceTextBox" runat="server" 
                                            Text='<%# Bind("initial_experience") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                                    <td>
                                        <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Expr2Label" runat="server" Text='<%# Eval("Expr2") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="job_idLabel" runat="server" Text='<%# Eval("job_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="initial_experienceLabel" runat="server" 
                                            Text='<%# Eval("initial_experience") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <br />
                        &nbsp;<br />
                        &nbsp;<b>ACCEPTED REQUESTS</b><br />
                        <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" 
                            DataSourceID="SqlDataSource6">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="traineeLabel" runat="server" Text='<%# Eval("trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainerLabel" runat="server" Text='<%# Eval("trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="deptNameLabel" runat="server" Text='<%# Eval("deptName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFF8DC;">
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="traineeLabel" runat="server" Text='<%# Eval("trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainerLabel" runat="server" Text='<%# Eval("trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="deptNameLabel" runat="server" Text='<%# Eval("deptName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>' />
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
                                        <asp:TextBox ID="traineeTextBox" runat="server" Text='<%# Bind("trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="trainerTextBox" runat="server" Text='<%# Bind("trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="deptNameTextBox" runat="server" 
                                            Text='<%# Bind("deptName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="JobTextBox" runat="server" Text='<%# Bind("Job") %>' />
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
                                                        trainee</th>
                                                    <th runat="server">
                                                        trainer</th>
                                                    <th runat="server">
                                                        deptName</th>
                                                    <th runat="server">
                                                        Job</th>
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
                                        <asp:TextBox ID="traineeTextBox" runat="server" Text='<%# Bind("trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="trainerTextBox" runat="server" Text='<%# Bind("trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="deptNameTextBox" runat="server" 
                                            Text='<%# Bind("deptName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="JobTextBox" runat="server" Text='<%# Bind("Job") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                                    <td>
                                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="traineeLabel" runat="server" Text='<%# Eval("trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainerLabel" runat="server" Text='<%# Eval("trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="deptNameLabel" runat="server" Text='<%# Eval("deptName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            
                            
                            
                            SelectCommand="SELECT training.id AS Expr1, training.status, jobs.name, departments.name AS Expr2, training.job_id, training.initial_experience FROM training INNER JOIN jobs ON training.job_id = jobs.id INNER JOIN departments ON training.department_id = departments.id WHERE (training.status = @status) AND (training.trainee_id = @trainee_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" DefaultValue="" Name="status" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="DropDownList4" Name="trainee_id" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            
                            SelectCommand="SELECT training.trainee_id, employees.first_name FROM training INNER JOIN employees ON training.trainee_id = employees.id WHERE (training.final_experience = 2)">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT supervisee_supervisor.supervisee_id, employees.id, employees.username, employees.first_name, employees.last_name FROM supervisee_supervisor INNER JOIN employees ON supervisee_supervisor.supervisee_id = employees.id WHERE (supervisee_supervisor.supervisor_id = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT training.id, employees.first_name AS trainee, employees_1.first_name AS trainer, departments.name AS deptName, jobs.name AS Job FROM training INNER JOIN employees ON training.trainee_id = employees.id INNER JOIN employees AS employees_1 ON training.trainer_id = employees_1.id INNER JOIN departments ON training.department_id = departments.id INNER JOIN jobs ON training.job_id = jobs.id WHERE (training.status = @status) AND (training.supervisor_id = @supervisor_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label3" Name="status" PropertyName="Text" />
                                <asp:ControlParameter ControlID="Label1" Name="supervisor_id" 
                                    PropertyName="Text" />
                            </SelectParameters>
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
