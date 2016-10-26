<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">


    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e) {
        //if (e.CurrentStepIndex==0) {
        if (Wizard1.WizardSteps[e.CurrentStepIndex].Title=="訂購資訊") {
            if (chkTheSameAsShipper.Checked) { //同收貨人

                txtShipAddr.Text = txtOrderAddr.Text;
                txtShipName.Text = Label1.Text;
                txtShipPhone.Text = txtOrderPhone.Text;

                Wizard1.MoveTo(wStepFinish); //跳到[確認]
            }
        }
    }
    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e) {
        if (Wizard1.ActiveStep.Title=="確認") { //把輸入的資料顯示在Label上
            lblOrderName.Text = Label1.Text;
            lblOrderAddr.Text = txtOrderAddr.Text;
            lblOrderPhone.Text = txtOrderPhone.Text;
            lblShipName.Text = txtShipName.Text;
            lblShipAddr.Text = txtShipAddr.Text;
            lblShipPhone.Text = txtShipPhone.Text;

            DisplayCart();
        }
    }

    void DisplayCart()
    {
        List<caritem> cart;
        cart = (List<caritem>)Session["Cart"];
        GridView1.DataSource = cart;
        GridView1.DataBind();
    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e) {
        //建立Order物件
        Order orders = new Order();
        orders.Username = HttpContext.Current.User.Identity.Name;
        orders.OrderAddr = txtOrderAddr.Text;
        orders.OrderPhone = txtOrderPhone.Text;
        orders.ShipAddr = txtShipAddr.Text;
        orders.ShipPhone = txtShipPhone.Text;
        orders.CreateDate = DateTime.Now;

        List<caritem> cart;
        cart = (List<caritem>)Session["Cart"];
        Order_Details detail;
        for (int i =0; i < cart.Count; i++)
        {
            detail = new Order_Details();
            detail.Title_Id = cart[i].Title_Id;
            detail.Qty = cart[i].Quanty;
            orders.Order_Details.Add(detail);
        }


        //寫入資料庫
        系所月曆Entities db = new 系所月曆Entities();
        db.Orders.Add(orders);
        db.SaveChanges();

        //顯示訂單編號及建立時間
        lblOrderNo.Text = orders.Id.ToString();
        lblOrderCreateTime.Text = orders.CreateDate.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = HttpContext.Current.User.Identity.Name;
        //Label1.ReadOnly = true;
    }

    protected void txtOrderName_TextChanged(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" CellPadding="10" OnNextButtonClick="Wizard1_NextButtonClick" OnActiveStepChanged="Wizard1_ActiveStepChanged" OnFinishButtonClick="Wizard1_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep runat="server" title="訂購資訊">
                訂購姓名:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br />
                訂購地址:<asp:TextBox ID="txtOrderAddr" runat="server"></asp:TextBox>
                <br />
                訂購電話:<asp:TextBox ID="txtOrderPhone" runat="server"></asp:TextBox>
                <br />
                <asp:CheckBox ID="chkTheSameAsShipper" runat="server" Text="同收貨人" />
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="收貨資訊">
                收貨姓名:<asp:TextBox ID="txtShipName" runat="server"></asp:TextBox>
                <br />
                收貨地址:<asp:TextBox ID="txtShipAddr" runat="server"></asp:TextBox>
                <br />
                收貨電話:<asp:TextBox ID="txtShipPhone" runat="server"></asp:TextBox>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Finish" Title="確認" ID="wStepFinish">
                訂購姓名:<asp:Label ID="lblOrderName" runat="server"></asp:Label>
                <br />
                訂購地址:<asp:Label ID="lblOrderAddr" runat="server"></asp:Label>
                <br />
                訂購電話:<asp:Label ID="lblOrderPhone" runat="server"></asp:Label>
                <br />
                <br />
                出貨姓名:<asp:Label ID="lblShipName" runat="server"></asp:Label>
                <br />
                出貨地址:<asp:Label ID="lblShipAddr" runat="server"></asp:Label>
                <br />
                出貨電話:<asp:Label ID="lblShipPhone" runat="server"></asp:Label>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Complete" Title="完成">
                訂單編號:
                <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
                <br />
                訂單建立時間:
                <asp:Label ID="lblOrderCreateTime" runat="server"></asp:Label>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>