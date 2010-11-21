<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Train.aspx.vb" Inherits="users_train" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <link type="text/css" href="jquery-ui-1.8.6.custom.css" rel="stylesheet" />

     <script src="jquery-1.4.2.min.js" type="text/javascript"></script>

     <script src="jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>

    <SCRIPT type="text/javascript">

        $(function() {

                $(".datePicker").datepicker();

        });   

       </SCRIPT>

    <LINK REL=StyleSheet HREF="~\styles.css" TYPE="text/css" MEDIA=screen>
    <title>Cross Training Manager - Train</title>
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
                                <a class="tabUnSelected" style="margin-left: 30px" href="Manage.aspx">Manage</a>
                                <a class="tabSelected" href="Train.aspx">Train</a> <a class="tabUnSelected" href="MyTraining.aspx">
                                    My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp; 
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
                                    <!--Navigation controls if needed-->
<asp:LinkButton ID="lnkComplete" class="tabSelected" runat="server" style="margin-left:30px">Complete Training</asp:LinkButton>
<asp:LinkButton ID="lnkHistory" class="tabUnSelected" runat="server">Training History</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                    <asp:Label runat="server" ID="message" Font-Bold="True" 
                            Font-Names="Times New Roman" Font-Size="Large" ForeColor="Red" />
                        <asp:ListView ID="ListViewTrain" runat="server" DataKeyNames="id" 
                            DataSourceID="SqlTraining">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="trainee_idLabel" runat="server" 
                                            Text='<%# Eval("trainee_id") %>' />
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
                                        <asp:dropdownlist ID="hoursdropdown" trainingID='<%# Eval("id") %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:textbox ID="datetextbox" style="width: 100px;" CssClass="datePicker" trainingID='<%# Eval("id") %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Button ID="completeTraining" trainingID='<%# Eval("id") %>' OnClick="completeTraining" runat="server" Text="Complete" />
                                    </td>
                                    <td>
                                        <asp:Button ID="rejectTraining" OnClick="rejectTraining" trainingID='<%# Eval("id") %>' runat="server" Text="Reject" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFFFFF;">
                                    <td>
                                        <asp:Label ID="trainee_idLabel" runat="server" 
                                            Text='<%# Eval("trainee_id") %>' />
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
                                        <asp:dropdownlist ID="hoursdropdown" trainingID='<%# Eval("id") %>' runat="server" />
                                    </td>
                                    <td>
                                         <asp:textbox ID="datetextbox" style="width: 100px;" CssClass="datePicker" trainingID='<%# Eval("id") %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Button ID="completeTraining" trainingID='<%# Eval("id") %>' OnClick="completeTraining" runat="server" Text="Complete" />
                                    </td>
                                    <td>
                                        <asp:Button ID="rejectTraining" trainingID='<%# Eval("id") %>' OnClick="rejectTraining" runat="server" Text="Reject" />
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
                                                <tr id="Tr1" runat="server" style="background-color:#DCDCDC;color: #000000;">
                                                    <th id="Th1" runat="server"></th>
                                                    <th id="Th2" runat="server"></th>
                                                    <th id="Th3" runat="server"></th>
                                                    <th id="Th4" runat="server"></th>
                                                    <th id="Th5" colspan="2" runat="server">
                                                        Experience</th>
                                                    <th id="Th7" runat="server"></th>
                                                    <th id="Th8" runat="server"></th>
                                                    <th id="Th9" runat="server"></th>
                                                    <th id="Th10" runat="server"></th>
                                                    <th id="Th11" runat="server"></th>
                                                </tr>
                                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                                    <th runat="server">
                                                        Trainee</th>
                                                    <th runat="server">
                                                        Supervisor</th>
                                                    <th runat="server">
                                                        Department</th>
                                                    <th runat="server">
                                                        Job</th>
                                                    <th runat="server">
                                                        Initial</th>
                                                    <th runat="server">
                                                        Final</th>
                                                    <th runat="server">
                                                        Status</th>
                                                    <th runat="server">
                                                        Hours</th>
                                                    <th runat="server">
                                                        Date</th>
                                                    <th id="Th6" runat="server"></th>
                                                    <th id="Th12" runat="server"></th>
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
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
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
                        <asp:SqlDataSource ID="SqlTraining" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT * FROM [training] WHERE ([trainer_id] = @trainer_id) AND ([status] = 2) ORDER BY trainee_id">
                            <SelectParameters>
                                <asp:Parameter Name="trainer_id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%">
                                <a class="tabUnSelected" style="margin-left: 30px" href="Manage.aspx">Manage</a>
                                <a class="tabSelected" href="Train.aspx">Train</a> <a class="tabUnSelected" href="MyTraining.aspx">
                                    My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp; 
                                <asp:LoginStatus ID="LoginStatus2" runat="server" LogoutAction="Redirect" 
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
                                    <!--Navigation controls if needed-->
<asp:LinkButton ID="LinkButton1" class="tabUnSelected" runat="server" style="margin-left:30px">Complete Training</asp:LinkButton>
<asp:LinkButton ID="LinkButton2" class="tabSelected" runat="server" >Training History</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <asp:Label ID = "historyLabel" runat="server" Font-Bold="True" Font-Size="18px" Font-Names="Times New Roman" />
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
                            DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:MM.dd.yyyy}")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainee_idLabel" runat="server" 
                                            Text='<%# Eval("trainee_id") %>' />
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
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFFFFF;">
                                    <td>
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:MM.dd.yyyy}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="trainee_idLabel" runat="server" 
                                            Text='<%# Eval("trainee_id") %>' />
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
                                                <tr id="Tr2" runat="server" style="background-color:#DCDCDC;color: #000000;">
                                                    <th id="Th13" runat="server"></th>
                                                    <th id="Th14" runat="server"></th>
                                                    <th id="Th15" runat="server"></th>
                                                    <th id="Th16" runat="server"></th>
                                                    <th id="Th17" runat="server"></th>
                                                    <th id="Th18" colspan="2" runat="server">
                                                        Experience</th>
                                                    <th id="Th20" runat="server"></th>
                                                    <th id="Th21" runat="server"></th>
                                                </tr>
                                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                                    <th runat="server">
                                                        Date</th>
                                                    <th runat="server">
                                                        Trainee</th>
                                                    <th runat="server">
                                                        Supervisor</th>
                                                    <th runat="server">
                                                        Department</th>
                                                    <th runat="server">
                                                        Job</th>
                                                    <th runat="server">
                                                        Initial</th>
                                                    <th runat="server">
                                                        Final</th>
                                                    <th runat="server">
                                                        Status</th>
                                                    <th runat="server">
                                                        Hours</th>
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
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT * FROM [training] WHERE ([trainer_id] = @trainer_id) AND (([status] = 3) or ([status] = 0)) ORDER BY date">
                            <SelectParameters>
                                <asp:Parameter Name="trainer_id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        </form>
    </div>
</body>
</html>
