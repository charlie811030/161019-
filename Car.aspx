<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    void displaycar()
    {
        if (Session["Cart"] == null)
        {
            Labe1.Text = "購物車中尚未有產品!";
        }
        else
        {
            List<caritem> Car;
            Car = (List<caritem>)Session["Cart"];
            //Response.Write(Car[0].price); //debug
            if (Car.Count == 0)
            {
                Labe1.Text = "被你刪完了，趕快下單";
            }
            GridView1.DataSource = Car;
            GridView1.DataBind();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            displaycar();
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string tid = (string)e.Keys["Title_Id"];  // 要去GridView1的屬性設定 DataKeyNames="Title_Id" //他的主鍵是Title_Id
                                                  // Response.Write(tid); 測試用 !

        // 刪除Session購物車中對應的產品

        if (Session["Cart"] == null)
        {
            Labe1.Text = "購物車中尚未有產品!";
        }
        else
        {
            List<caritem> cart;
            cart = (List<caritem>)Session["Cart"];
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].Title_Id == tid)
                {
                    cart.RemoveAt(i);//移除這筆產品
                    break; //跳出for迴圈
                }
            }
            displaycar();
        }
    }
    decimal total = 0;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            object item = e.Row.DataItem;
            decimal subtotal = (decimal)DataBinder.Eval(item, "SubTotal");
            // Response.Write(subtotal + ",");
            total = total + subtotal;
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            //e.Row.Cells.RemoveAt(3);
            //e.Row.Cells.RemoveAt(2);
            //e.Row.Cells.RemoveAt(1);
            //e.Row.Cells.RemoveAt(0);
            //e.Row.Cells[0].ColumnSpan = 4;
            //e.Row.Cells[0].Text = "總金額:";
            //e.Row.Cells[1].Text = total.ToString();
            e.Row.Cells[3].Text = "總金額";
            e.Row.Cells[4].Text = total.ToString();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Title_Id" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" >
            <Columns>
                <asp:BoundField HeaderText="編號" DataField="Title_Id" />
                <asp:HyperLinkField DataNavigateUrlFields="Title_Id" DataNavigateUrlFormatString="buyselldate.aspx?qid={0}" DataTextField="Calendar" HeaderText="產品名稱" />
                <asp:BoundField DataField="price" HeaderText="價格" />
                <asp:BoundField DataField="Quanty" HeaderText="數量" />
                <asp:BoundField DataField="SubTotal" HeaderText="小計" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Labe1" runat="server" Text="限量要買要快!"></asp:Label>
    </form>
</asp:Content>

