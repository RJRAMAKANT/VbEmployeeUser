<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DailyWork.aspx.vb" Inherits="DailyWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid ">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="text-center p-4 text-white accordion mt-2" style="border-radius:10px;font-weight: bold; font-family: Arial Rounded MT; font-size: 20px; background-color:#193A4A;">Enter Your Work Details Here</div>


                <div class="w-100 mt-2" style="background-color: #193A4A;; color: white; font-weight: bold; border-radius: 20px;">
                    <div class="d-flex justify-content-center p-4 pb-3">
                        <table>
                            <tr>
                                <td>Employee Id</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="Text_daily_eid" Font-Bold ReadOnly runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Employee Name</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="Text_daily_ename" Font-Bold ReadOnly runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Daily Work</td>
                                <%--<td ><textarea  class="form-control" id="dailyWork_details"  style="width:100%; font-weight:bold;" id="TextArea2" cols="100" rows="5" runat="server"></textarea></td>--%>
                                <td>
                                    <asp:TextBox ID="dailyWork_details" runat="server" CssClass="form-control" TextMode="MultiLine" Font-Bold Rows="4" Columns="100"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Date</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="Text_daily_edate" Font-Bold ReadOnly runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Day</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="Text_daily_eday" Font-Bold ReadOnly runat="server"></asp:TextBox></td>
                            </tr>

                        </table>

                    </div>
                    <div class="text-center mt-2 pb-2">
                        <asp:Button runat="server" CssClass="btn btn-warning" ID="daily_work_submit" Text="Save" />
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="daily_work_submit" />
            </Triggers>
        </asp:UpdatePanel>


       
        <div style="overflow-y:scroll; height:400px;">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-border mt-2" Style="border-radius: 15px; color:white; font-weight:bold; overflow: auto; text-align: center; border-color: #01001f;" AutoGenerateColumns="False" Width="100%">
            <Columns>
                <asp:BoundField DataField="id" HeaderStyle-BackColor="#CA4C44" HeaderText="ID" />
                <asp:BoundField DataField="empname" HeaderStyle-BackColor="#CA4C44"  HeaderText="Employee Name" />
                <asp:BoundField DataField="data" HeaderStyle-BackColor="#CA4C44"   HeaderText="Date" />
                <asp:BoundField DataField="day" HeaderStyle-BackColor="#CA4C44"  HeaderText="Day" />
                <asp:BoundField DataField="work" HeaderStyle-BackColor="#CA4C44"  HeaderText="Work" />
                <asp:BoundField DataField="comment" HeaderStyle-BackColor="#CA4C44"  HeaderText="Comment" />
            </Columns>
            <HeaderStyle BackColor="#01001f" ForeColor="white" />
        </asp:GridView>
        </div>
      

       <%-- <asp:Table ID="DailyWorkTable" runat="server" CssClass="table table-hover"></asp:Table>--%>

    </div>
    

    
   
</asp:Content>

