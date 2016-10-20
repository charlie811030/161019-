<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label labl_id = (Label)FormView1.FindControl("編號Label");
        string id = labl_id.Text;

        HttpCookie cookie = new HttpCookie("我的最愛");
        cookie.Value = id;
        cookie.Expires = DateTime.Now.AddDays(7); //我的最愛保留七天
        Response.Cookies.Add(cookie);


    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Height="51px" OnClick="Button1_Click" Text="我的愛" Width="192px" />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="編號,Expr1" DataSourceID="SqlDataSource2">
            <EditItemTemplate>
                科系:
                <asp:TextBox ID="科系TextBox" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                熱度:
                <asp:TextBox ID="熱度TextBox" runat="server" Text='<%# Bind("熱度") %>' />
                <br />
                學院:
                <asp:TextBox ID="學院TextBox" runat="server" Text='<%# Bind("學院") %>' />
                <br />
                編號:
                <asp:Label ID="編號Label1" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                系所人數:
                <asp:TextBox ID="系所人數TextBox" runat="server" Text='<%# Bind("系所人數") %>' />
                <br />
                Expr1:
                <asp:Label ID="Expr1Label1" runat="server" Text='<%# Eval("Expr1") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                科系:
                <asp:TextBox ID="科系TextBox" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                熱度:
                <asp:TextBox ID="熱度TextBox" runat="server" Text='<%# Bind("熱度") %>' />
                <br />
                學院:
                <asp:TextBox ID="學院TextBox" runat="server" Text='<%# Bind("學院") %>' />
                <br />
                編號:
                <asp:TextBox ID="編號TextBox" runat="server" Text='<%# Bind("編號") %>' />
                <br />
                系所人數:
                <asp:TextBox ID="系所人數TextBox" runat="server" Text='<%# Bind("系所人數") %>' />
                <br />
                Expr1:
                <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                科系:
                <asp:Label ID="科系Label" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                熱度:
                <asp:Label ID="熱度Label" runat="server" Text='<%# Bind("熱度") %>' />
                <br />
                學院:
                <asp:Label ID="學院Label" runat="server" Text='<%# Bind("學院") %>' />
                <br />
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                系所人數:
                <asp:Label ID="系所人數Label" runat="server" Text='<%# Bind("系所人數") %>' />
                <br />
                Expr1:
                <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT 科系所完整.*, 編號 AS Expr1 FROM 科系所完整 WHERE (編號 = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="qid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

