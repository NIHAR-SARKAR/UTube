<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="image.aspx.cs" Inherits="UTube.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Image
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="js/comment.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <center>
    <asp:Image ID="theImg" runat="server" />
    </center>
    

    <div class="aud-feedback right-840">
        <div class="subscribe-uploader">
            <img src="img/sign-logo.png" class="uploader-logo" />
            <asp:Label ID="lblName" runat="server" Text="Default"></asp:Label>
        </div>
        <span class="meta-info"><i class="n2r-menu2"></i>
            <asp:Label ID="lblTime" runat="server">0 years Ago |</asp:Label>
            <i class="n2r-stats-bars"></i>
            <asp:Label ID="lblViews" runat="server">0 Viewes |</asp:Label>
            <i class="n2r-loop"></i>
            <i id="heart" class="n2r-heart like-it"></i>
            <asp:Label ID="lblLikes" runat="server">0</asp:Label>
            <asp:TextBox ID="tbPath" runat="server" CssClass="hidden"></asp:TextBox>
        </span>

        <script src="scripts/jquery-1.12.3.min.js"></script>
        <script>
            var path = $('#ContentPlaceHolder1_tbPath').val().replace("~", "");
            $('#ContentPlaceHolder1_theImg').attr("src", path);
        </script>

    </div>
    <hr />
    <div class="aud-Details">
        <asp:Label ID="lblDescription" runat="server">
                                /description area
        </asp:Label>
    </div>
    <hr />

    <div class="comment-area">
        
        <textarea id="new-comment"></textarea>
        <button id="new-comment-submit" class="theme-btn-1" type="button">Submit</button>

        <%-- for comment --%>




        <div id="comment-log">
        </div>

    </div>
    
    <script>
        document.title = document.getElementById("ContentPlaceHolder1_lblName").innerHTML;
        if (Liked == "True") {
            $('#heart').css('color', '#ff0000');
        }
    </script>
</asp:Content>
