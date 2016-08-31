<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="UTube.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="tbHidden" runat="server" Visible="false"></asp:TextBox>

   <%-- <div id="vids"><div class="one4th"><i class="icon n2r-image"></i><br /><a href="#" class="name">the pirate </a><br/>
        by <a href="#" class="uploader">Nihar sarkar</a> &nbsp;&nbsp;| &nbsp;&nbsp;viewes<br />
        <span class="details"> demo pirate text ..demo pirate text ..demo pirate text ..demo pirate text ..</span></div></div>--%>
    <div id="vids"></div>
    <div class="clear-it"></div><hr />
    <div id="music"></div>
    <div class="clear-it"></div><hr />
    <div id="images"></div>
    <div class="clear-it"></div>

    <script>
        //$('#tbHidden')
        (function () {
            var data = JSON.parse($('#ContentPlaceHolder1_tbHidden').val());
            var vi=0, au=0, im=0;
            for (var i = 0; i < data.length; i++) {
                if (data[i].Type == "Video") {
                    vi++;
                    $('#vids').append('<div class="one4th"><i class="icon n2r-film"></i><br /><a href="video.aspx?watch=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '" class="name">' + data[i].Name + ' </a><br/> by <a href="#" class="uploader">' + data[i].Uploader + '</a> &nbsp;&nbsp;| &nbsp;&nbsp;' + data[i].Viewes + '<br /><span class="details">' + data[i].Description + '</span></div>');
                    if (vi %3 == 2)
                    { $('#vids').append('<div class="clear-it"></div>'); }
                }
                else if (data[i].Type == "Image") {
                    au++;
                    $('#music').append('<div class="one4th"><i class="icon n2r-image"></i><br /><a href="image.aspx?see=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '" class="name">' + data[i].Name + ' </a><br/> by <a href="#" class="uploader">' + data[i].Uploader + '</a> &nbsp;&nbsp;| &nbsp;&nbsp;' + data[i].Viewes + '<br /><span class="details">' + data[i].Description + '</span></div>');
                    if (au % 3 == 2)
                    { $('#vids').append('<div class="clear-it"></div>'); }
                }
                else if (data[i].Type == "Audio") {
                    im++;
                    $('#images').append('<div class="one4th"><i class="icon n2r-music"></i><br /><a href="audio.aspx?listen=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '" class="name">' + data[i].Name + ' </a><br/> by <a href="#" class="uploader">' + data[i].Uploader + '</a> &nbsp;&nbsp;| &nbsp;&nbsp;' + data[i].Viewes + '<br /><span class="details">' + data[i].Description + '</span></div>');
                    if (im % 3 == 2)
                    { $('#vids').append('<div class="clear-it"></div>'); }
                }
            }
        }());
    </script>
</asp:Content>
