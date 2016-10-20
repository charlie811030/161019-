<%@ Page Title="" Language="C#" MasterPageFile="~/homee.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="熱度" HeaderText="熱度" SortExpression="熱度" />
                <asp:BoundField DataField="科系" HeaderText="科系" SortExpression="科系" />
                <asp:BoundField DataField="學院" HeaderText="學院" SortExpression="學院" />
                <asp:BoundField DataField="編號" HeaderText="編號" SortExpression="編號" />
                <asp:BoundField DataField="系所人數" HeaderText="系所人數" SortExpression="系所人數" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [科系所完整]"></asp:SqlDataSource>
    </form>
</asp:Content>

