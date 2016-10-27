<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" %>


<script runat="server">


    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)

    {

        if (tMembership.VerifyUser(Login1.UserName, Login1.Password))
        {
            //產生驗證Cookie


            e.Authenticated = true;
            if (User.Identity.Name == "charliewu")
            {
                Response.Redirect("~/backyard/info.aspx");
            }



        }
        else
        {
            e.Authenticated = false;
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="float: left;"> 
            <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate"
                DestinationPageUrl="Default2.aspx" Height="426px" Width="295px" Style="text-align: center">
            </asp:Login>
            <asp:Label ID="LblMessage" runat="server"></asp:Label>
        </div>
        <div id="iframe-wrap" style="float: left; width: 700px;">  
            <iframe id="iframe" src="./JS做的焦点轮播图_files/jsJdt20161010.html" frameborder="0" width="100%" height="640px"></iframe>   
        </div>

    </div>



<%--
    <div id="owl-example" class="owl-carousel">
        <div style="background-image: url(images/95499.jpg); width: 200px; border-right: dashed red 5px; height: 200px;"></div>

        <div style="background-image: url(images/pic01.jpg); width: 200px; border-right: dashed red 5px; height: 200px;"></div>
        <div style="background-image: url(images/pic02s.jpg); width: 200px; border-right: dashed red 5px; height: 200px;"></div>
    </div>



    <!-- Important Owl stylesheet -->
    <link rel="stylesheet" href="owl-carousel/owl.carousel.css">

    <!-- Default Theme -->
    <link rel="stylesheet" href="owl-carousel/owl.theme.css">

    <!--  jQuery 1.7+  -->
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <!-- Include js plugin -->
    <script src="owl-carousel/owl.carousel.js"></script>
    <script>
        $("#owl-example").owlCarousel({
            //items: 2,
            //itemsDesktop: [1199, 2],
            //itemsDesktopSmall: [979, 2],
            //itemsTablet: [768, 1],
            autoPlay: 3000,
            autoHeight: true,
            singleItem: true,
            transitionStyle: "fade"
        });
    </script>
--%>



    <script type="text/javascript">
        $(document).ready(function () {
            $(".fdr").click(function () {
                $(".fdad").hide();
            });
        });
    </script>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?b3a3fc356d0af38b811a0ef8d50716b8";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <script type="text/javascript">

        var theme_list_open = false;

        $(document).ready(function () {
            function fixHeight() {
                var headerHeight = $("#switcher").height();
                $("#iframe").attr("height", $(window).height() - 54 + "px");
            }
            $(window).resize(function () {
                fixHeight();
            }).resize();

            $('.icon-monitor').addClass('active');

            $(".icon-mobile-3").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width-3');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-mobile-2").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width-2');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-mobile-1").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width');
                $('.icon-tablet,.icon-mobile,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-tablet").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('tablet-width');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-monitor").click(function () {
                $("#by").css("overflow-y", "hidden");
                $('#iframe-wrap').removeClass().addClass('full-width');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });
        });
    </script>
    <script type="text/javascript">
        function Responsive($a) {
            if ($a == true) $("#Device").css("opacity", "100");
            if ($a == false) $("#Device").css("opacity", "0");
            $('#iframe-wrap').removeClass().addClass('full-width');
            $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
            $(this).addClass('active');
            return false;
        };
    </script>
</asp:Content>

