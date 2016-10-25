<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        //取得產品採購資訊(編號, 價格, 數量, 小計)
        caritem item = new caritem();
        //Label lbl = (Label)FormView1.FindControl("title_idLabel");
        //item.Title_Id = lbl.Text;
        //lbl = (Label)FormView1.FindControl("priceLabel");
        //item.price = Convert.ToDecimal(lbl.Text);
        //item.Quanty = 1;

        //第二次PostBack時FormView不會讀取資料(因為第一次已讀取)-- > FormView1.DataItem是null
        //明確呼叫DataBind,強迫FormView再讀取資料-- > FormView1.DataItem才不會null
        FormView1.DataBind();
        object product = FormView1.DataItem;
        item.Title_Id = DataBinder.Eval(product, "編號").ToString();
        item.Calendar = DataBinder.Eval(product, "科系").ToString();
        item.price = Convert.ToDecimal(DataBinder.Eval(product, "系月曆單筆價格"));
        item.Quanty = 1;
        Response.Write(item.SubTotal);

        //取得現有購物車內容(session變數紀錄)
        List<caritem> Car;  // 用list比較彈性
        if (Session["Cart"] == null)
        {
            Car = new List<caritem>(); //建立全新的集合
        }
        else
        {
            Car = (List<caritem>)Session["Cart"];

        }
        //購物車中已有的產品 ?
        bool exists = false;
        for (int i = 0; i < Car.Count; i++)
        {
            if (Car[i].Title_Id == item.Title_Id)
            {
                Car[i].Quanty = Car[i].Quanty + 1; //已存在數量加1
                exists = true;
            }
        }
        if (!exists) //新的產品
        {
            Car.Add(item); //加入購物車
        }
        //更新購物車(session變數紀錄)
        Session["Cart"] = Car;
        Response.Redirect("Car.aspx");

    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="編號" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                編號:
                <asp:Label ID="編號Label1" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                科系:
                <asp:TextBox ID="科系TextBox" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                系月曆單筆價格:
                <asp:TextBox ID="系月曆單筆價格TextBox" runat="server" Text='<%# Bind("系月曆單筆價格") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                編號:
                <asp:TextBox ID="編號TextBox" runat="server" Text='<%# Bind("編號") %>' />
                <br />
                科系:
                <asp:TextBox ID="科系TextBox" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                系月曆單筆價格:
                <asp:TextBox ID="系月曆單筆價格TextBox" runat="server" Text='<%# Bind("系月曆單筆價格") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="161px" ImageUrl='<%# Eval("編號", "images/月曆/{0}.jpg") %>' />
                <br />
                編號:
                <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
                <br />
                科系:
                <asp:Label ID="科系Label" runat="server" Text='<%# Bind("科系") %>' />
                <br />
                系月曆單筆價格:
                <asp:Label ID="系月曆單筆價格Label" runat="server" Text='<%# Bind("系月曆單筆價格") %>' />
                <br />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:系所月曆ConnectionString %>" SelectCommand="SELECT 編號, 科系, 系月曆單筆價格 FROM 系月曆單筆價格 WHERE (編號 = @tid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="tid" QueryStringField="qid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Height="46px" OnClick="Button1_Click" Text="加入月曆購物車" Width="165px" />
  
</asp:Content>

