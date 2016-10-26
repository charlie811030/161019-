<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/home.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
            <asp:BoundField DataField="HashPassWord" HeaderText="HashPassWord" SortExpression="HashPassWord" />
            <asp:BoundField DataField="phonenumber" HeaderText="phonenumber" SortExpression="phonenumber" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" DeleteCommand="DELETE FROM [Members] WHERE [UserName] = @UserName" InsertCommand="INSERT INTO [Members] ([UserName], [HashPassWord], [phonenumber]) VALUES (@UserName, @HashPassWord, @phonenumber)" SelectCommand="SELECT * FROM [Members]" UpdateCommand="UPDATE [Members] SET [HashPassWord] = @HashPassWord, [phonenumber] = @phonenumber WHERE [UserName] = @UserName">
        <DeleteParameters>
            <asp:Parameter Name="UserName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="HashPassWord" Type="String" />
            <asp:Parameter Name="phonenumber" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HashPassWord" Type="String" />
            <asp:Parameter Name="phonenumber" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

