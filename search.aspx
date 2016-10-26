<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label1.Text = string.Format("查詢到 {0} 筆資料.", e.AffectedRows);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
        關鍵字:<asp:TextBox ID="TextBox1" runat="server" Height="25px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" Width="31px" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="編號" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="編號" HeaderText="編號" ReadOnly="True" SortExpression="編號" />
                <asp:HyperLinkField DataNavigateUrlFields="編號" DataNavigateUrlFormatString="buyselldate.aspx?qid={0}" DataTextField="科系" HeaderText="科系" />
                <asp:BoundField DataField="系月曆單筆價格" HeaderText="系月曆單筆價格" SortExpression="系月曆單筆價格" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [系月曆單筆價格] WHERE ([科系] LIKE '%' + @科系 + '%')" OnSelected="SqlDataSource1_Selected">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="科系" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>

</asp:Content>

