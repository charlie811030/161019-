<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource3" RepeatColumns="5" HorizontalAlign="Center">
            <ItemTemplate>
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                科系:
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("編號", "buyselldate.aspx?qid={0}") %>' Text='<%# Eval("科系") %>'></asp:HyperLink>
                <br />
                系月曆單筆價格:
                <asp:Label ID="系月曆單筆價格Label" runat="server" Text='<%# Eval("系月曆單筆價格") %>' />
                <br />
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl='<%# Eval("編號", "images/月曆/{0}.jpg") %>' NavigateUrl='<%# Eval("編號", "buyselldate.aspx?qid={0}") %>' ImageHeight="202" ImageWidth="166"></asp:HyperLink>
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [系月曆單筆價格]"></asp:SqlDataSource>
  
</asp:Content>

