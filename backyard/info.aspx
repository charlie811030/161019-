<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView1.Visible = true;


    }

    

    protected void Page_Load(object sender, EventArgs e)
    {

    }









    protected void dsform_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null) //更新成功 //沒有例外
        {
            GridView1.DataBind(); //再次資料繫結,顯示更新結果
            FormView1.Visible = false;
        }
        else
        {
            Label2.Text = e.Exception.Message;
            e.ExceptionHandled = true;
        }
    }

    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if(e.CommandName == "Cancel")
        {
            FormView1.Visible = false;
        }
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        FormView1.Visible = false;
        GridView1.DataBind();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        FormView1.Visible = true;
        FormView1.ChangeMode(FormViewMode.Insert);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" TabIndex="5" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_SelectedIndexChanged" DataKeyNames="科系">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="編號" HeaderText="編號" SortExpression="編號" />
                <asp:BoundField DataField="科系" HeaderText="科系" SortExpression="科系" />
                <asp:BoundField DataField="活動名稱" HeaderText="活動名稱" SortExpression="活動名稱" />
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [系所活動資訊1]"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click1" />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="編號" DataSourceID="dsform" DefaultMode="Edit" OnItemCommand="FormView1_ItemCommand" OnItemInserted="FormView1_ItemInserted">
            <EditItemTemplate>
                編號:
                <asp:Label ID="編號Label1" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                科系:
                <asp:TextBox ID="科系TextBox" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                活動名稱:
                <asp:TextBox ID="活動名稱TextBox" runat="server" Text='<%# Bind("活動名稱") %>' />
                <br />
                日期:
                <asp:TextBox ID="日期TextBox" runat="server" Text='<%# Bind("日期") %>' />
                <br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="日期TextBox" ErrorMessage="只能在十月" MaximumValue="2016/10/30" MinimumValue="2016/10/01" Type="Date"></asp:RangeValidator>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                編號:
                <asp:TextBox ID="編號TextBox" runat="server" Text='<%# Bind("編號") %>' />
                <br />
                科系:
                <asp:TextBox ID="科系TextBox" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                活動名稱:
                <asp:TextBox ID="活動名稱TextBox" runat="server" Text='<%# Bind("活動名稱") %>' />
                <br />
                日期:
                <asp:TextBox ID="日期TextBox" runat="server" Text='<%# Bind("日期") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                科系:
                <asp:Label ID="科系Label" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                活動名稱:
                <asp:Label ID="活動名稱Label" runat="server" Text='<%# Bind("活動名稱") %>' />
                <br />
                日期:
                <asp:Label ID="日期Label" runat="server" Text='<%# Bind("日期") %>' />
                <br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="dsform" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" DeleteCommand="DELETE FROM [系所活動資訊1] WHERE [編號] = @編號" InsertCommand="INSERT INTO [系所活動資訊1] ([編號], [科系], [活動名稱], [日期]) VALUES (@編號, @科系, @活動名稱, @日期)" SelectCommand="SELECT * FROM [系所活動資訊1] WHERE ([科系] = @科系)" UpdateCommand="UPDATE [系所活動資訊1] SET [科系] = @科系, [活動名稱] = @活動名稱, [日期] = @日期 WHERE [編號] = @編號" OnUpdated="dsform_Updated">
            <DeleteParameters>
                <asp:Parameter Name="編號" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="編號" Type="String" />
                <asp:Parameter Name="科系" Type="String" />
                <asp:Parameter Name="活動名稱" Type="String" />
                <asp:Parameter Name="日期" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="科系" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="科系" Type="String" />
                <asp:Parameter Name="活動名稱" Type="String" />
                <asp:Parameter Name="日期" Type="String" />
                <asp:Parameter Name="編號" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    

</asp:Content>

