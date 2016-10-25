<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label labl_id = (Label)FormView1.FindControl("編號Label");
        string id = labl_id.Text;

        HttpCookie cookie = new HttpCookie("MyLike");
        cookie.Value = id;
        cookie.Expires = DateTime.Now.AddDays(7); //我的最愛保留七天
        Response.Cookies.Add(cookie);


    }

    protected void Button2_Click(object sender, EventArgs e)

    {
        //////取得產品採購資訊(編號,價格,數量,小計)
        //caritem item = new caritem();
        ////Label lbl = (Label)FormView1.FindControl("title_idLabel");
        ////item.Title_Id = lbl.Text;
        ////lbl = (Label)FormView1.FindControl("priceLabel");
        ////item.price = Convert.ToDecimal(lbl.Text);
        ////item.Quanty = 1;

        ////第二次PostBack時FormView不會讀取資料(因為第一次已讀取)-->FormView1.DataItem是null
        ////明確呼叫DataBind,強迫FormView再讀取資料-->FormView1.DataItem才不會null
        //FormView1.DataBind();
        //object product = FormView1.DataItem;
        //item.Title_Id = DataBinder.Eval(product, "title_id").ToString();
        //item.price = (decimal)DataBinder.Eval(product, "price");
        //item.Quanty = 2;
        //Response.Write(item.SubTotal);

        ////取得現有購物車內容(session變數紀錄)
        //List<CartItem> Cart;  // 用list比較彈性
        //if (Session["Cart"] == null)
        //{
        //    Cart = new List<CartItem>(); //建立全新的集合
        //}
        //else
        //{
        //    Cart = (List<CartItem>)Session["Cart"];

        //}
        //////購物車中已有的產品?
        //for (int i=0; i < Cart.Count; i++)
        //{
        //    if (Cart[i].Title_Id == item.Title_Id)
        //    {
        //        Cart[i].Quanty = caritem[i].Quanty + 1; //已存在數量加1
        //        exists = true;
        //    }
        //}
        //if (!exists) //新的產品
        //{
        //    Cart.Add(item); //加入購物車
        //}
        //////更新購物車(session變數紀錄)
        //Session["Cart"] = Cart;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Height="51px" OnClick="Button1_Click" Text="我的最愛" Width="192px" />
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
                <asp:Image ID="Image1" runat="server" Height="139px" ImageUrl='<%# Eval("科系", "images/{0}.jpg") %>' Width="161px" />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT 科系所完整.*, 編號 AS Expr1 FROM 科系所完整 WHERE (編號 = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="qid" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

