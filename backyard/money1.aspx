<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/home.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrderId,Title_Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" />
        <asp:BoundField DataField="OrderId" HeaderText="OrderId" ReadOnly="True" SortExpression="OrderId" />
        <asp:BoundField DataField="Title_Id" HeaderText="Title_Id" ReadOnly="True" SortExpression="Title_Id" />
        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" DeleteCommand="DELETE FROM [Order_Details] WHERE [OrderId] = @OrderId AND [Title_Id] = @Title_Id" InsertCommand="INSERT INTO [Order_Details] ([OrderId], [Title_Id], [Qty]) VALUES (@OrderId, @Title_Id, @Qty)" SelectCommand="SELECT * FROM [Order_Details]" UpdateCommand="UPDATE [Order_Details] SET [Qty] = @Qty WHERE [OrderId] = @OrderId AND [Title_Id] = @Title_Id">
    <DeleteParameters>
        <asp:Parameter Name="OrderId" Type="Int32" />
        <asp:Parameter Name="Title_Id" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="OrderId" Type="Int32" />
        <asp:Parameter Name="Title_Id" Type="String" />
        <asp:Parameter Name="Qty" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Qty" Type="Int32" />
        <asp:Parameter Name="OrderId" Type="Int32" />
        <asp:Parameter Name="Title_Id" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

