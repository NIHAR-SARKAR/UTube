<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="channel.aspx.cs" Inherits="UTube.useraccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/fonts.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=BenchNine' rel='stylesheet' type='text/css'/>

<link rel="shortcut icon" href="img/favicon.png" />

<script type="text/javascript" src="js/jquery.js"> </script>
<%--<script type="text/javascript" src="js/script.js"> </script>--%>
<title>User</title>

    <style>
        .hidden {
            display:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <div id="top-menu">
                <div id="logo">
                    <img src="img/logo.png" class="logo-top" /></div>
                <div class="top-menu">
                    <ul class="top-menu-list">
                        <<li id="upl-1"><a href="upload.aspx" ><i class="icon n2r-cloud-upload"></i> &nbsp;&nbsp;Upload</a></li>
                        <li><a href="WatchLater.aspx">Watch Later</a></li>
                        <li><a href="favourites.aspx">Favourites</a></li>
                        <li><a href="history.aspx">History</a></li>
                        <li><a href="subscriber.aspx">Subscriptions</a></li>
                        <li><a href="account.aspx">Profile</a></li>
                        <li><a href="#"><i class="n2r-bell"></i><span id="notify-number">0</span></a></li>
                        <li class="dropdown">
                            <a href="#">
                                <asp:Image ID="imhSmall" runat="server" CssClass="menu-user-img" ImageUrl="users-img/demo-user.jpg" /></a>
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
                <div id="cover">
                    <%--<img src="users-img/demo-user.jpg" id="profile-image" />--%>
                    <asp:Image ID="profile_image" runat="server" ImageUrl="users-img/demo-user.jpg" />
                </div>
                <div id="infotab">
                    <span class="infotab-links"></span>

                    <a href="#Subscribers" class="infotab-links" id="subscribersT">Subscribers</a>
                    <a href="#Images" class="infotab-links" id="imagesT">Images</a>
                    <a href="#Audio" class="infotab-links" id="audiosT">Audio</a>
                    <a href="#Video" class="infotab-links" id="videosT">Video</a>
                    
                </div>

                <div id="profile">
                    <div class="left-bar">
                        <div id="profile-status" class="left-250 gray-back round-corner">
                            <i class="n2r-pencil2 theme-color"></i>&nbsp;<span class="status"> Like, Share & Bookmark The Thread And Join The Discussion.</span>
                            <br /><asp:Button ID="addSubs" runat="server" Text="Subscribe" OnClick="addSubs_Click" />
                        </div>

                        <div id="profile-details" class="left-250 gray-back round-corner">
                            <span class="head-text"><i class="n2r-profile"></i>Personal Details</span>

                            <asp:TextBox ID="tbPersonal" runat="server" CssClass="hidden"></asp:TextBox>
                        </div>

                        <div id="recent-images" class="left-250 gray-back round-corner">
                            <span class="head-text">
                                <i class="n2r-image"></i><a href="gallery.aspx">Latest Images</a>
                            </span>
                            <br />

                            <asp:TextBox ID="tbRecentImages" runat="server" CssClass="hidden"></asp:TextBox>
                        </div>

                        <div id="recent-Videos" class="left-250 gray-back round-corner">
                            <span class="head-text"><i class="n2r-film"></i>Latest Videos</span>

                            <asp:TextBox ID="tbRecentVideos" runat="server" CssClass="hidden"></asp:TextBox>
                            <asp:TextBox ID="tbRecentAudio" runat="server" CssClass="hidden"></asp:TextBox>
                        </div>

                        <div id="subscribes" class=" left-250 gray-back round-corner">
                            <span class="head-text"><i class="n2r-command"></i><a href="subscriber.aspx">Subscribers List </a></span>
                            <br />

                            <asp:TextBox ID="tbSubscribers" runat="server" CssClass="hidden"></asp:TextBox>
                        </div>

                    </div>

                    <div class="right-bar">
                        <div class="clear-it"></div>


                        <div id="seb-list">

                            <center><h3 id="headingT"></h3></center>


                        </div>


                    </div>
                </div>
                <!--\profile -->
            </div>
            <!--\content area -->

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
    <script>
        $(document).ready(function () {
            var personal = $('#tbPersonal').val();
            personal = JSON.parse(personal);

            $('#profile-details .head-text').after('<br/><i class="n2r-menu theme-color"></i> &nbsp;<span class="dob">' + personal[0].Name + '</span><br /><i class="n2r-mail4 theme-color"></i> &nbsp;<span class="email">' + personal[0].Email + '</span><br /><i class="n2r-user-tie theme-color"></i> &nbsp;<span class="sex">' + personal[0].Sex + '</span>');

            var recImage = $('#tbRecentImages').val();
            recImage = JSON.parse(recImage);

            var t = recImage.length < 4 ? recImage.length : 4;
            for (var i = 0; i < t; i++) {
                $('#recent-images .head-text').after('<img src="' + recImage[i].Path.replace("~", "") + '" class="recent-img" />');
            }


            var recvid = $('#tbRecentVideos').val();
            recvid = JSON.parse(recvid);
            var t = recImage.length < 4 ? recImage.length : 4;
            for (var i = 0; i < recvid.length; i++) {
                $('#recent-Videos .head-text').append('<div class="vid-th"><img src="img/sign-logo.png" class="recent-vids" /><a href="video.aspx?watch=' + recvid[i].Path.replace("~", "").substring(recvid[i].Path.lastIndexOf("/"), recvid[i].Path.length) + '">' + recvid[i].Name + '</a></div>');
            }


            var subs = $('#tbSubscribers').val();
            subs = JSON.parse(subs);
            var t = recImage.length < 4 ? recImage.length : 4;
            for (var i = 0; i < subs.length; i++) {
                $('#subscribes .head-text').append('<div class="subscribe"><img src="' + subs[i].ImgPath + '" class="channel-logo" /><a href="channel.aspx?rel=' + subs[i].ID + '" class="channel-name">' + subs[i].Name + '</a></div>');
            }

            $('#videosT').click(function () {
                $('.infotab-links a').removeClass('tab-active');
                $(this).addClass('tab-active');
                $('#seb-list').html('');
                $('#seb-list').append('<center><h3 id="headingT">Latest Videos</h3></center>');
                var data = JSON.parse($('#tbRecentVideos').val());
                for (var i = 0; i < data.length; i++) {
                    $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-film"></i></div><div class="rt"><a href="video.aspx?watch=' + data[i].Path.substring(data[i].Path.lastIndexOf("/") + 1, data[i].Path.lastIndexOf(".")) + '">  ' + data[i].Name + '</a><br/>By <span>' + Name + '</span><br/>' + data[i].Description + '</div></div>');

                }
            });

            $('#imagesT').click(function () {
                $('.infotab-links a').removeClass('tab-active');
                $(this).addClass('tab-active');
                $('#seb-list').html('');
                $('#seb-list').append('<center><h3 id="headingT">Latest Images</h3></center>');
                var data = JSON.parse($('#tbRecentImages').val());
                for (var i = 0; i < data.length; i++) {
                    $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-image"></i></div><div class="rt"><a href="image.aspx?see=' + data[i].Path.substring(data[i].Path.lastIndexOf("/") + 1, data[i].Path.lastIndexOf(".")) + '">  ' + data[i].Name + '</a><br/>By <span>' + Name + '</span><br/>' + data[i].Description + '</div></div>');

                }
            });

            $('#audiosT').click(function () {
                $('.infotab-links a').removeClass('tab-active');
                $(this).addClass('tab-active');
                $('#seb-list').html('');
                $('#seb-list').append('<center><h3 id="headingT">Latest Audios</h3></center>');
                var data = JSON.parse($('#tbRecentAudio').val());
                for (var i = 0; i < data.length; i++) {
                    $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-music"></i></div><div class="rt"><a href="audio.aspx?listen=' + data[i].Path.substring(data[i].Path.lastIndexOf("/") + 1, data[i].Path.lastIndexOf(".")) + '">  ' + data[i].Name + '</a><br/>By <span>' + Name + '</span><br/>' + data[i].Description + '</div></div>');

                }
            });


            document.title = Name;
            if (subscribed == 0) {
                $('#addSubs').show();
            }
            else {
                $('#addSubs').hide();
            }

            $('#addSubs').click(function () {
                $('#addSubs').hide();
            });


        });
    </script>
</body>
</html>
