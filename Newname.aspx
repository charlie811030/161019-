﻿<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string errMessage;
        if(pubsMembership.CreateUser(textUserName.Text,textPassword.Text, out errMessage)){
            label.Text = "註冊成功!";
        }
        else
        {
            label.Text = errMessage;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <h2>註冊會員</h2>
<p>帳號(學號):<asp:TextBox ID="textUserName" runat="server"></asp:TextBox></p>
  <p>密碼:(xx):<asp:TextBox ID="textPassword" runat="server">
</asp:TextBox></p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="40px" OnClick="Button1_Click" Text="註冊" Width="157px" />
            <asp:Label ID="label" runat="server"></asp:Label>
        </p>
    </form>
</asp:Content>

