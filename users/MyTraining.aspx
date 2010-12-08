<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MyTraining.aspx.vb" Inherits="users_mytraining" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <LINK REL=StyleSheet HREF="~/styles.css" TYPE="text/css" MEDIA=screen>
    <title>Cross Training Manager - My Training</title>
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
                                <a class="tabUnSelected" runat="server" id="managerTabView1" style="margin-left: 30px" href="manage.aspx">Manage</a>
                                <a class="tabUnSelected" href="train.aspx">Train</a> <a class="tabSelected" href="MyTraining.aspx">
                                    My Training</a>
                            </td>
                            <td width="40%" align="right">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp;<asp:LoginStatus 
                                    ID="LoginStatus1" runat="server" LogoutAction="Redirect" 
                                    LogoutPageUrl="~/Logout.aspx" />
                        </tr>
                    </table>
                </div>
                <div class="one">
                    <div class="toolbar">
                        <table width="100%" style="margin-bottom: -3px">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="lnkStatus" class="tabSelected" runat="server" Style="margin-left: 30px">Status</asp:LinkButton>
                                    <asp:LinkButton ID="lnkHistory" class="tabUnSelected" runat="server">History</asp:LinkButton>
                                    <asp:LinkButton ID="lnkRequest" class="tabUnSelected" runat="server">Request</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <asp:Label runat="server" Font-Bold="True" 
                            Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black">See My Training Status</asp:Label>
                        <br />
                        <asp:Label runat="server" ID="message" Font-Bold="True" 
                            Font-Names="Times New Roman" Font-Size="Large" ForeColor="Red" />
                        <br />
                        Department Filter
                        <asp:DropDownList ID="departments" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDepartmentst" DataTextField="name" DataValueField="id" AppendDataBoundItems="true">
                                                        <asp:ListItem Value="-1">All</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDepartmentst" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT * FROM [departments] ORDER BY name"></asp:SqlDataSource>
                        &nbsp;<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlJobs">
                            <ItemTemplate>
                                <%#GetGroup("<tr><td colspan='3' style='background-color:Red;color:White;'>{0}</td></tr>")%>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="statusLabel" runat="server" jobID='<%# Eval("id") %>' text="" />
                                    </td>
                                    <td>
                                        <asp:Button ID="requestButton" runat="server" jobID='<%# Eval("id") %>' 
                                            OnClick="requestTraining" Text="Request Training" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <%#GetGroup("<tr><td colspan='3' style='background-color:Red;color:White;'>{0}</td></tr>")%>
                                <tr style="background-color:#FFFFFF;">
                                    <td>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="statusLabel" runat="server" jobID='<%# Eval("id") %>' text="" />
                                    </td>
                                    <td>
                                        <asp:Button ID="requestButton" runat="server" jobID='<%# Eval("id") %>' 
                                            OnClick="requestTraining" Text="Request Training" />
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
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                                    <th runat="server">
                                                        Name</th>
                                                    <th>
                                                        Experience
                                                    </th>
                                                    <th>
                                                    </th>
                                                </tr>
                                                <tr ID="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                   
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlJobs" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT jobs.id, jobs.name, jobs.department_id, jobs.description, departments.name AS departmentName FROM jobs INNER JOIN departments ON jobs.department_id = departments.id WHERE (jobs.department_id = @department_id) ORDER BY departmentName, name">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="departments" Name="department_id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <FilterParameters>
                                <asp:ControlParameter ControlID="departments" Name="department" 
                                    PropertyName="SelectedValue" />
                            </FilterParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%">
                                <a class="tabUnSelected" runat="server" id="managerTabView2" style="margin-left: 30px" href="manage.aspx">Manage</a>
                                <a class="tabUnSelected" href="train.aspx">Train</a> <a class="tabSelected" href="MyTraining.aspx">
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
                                    <asp:LinkButton ID="LinkButton1" class="tabUnSelected" runat="server" Style="margin-left: 30px">Status</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" class="tabSelected" runat="server">History</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" class="tabUnSelected" runat="server">Request</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        <asp:Label ID="lblHistoryTitle" runat="server" Font-Bold="True" 
                            Font-Names="Times New Roman" Font-Size="Large" Text="Training History for "></asp:Label>
                        <br />
                        <br />
                        <asp:ListView ID="trainingHistoryListview" runat="server" DataKeyNames="id" 
                            DataSourceID="SqlTraining">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("date", "{0:MM.dd.yyyy}")%>' />
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
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFFFFF;">
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("date", "{0:MM.dd.yyyy}")%>' />
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
                                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                                    <th id="Th1" runat="server">
                                                        Date</th>
                                                    <th runat="server">
                                                        Trainer</th>
                                                    <th runat="server">
                                                        Supervisor</th>
                                                    <th runat="server">
                                                        Department</th>
                                                    <th runat="server">
                                                        Job</th>
                                                    <th runat="server">
                                                        Initial Experience</th>
                                                    <th runat="server">
                                                        Final Experience</th>
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
                        <asp:SqlDataSource ID="SqlTraining" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" 
                            SelectCommand="SELECT * FROM [training] WHERE ([trainee_id] = @trainee_id) ORDER BY [date]">
                            <SelectParameters>
                                <asp:Parameter Name="trainee_id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
            <asp:View ID="View3" runat="server">
                <div class="toolbar">
                    <table width="100%" style="margin-bottom: -3px">
                        <tr>
                            <td width="60%" class="style1">
                                <a class="tabUnSelected" runat="server" id="managerTabView3" style="margin-left: 30px" href="manage.aspx">Manage</a>
                                <a class="tabUnSelected" href="train.aspx">Train</a> <a class="tabSelected" href="MyTraining.aspx">
                                    My Training</a>
                            </td>
                            <td width="40%" align="right" class="style1">
                                <a class="link" href="MyInfo.aspx">My Info</a> &nbsp;|&nbsp; 
                                <asp:LoginStatus ID="LoginStatus3" runat="server" 
                                    LogoutPageUrl="~/Login.aspx" />
&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <div class="one">
                    <div class="toolbar">
                        <table width="100%" style="margin-bottom: -3px">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="LinkButton4" class="tabUnSelected" runat="server" Style="margin-left: 30px">Status</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton5" class="tabUnSelected" runat="server">History</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton6" class="tabSelected" runat="server">Request</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="two">
                        Request Training for <asp:label ID="name" runat="server" />
                        <br />
                        Department &nbsp; 
                        <asp:DropDownList ID="department" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDepartmentst" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <br />
                        Please select the job you would like to be trained on &nbsp;<asp:DropDownList 
                            ID="jobs" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="submitRequest" runat="server" Text="Submit Request" />
                        &nbsp;&nbsp;
                        <asp:Label ID="lblTrainingRequested" runat="server" Font-Bold="True" 
                            Font-Names="Times New Roman" Font-Size="Large" ForeColor="Red"></asp:Label>
                        </div>
                </div>
            </asp:View>
        </asp:MultiView>
        </form>
    </div>
</body>
</html>
