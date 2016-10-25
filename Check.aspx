<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (Wizard1.WizardSteps[e.CurrentStepIndex].Title == "訂購資訊")
        {
            if (Wizard1.WizardSteps[e.CurrentStepIndex].Title == "訂購資訊")
            {
                if (CheckBox1.Checked)
                {
                    IblOrderName.Text = Textshipname.Text;
                    IblOrderAddr.Text = Textshipaddres.Text;
                    IblOrderPhone.Text = Textshipphone.Text;
                    Wizard1.MoveTo(wStepFinish);//跳到[確認]
                }
            }
        }
    }
    ////建立Order物件
    //   Order order = new Order();
    //   Order.Username = User.Identity.Name;
    //   order.Username = txtOrderName.Text;
    //   order.OrderAddr = txtOrderAddr.Text;
    //   order.OrderPhone = txtOrderPhone.Text;
    //   order.ShipAddr = txtShipAddr.Text;
    //   order.ShipPhone = txtShipPhone.Text;
    //   order.CreateDate = DateTime.Now;

    //   //寫入資料庫
    //   pubsEntities db = new pubsEntities();
    //   db.Orders.Add(order);
    //   db.SaveChanges();

    //   //顯示訂單編號及建立時間
    //   lblOrderNo.Text = order.Id.ToString();
    //   lblOrderCreateTime.Text = order.CreateDate.ToString();


    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        if (Wizard1.ActiveStep.Title == "確認")
        {
            Labelname.Text = IblOrderName.Text;
            Labeladdres.Text = IblOrderAddr.Text;
            Label3.Text = IblOrderPhone.Text;
            labshipname.Text = Textshipname.Text;
            Label5.Text = Textshipaddres.Text;
            Label6.Text = Textshipphone.Text;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
        <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" CellPadding="10" OnFinishButtonClick="Wizard1_FinishButtonClick" OnActiveStepChanged="Wizard1_ActiveStepChanged">
            <WizardSteps>
                <asp:WizardStep runat="server" title="訂購資訊">
                    訂購姓名<asp:TextBox ID="IblOrderName" runat="server"></asp:TextBox>
                    <br />
                    訂購地址<asp:TextBox ID="IblOrderAddr" runat="server"></asp:TextBox>
                    <br />
                    訂購電話<asp:TextBox ID="IblOrderPhone" runat="server"></asp:TextBox>
                    <br />
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="同收貨人" OnCheckedChanged="CheckBox1_CheckedChanged" />
                </asp:WizardStep>
                <asp:WizardStep runat="server" title="收貨資訊">
                    出貨姓名<asp:TextBox ID="Textshipname" runat="server"></asp:TextBox>
                    <br />
                    出貨地址<asp:TextBox ID="Textshipaddres" runat="server"></asp:TextBox>
                    <br />
                    出貨電話<asp:TextBox ID="Textshipphone" runat="server"></asp:TextBox>
                    <br />
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Finish" Title="確認" ID="wStepFinish">
                    訂購姓名<asp:Label ID="Labelname" runat="server" Text="Label"></asp:Label>
                    <br />
                    訂購地址<asp:Label ID="Labeladdres" runat="server" Text="Label"></asp:Label>
                    <br />
                    訂購電話<asp:Label ID="Label3" runat="server" Text="textphone"></asp:Label>
                    <br />
                    出貨姓名<asp:Label ID="labshipname" runat="server" Text="labshipname"></asp:Label>
                    <br />
                    出貨地址<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    <br />
                    出貨電話<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="完成">
                    訂單編號<asp:Label ID="Label7" runat="server"></asp:Label>
                    <br />
                    成立時間<asp:Label ID="Label8" runat="server"></asp:Label>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
  
</asp:Content>

