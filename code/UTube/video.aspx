<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="video.aspx.cs" Inherits="UTube.video" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/fonts.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=BenchNine' rel='stylesheet' type='text/css'/>
<title>Dynamic title</title>

    <style> .hidden { display:none; } </style>

<link rel="shortcut icon" href="img/favicon.png" />

<script type="text/javascript" src="js/jquery.js"> </script>

<script type="text/javascript">
	
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <div id="top-menu">
                <div id="logo">
                    <img src="img/logo.png" class="logo-top" /></div>
                <div class="top-menu">
                    <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    <ul class="top-menu-list">
                        <li id="upl-1"><a href="upload.aspx"><i class="icon n2r-cloud-upload"></i>&nbsp;&nbsp;Upload</a></li>
                        <li><a href="WatchLater.aspx">Saved</a></li>
                        <li><a href="favourites.aspx">Favourites</a></li>
                        <li><a href="history.aspx">History</a></li>
                        <li><a href="subscriber.aspx">Subscriptions</a></li>
                        <li><a href="account.aspx">Profile</a></li>
                        <li><a href="#"><i class="n2r-bell"></i><span id="notify-number">0</span></a></li>
                        <li class="dropdown"><a href="#">
                            <asp:Image ID="imhSmall" runat="server" CssClass="menu-user-img" ImageUrl="users-img/demo-user.jpg" />
                        </a>
                            <ul>
                                <li><a href="account.aspx"><i class="n2r-user-tie"></i>&nbsp;Account</a></li>
                                <li><a href="myuploads.aspx"><i class="icon n2r-cloud-upload"></i>&nbsp;Uploads</a></li>
                                <li><a href="settings.aspx"><i class="n2r-wrench"></i>&nbsp; Settings</a></li>
                                <li><a href="Redirect.aspx"><i class="n2r-reply"></i>&nbsp; Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!--\top menu-->

            <div id="content-area">
                <div id="slider" style="background-color: #aaa; height: 200px;">
                </div>
                <asp:TextBox ID="tbPath" runat="server" CssClass="hidden"></asp:TextBox>

                <div id="profile">
                    <div class="left-bar">
                        <div id="recent-Videos" class="left-250 gray-back round-corner">
                            <asp:TextBox ID="tbVideos" runat="server" CssClass="hidden"></asp:TextBox>

                            <span class="head-text"><i class="n2r-film"></i>Related Videos</span><br />
                           
                           
                            
                           
                            
                            


                        </div>

                        <div id="subscribes" class=" left-250 gray-back round-corner">
                            <span class="head-text"><i class="n2r-command"></i><a href="subscriber.aspx">Subscribers List</a></span><br />
                            <asp:TextBox ID="tbSubscribers" runat="server" CssClass="hidden"></asp:TextBox>
                        </div>

                    </div>
                    <div class="right-bar">
                        <div class="right-840">
                            <div id="vid-play">
                                <h3>Test Video heading</h3>
                                <video id="player" height="250px" width="550px" autoplay="autoplay" controls></video>

                                <script>
                                    var path = $('#tbPath').val().replace("~", "");
                                    $('#player').attr("src", path);
                                </script>
                            </div>
                            <div class="vid-feedback right-840">
                                <div class="subscribe-uploader">
                                    <img src="img/sign-logo.png" class="uploader-logo" />
                                    <asp:Label ID="lblName" runat="server" Text="Default"></asp:Label>
                                </div>
                                <span class="meta-info"><i class="n2r-menu2"></i>
                                    <asp:Label ID="lblTime" runat="server">0 years Ago |</asp:Label>
                                    <i class="n2r-stats-bars"></i>
                                    <asp:Label ID="lblViews" runat="server">0 Viewes |</asp:Label>
                                    <i class="n2r-folder-plus"></i>
                                    <asp:Label ID="lblWatch" runat="server" Text="Save"></asp:Label>
                                    |<i id="heart"  class="n2r-heart like-it"></i>
                                    <asp:Label ID="lblLikes" runat="server">0</asp:Label>
                                </span>
                            </div>
                            <hr />
                            <div class="vid-Details">
                                <asp:Label ID="lblDescription" runat="server">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce odio ipsum, feugiat sit amet volutpat ut, vulputate quis sapien. Nullam vitae lacus tortor. Quisque maximus, nibh vel dapibus posuere, ipsum metus pharetra dui, vitae vulputate sapien metus id enim. Maecenas ex quam, accumsan ac dapibus nec, consectetur vel enim. Sed a luctus nisl. Curabitur sem velit, aliquet ac porttitor id, fringilla at tortor. Mauris ornare gravida quam id dignissim. Sed tincidunt erat sit amet nulla consequat, vulputate facilisis ex porta. Nulla quis arcu quis lectus molestie porta vel sit amet orci. Quisque viverra nec metus id luctus. Mauris ac tincidunt ex. Aliquam erat volutpat.
                                </asp:Label>
                            </div>
                            <hr />

                            <div class="comment-area">
                                <asp:TextBox ID="tbComments" runat="server" CssClass="hidden"></asp:TextBox>
                                <textarea id="new-comment"></textarea>
                                <button id="new-comment-submit" class="theme-btn-1" type="button">Submit</button>

                                <%-- for comment --%>




                                <div id="comment-log">
                                </div>

                            </div>
                            <!----------/comment area-------------->




                        </div>





                    </div>
                </div>
                <!--\profile -->
            </div>
            <!--\content area -->
            <div class="clear-it"></div>
            <div id="foot">
                <div id="foot-top">
                    <img src="img/logo.png" class="logo-foot" />
                    <a href="#" class="footer-link">About</a>
                    <a href="#" class="footer-link">Copyright</a>
                    <a href="#" class="footer-link">Creators</a>
                    <a href="#" class="footer-link">Developers</a>

                </div>
                <div id="copyright">2016 &copy; N2RSOLUTIONS | Project TESTTUBE</div>
            </div>
            <!--\foot -->

        </div>
    </form>

    <script src="scripts/jquery-1.12.3.min.js"></script>
    <script>
        $(document).ready(function () {
            var subs = $('#tbSubscribers').val();
            subs = JSON.parse(subs);
            for (var i = 0; i < subs.length; i++) {
                $('#subscribes .head-text').append('<div class="subscribe"><img src="' + subs[i].ImgPath + '" class="channel-logo" /><a href="' + subs[i].Path + '" class="channel-name">' + subs[i].Name + '</a></div>');
            }

            var jsonx = JSON.parse($('#tbVideos').val());
            for (var i = 0; i < jsonx.length; i++) {
                var temp = '<div class="related-vid-thread"><a class="vid-link" href="video.aspx?watch=' + jsonx[i].Path + '">' + jsonx[i].upName + '</a>';
                temp += '<img class="vid-thumb" src="img/background2.png" />By <a href="channel.aspx?rel=' + jsonx[i].usID + '">' + jsonx[i].Name + '</a><br/>';
                temp += 'viewe(s) : ' + jsonx[i].Views + '&nbsp; | &nbsp; ' + jsonx[i].Time + '</div><hr />';
                $('#recent-Videos').append(temp);
            }


            //tbVideos
        });
        document.title = document.getElementById("lblName").innerHTML;

        if (Liked == "True") {
            $('#heart').css('color', '#ff0000');
        }

    </script>
    <script type="text/javascript" src="js/comment.js"> </script>
</body>
</html>