<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        string salt = BCrypt.Net.BCrypt.GenerateSalt(12);
        string hash = BCrypt.Net.BCrypt.HashPassword(TextBox1.Text, salt);
        Response.Write(string.Format("salt: {0}<br/>hash: {1}<br/>hash長度:{2}<hr/>", 
            salt, hash,hash.Length));



    }

    protected void btnVerify_Click(object sender, EventArgs e)
    {
        bool result = BCrypt.Net.BCrypt.Verify(txtPass.Text, txtHash.Text);
        //Response.Write(result ?"成功"  :"失敗");
        if (result == true)
        {
            Response.Write("成功");

        }
        else
        {
            Response.Write("失敗");
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="輸入密碼:"></asp:Label>
        <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="原密碼的hash"></asp:Label>
        <asp:TextBox ID="txtHash" runat="server"></asp:TextBox>
        <asp:Button ID="btnVerify" runat="server" Height="26px" OnClick="btnVerify_Click" Text="驗證" />
        <br />
    
    </div>
    </form>
</body>
</html>
