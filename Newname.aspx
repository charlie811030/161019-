<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string errMessage;
        int phone = Convert.ToInt32(textPhone.Text);
        //int phonenumber = 0806449;
        if(tMembership.CreateUser(textUserName.Text,textPassword.Text, phone ,out errMessage)){
            label.Text = "註冊成功!";
        }
        else
        {
            label.Text = errMessage;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    
    <style>
        .center {
            text-align:center;
            margin:0px auto;
        }
    </style>

        <h2 style="text-align:center;">註冊會員</h2>
        <p style="text-align: center"> 帳號:<asp:TextBox ID="textUserName" runat="server" Width="308px" style="text-align: center"></asp:TextBox></p>
        <p style="text-align: center">
           
            密碼:<asp:TextBox ID="textPassword" runat="server" Width="310px" style="text-align: center"></asp:TextBox>
        </p>
        <p style="text-align: center">
          
            電話 :<asp:TextBox ID="textPhone" runat="server" Width="308px" style="text-align: center"></asp:TextBox>
        </p>
        <p class="center">
           
            <asp:Button  ID="Button1" runat="server" Height="40px" OnClick="Button1_Click" Text="註冊" Width="329px" />
          
            <asp:Label ID="label" runat="server" style="text-align: center"></asp:Label>
       
                </p>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.carousel.min.css"></link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.theme.default.min.css"></link>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/owl.carousel.min.js"></script>
<div class="owl-carousel">
    <div class="item">
        <img src="/images/Login1.png" />
    </div>
    <div class="item"><img src="/images/Login2.jpg" /></div>
    <div class="item"><img src="/images/Login3.png" /></div>
    
</div>
    <script>$('.owl-carousel').owlCarousel({
    loop: true,
  
    autoplay: true,
    autoplayTimeout:500,
    margin: 10,
    nav: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 3
     
        }
    }
})</script>



</asp:Content>

