<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Manage.aspx.vb" Inherits="users_manage" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <LINK REL=StyleSheet HREF="~/styles.css" TYPE="text/css" MEDIA=screen>
    <script type="text/javascript">
        function showhide(c) {
            var next = c.parentNode.nextSibling;
            while (next.nodeName.toLowerCase() != 'tr') {
                next = next.nextSibling;
            }
            next.style.display = (next.style.display == '') ? 'none' : '';
        }
    </script>
     <link type="text/css" href="jquery-ui-1.8.6.custom.css" rel="stylesheet" />

     <script src="jquery-1.4.2.min.js" type="text/javascript"></script>

     <script src="jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>

    <SCRIPT type="text/javascript">

        $(function() {

                $(".datePicker").datepicker();

        });   

       </SCRIPT>
    <title>Cross Training Manager - Manage</title>
</head>
<body>
    <div id="wrap">
    <table width = "100%">
         <tr>
         <td style="width:80%;">
        <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" 
            Font-Names="Times New Roman" Font-Size="Large" Text="Welcome, "></asp:Label>
            </td>
            <td align="right">
                <asp:Image ID="imgWeather" runat="server" Height="60px" ImageAlign="Middle" />
                <asp:Label ID="lblTemp" runat="server" Text="" Font-Bold="True" Font-Names="Times New Roman" Font-Size="X-Large"></asp:Label>
            </td>
           </tr>
            </table>
        <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
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
                                    <asp:LinkButton ID="lnkCharts" class="tabUnSelected" runat="server">Monthly 
                                    Reports</asp:LinkButton>
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
                        DEPARTMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource8" DataTextField="name" DataValueField="id" 
                            Height="16px" >
                        </asp:DropDownList>
                        <br />
                        <br />
                        JOB NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>&nbsp;<asp:DropDownList 
                            ID="DropDownList6" runat="server" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:CheckBox ID="chkTrainer" runat="server" Text="Promote To Trainer" />
                        <br />
                        <br />
                        <b>TRAINER</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList7" runat="server" 
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
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" 
                            ForeColor="#009900" Text="Trainning Assigned"></asp:Label>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT name, id FROM jobs WHERE (department_id = @id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList8" Name="id" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT departments.name, departments.id FROM departments">
                        </asp:SqlDataSource>
                        <br />
                        <br />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
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
                                    <asp:LinkButton ID="LinkButton3" class="tabUnSelected" runat="server">Monthly Reports</asp:LinkButton>
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
                            DataSourceID="SqlDataSource5" DataTextField="first_name" DataValueField="id">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Assign Trainer</b>&nbsp;
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource3" DataTextField="first_name" 
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
                                                        Expr1</th>
                                                    <th runat="server">
                                                        status</th>
                                                    <th runat="server">
                                                        name</th>
                                                    <th runat="server">
                                                        Expr2</th>
                                                    <th runat="server">
                                                        job_id</th>
                                                    <th runat="server">
                                                        initial_experience</th>
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
                            SelectCommand="SELECT training.trainee_id, employees.first_name FROM training INNER JOIN employees ON training.trainee_id = employees.id WHERE (training.final_experience = 2) AND (training.job_id = @job_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList6" Name="job_id" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            
                            SelectCommand="SELECT DISTINCT training.trainee_id, employees.first_name FROM training INNER JOIN employees ON training.trainee_id = employees.id WHERE (training.final_experience = 2)">
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
                                    <asp:LinkButton ID="LinkButton7" class="tabSelected" runat="server">Monthly 
                                    Reports</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton8" class="tabUnSelected" runat="server">Governance Reports</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <b>Select a Date Range</b><br />
                        <br />
                        Start Date
                        <asp:TextBox ID="TextBox1" CssClass="datePicker" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Date
                        <asp:TextBox ID="TextBox2" CssClass="datePicker" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        Select Department&nbsp;
                        <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceDropDown" DataTextField="name" DataValueField="id" AppendDataBoundItems="true">
                            <asp:ListItem Text="All" Value ="-1" />
                        </asp:DropDownList>
                        <br />
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSourceTable">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="TraineeLabel" runat="server" Text='<%# Eval("Trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TrainerLabel" runat="server" Text='<%# Eval("Trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="hoursLabel" runat="server" Text='<%# Eval("hours") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFF8DC;">
                                    <td>
                                        <asp:Label ID="TraineeLabel" runat="server" Text='<%# Eval("Trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TrainerLabel" runat="server" Text='<%# Eval("Trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="hoursLabel" runat="server" Text='<%# Eval("hours") %>' />
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
                                        <asp:TextBox ID="TraineeTextBox" runat="server" Text='<%# Bind("Trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TrainerTextBox" runat="server" Text='<%# Bind("Trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="JobTextBox" runat="server" Text='<%# Bind("Job") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="hoursTextBox" runat="server" Text='<%# Bind("hours") %>' />
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
                                                        Trainee</th>
                                                    <th runat="server">
                                                        Trainer</th>
                                                    <th runat="server">
                                                        name</th>
                                                    <th runat="server">
                                                        Job</th>
                                                    <th runat="server">
                                                        date</th>
                                                    <th runat="server">
                                                        hours</th>
                                                </tr>
                                                <tr ID="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" 
                                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
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
                                        <asp:TextBox ID="TraineeTextBox" runat="server" Text='<%# Bind("Trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TrainerTextBox" runat="server" Text='<%# Bind("Trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="JobTextBox" runat="server" Text='<%# Bind("Job") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="hoursTextBox" runat="server" Text='<%# Bind("hours") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                                    <td>
                                        <asp:Label ID="TraineeLabel" runat="server" Text='<%# Eval("Trainee") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TrainerLabel" runat="server" Text='<%# Eval("Trainer") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="hoursLabel" runat="server" Text='<%# Eval("hours") %>' />
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
                        <br />
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceTable" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT Trainee.username AS Trainee, Trainer.username AS Trainer, departments.name, jobs.name AS Job, training.date, training.hours FROM jobs INNER JOIN employees AS Trainee INNER JOIN training ON Trainee.id = training.trainee_id INNER JOIN employees AS Trainer ON training.trainer_id = Trainer.id INNER JOIN departments ON training.department_id = departments.id ON jobs.id = training.job_id WHERE (training.department_id = @id) AND (training.status = @status) AND (training.date &gt;= @startdate) AND (training.date &lt;= @enddate)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList9" Name="id" 
                                    PropertyName="SelectedValue" />
                                <asp:Parameter DefaultValue="3" Name="status" />
                                <asp:ControlParameter ControlID="TextBox1" Name="startdate" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextBox2" Name="enddate" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceDropDown" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT [id], [name] FROM [departments]"></asp:SqlDataSource>
                        <br />
                        <br />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
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
                                    <asp:LinkButton ID="LinkButton11" class="tabUnSelected" runat="server">Monthly Reports</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton12" class="tabSelected" runat="server">Governance Reports</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two" runat="server" id ="content">
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        </form>
    </div>
</body>
</html>
