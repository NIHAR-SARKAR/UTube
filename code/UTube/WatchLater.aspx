<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="WatchLater.aspx.cs" Inherits="UTube.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    TestTube - Saved Items
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="seb-list">
        <asp:TextBox ID="tbLater" runat="server" CssClass="hidden"></asp:TextBox>
        
        <center>
            <h3>Saved Items</h3>
            <asp:Button ID="btnClearHistory" runat="server" Text="Remove All" CssClass="theme-btn-1" OnClick="btnClearHistory_Click" />
        </center>
        
    </div>
     <script>
         var data = JSON.parse($('#ContentPlaceHolder1_tbLater').val());

         for (var i = 0; i < data.length; i++) {
             if (data[i].Type == "Video") {
                 $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-film"></i></div><div class="rt"><a href=video.aspx?watch=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '> ' + data[i].Name + '</a><br/>By <span>' + data[i].Uploader + '</span><br/>' + data[i].Description + '</div></div>');
             }
             else if (data[i].Type == "Image") {
                 $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-image"></i></div><div class="rt"><a href=image.aspx?see=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '> ' + data[i].Name + '</a><br/>By <span>' + data[i].Uploader + '</span><br/>' + data[i].Description + '</div></div>');
             }
             else if (data[i].Type == "Audio") {
                 $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-music"></i></div><div class="rt"><a href=audio.aspx?listen=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '> ' + data[i].Name + '</a><br/>By <span>' + data[i].Uploader + '</span><br/>' + data[i].Description + '</div></div>');
             }
         }
    </script>
</asp:Content>
