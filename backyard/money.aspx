<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/home.master" %>

<script runat="server">

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
            <asp:BoundField DataField="OrderAddr" HeaderText="OrderAddr" SortExpression="OrderAddr" />
            <asp:BoundField DataField="OrderPhone" HeaderText="OrderPhone" SortExpression="OrderPhone" />
            <asp:BoundField DataField="ShipAddr" HeaderText="ShipAddr" SortExpression="ShipAddr" />
            <asp:BoundField DataField="ShipPhone" HeaderText="ShipPhone" SortExpression="ShipPhone" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Orders] ([Username], [CreateDate], [OrderAddr], [OrderPhone], [ShipAddr], [ShipPhone]) VALUES (@Username, @CreateDate, @OrderAddr, @OrderPhone, @ShipAddr, @ShipPhone)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [Username] = @Username, [CreateDate] = @CreateDate, [OrderAddr] = @OrderAddr, [OrderPhone] = @OrderPhone, [ShipAddr] = @ShipAddr, [ShipPhone] = @ShipPhone WHERE [Id] = @Id" OnSelecting="SqlDataSource1_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="CreateDate" Type="DateTime" />
            <asp:Parameter Name="OrderAddr" Type="String" />
            <asp:Parameter Name="OrderPhone" Type="String" />
            <asp:Parameter Name="ShipAddr" Type="String" />
            <asp:Parameter Name="ShipPhone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="CreateDate" Type="DateTime" />
            <asp:Parameter Name="OrderAddr" Type="String" />
            <asp:Parameter Name="OrderPhone" Type="String" />
            <asp:Parameter Name="ShipAddr" Type="String" />
            <asp:Parameter Name="ShipPhone" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

