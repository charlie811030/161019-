<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

 
  
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="科系" DataSourceID="SqlDataSource1" RepeatColumns="5" style="margin-right: 0px">
            <ItemTemplate>
                科系:
                <asp:Label ID="科系Label" runat="server" Text='<%# Eval("科系") %>' />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("編號", "訊息.aspx/?qid={0}") %>' Text='<%# Eval("科系") %>'></asp:HyperLink>
                <br />
                學院:
                <asp:Label ID="學院Label" runat="server" Text='<%# Eval("學院") %>' />
                <br />
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                系所人數:
                <asp:Label ID="系所人數Label" runat="server" Text='<%# Eval("系所人數") %>' />
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl='<%# Eval("科系", "images/{0}.jpg") %>' Width="148px" />
<br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" RepeatColumns="5">
            <ItemTemplate>
                科系:
                <asp:Label ID="科系Label" runat="server" Text='<%# Eval("科系") %>' />
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("編號", "訊息.aspx/?qid={0}") %>' Text='<%# Eval("科系") %>'></asp:HyperLink>
                <br />
                學院:
                <asp:Label ID="學院Label" runat="server" Text='<%# Eval("學院") %>' />
                <br />
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                系所人數:
                <asp:Label ID="系所人數Label" runat="server" Text='<%# Eval("系所人數") %>' />
                <br />
                <asp:Image ID="Image3" runat="server" Height="138px" ImageUrl='<%# Eval("科系", "images/{0}.jpg") %>' Width="147px" />
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [科系所2]"></asp:SqlDataSource>
        <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4" RepeatColumns="5">
            <ItemTemplate>
                科系:
                <asp:Label ID="科系Label" runat="server" Text='<%# Eval("科系") %>' />
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("編號", "訊息.aspx/?qid={0}") %>' Text='<%# Eval("科系") %>'></asp:HyperLink>
                <br />
                學院:
                <asp:Label ID="學院Label" runat="server" Text='<%# Eval("學院") %>' />
                <br />
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                系所人數:
                <asp:Label ID="系所人數Label" runat="server" Text='<%# Eval("系所人數") %>' />
                <br />
                <asp:Image ID="Image4" runat="server" Height="176px" ImageUrl='<%# Eval("科系", "images/{0}.jpg") %>' Width="153px" />
<br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [科系所3]"></asp:SqlDataSource>
        <asp:DataList ID="DataList2" runat="server" DataKeyField="科系" DataSourceID="SqlDataSource2" RepeatColumns="5">
            <ItemTemplate>
                科系:
                <asp:Label ID="科系Label" runat="server" Text='<%# Eval("科系") %>' />
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("編號", "訊息.aspx/?qid={0}") %>' Text='<%# Eval("科系") %>'></asp:HyperLink>
                <br />
                學院:
                <asp:Label ID="學院Label" runat="server" Text='<%# Eval("學院") %>' />
                <br />
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                系所人數:
                <asp:Label ID="系所人數Label" runat="server" Text='<%# Eval("系所人數") %>' />
                <br />
                <asp:Image ID="Image2" runat="server" Height="137px" ImageUrl='<%# Eval("科系", "images/{0}.jpg") %>' Width="148px" />
<br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [科系所1]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT * FROM [科系所]"></asp:SqlDataSource>
    </form>
</asp:Content>

