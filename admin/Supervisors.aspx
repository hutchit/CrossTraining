<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Supervisors.aspx.vb" Inherits="users_mytraining" %>

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
                            <td width="60%">
                                <a class="tabUnSelected" style="margin-left: 30px" href="Departments.aspx">Departments</a>
                                <a class="tabSelected" href="Employees.aspx">Employees</a> <a class="tabUnSelected" href="Jobs.aspx">
                                 Jobs</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#666666">Supervisors</asp:LinkButton>
                            </td>
                            <td width="40%" align="right">
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
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#999999" 
                            Text="Supervisor"></asp:Label>
                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="first_name" DataValueField="id" 
                            Height="16px" Width="152px">
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
                        <br />
                        &nbsp;<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" 
                            InsertItemPosition="FirstItem">
                            <ItemTemplate>
                                <tr style="background-color:#DCDCDC;color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
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
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color:#FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
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
                                                    </th>
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
                            DeleteCommand="DELETE FROM supervisee_supervisor WHERE (supervisee_id = @supervisee_id)" 
                            InsertCommand="INSERT INTO supervisee_supervisor(supervisee_id, supervisor_id) VALUES (@supervisee_id, @supervisor_id)

" 
                            SelectCommand=" SELECT [supervisor_id] FROM [supervisee_supervisor] WHERE (([supervisee_id] =@id) AND ([supervisor_id] = @id))" 
                            
                            UpdateCommand="UPDATE supervisee_supervisor SET supervisee_id = @supervisee_id, supervisor_id = @supervisor_id">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="id" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="supervisee_id" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="supervisee_id" />
                                <asp:Parameter Name="supervisor_id" />
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
