<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">
    void DisyplayCar()
    {
        if (Session["Cart"] == null)
        {
            Label1.Text = "購物車中尚未有產品!";
        }
        else
        {
            List<caritem> cart;
            cart = (List<caritem>)Session["cart"];
            GridView1.DataSource = cart;  
            GridView1.DataBind();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DisyplayCar();
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Title_Id">
            <Columns>
                <asp:BoundField DataField="Title_id" HeaderText="編號" />
                <asp:BoundField DataField="price " HeaderText="價格" />
                <asp:BoundField DataField="Quanty" HeaderText="數量" />
                <asp:BoundField DataField="SubTotal" HeaderText="小計" />
                <asp:HyperLinkField DataNavigateUrlFields="編號" DataNavigateUrlFormatString="buyselldate.aspx?qid={0}" DataTextField="Calendar" Text="產品名稱" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</asp:Content>

