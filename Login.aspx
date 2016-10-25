<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>

<script runat="server">

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if(tMembership.VerifyUser(Login1.UserName, Login1.Password)){
            //產生驗證Cookie

            e.Authenticated = true;


        }
        else {
            e.Authenticated = false;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate"
      
         DestinationPageUrl="Default2.aspx">
        </asp:Login>
        <asp:Label ID="LblMessage" runat="server" Text="Label"></asp:Label>

</asp:Content>

