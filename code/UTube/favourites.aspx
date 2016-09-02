<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="favourites.aspx.cs" Inherits="UTube.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Favourites - TestTube
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:TextBox ID="tbFavourites" runat="server" CssClass="hidden"></asp:TextBox>
    <div id="seb-list">
        <center><h3>Favorites</h3></center>
    </div>
    <script>
        var data = JSON.parse($('#ContentPlaceHolder1_tbFavourites').val());

        for (var i = 0; i < data.length; i++) {
            if (data[i].Type == "Video") {
                $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-film"></i></div><div class="rt"><a href=video.aspx?watch=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '>  ' + data[i].Name + '</a><br/>By <span>' + data[i].Uploader + '</span><br/>' + data[i].Description + '</div></div>');
            }
            else if (data[i].Type == "Image") {
                $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-image"></i></div><div class="rt"><a href=image.aspx?see=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '>  ' + data[i].Name + '</a><br/>By <span>' + data[i].Uploader + '</span><br/>' + data[i].Description + '</div></div>');
            }
            else if (data[i].Type == "Audio") {
                $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-music"></i></div><div class="rt"><a href=audio.aspx?listen=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '>  ' + data[i].Name + '</a><br/>By <span>' + data[i].Uploader + '</span><br/>' + data[i].Description + '</div></div>');
            }
        }
    </script>

</asp:Content>
