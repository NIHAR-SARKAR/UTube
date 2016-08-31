<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="UTube.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="seb-list">
        <asp:TextBox ID="tbHidden" runat="server" CssClass="hidden"></asp:TextBox>
        <center>
            <h3 id="srch">Search Result for </h3>
        </center>
        
    </div>

     <script>
         var data = JSON.parse($('#ContentPlaceHolder1_tbHidden').val());

         for (var i = 0; i < data.length; i++) {
             if (data[i].Type == "Video") {
                 $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-film"></i></div><div class="rt"><a href="video.aspx?watch=' + data[i].Path + '">  ' + data[i].upName + '</a><br/>By <a href="channel.aspx?user=' + data[i].usID + '"> <span>' + data[i].Name + '</span></a> &nbsp;&nbsp;| &nbsp;&nbsp;' + data[i].Views + '&nbsp;&nbsp; | &nbsp;&nbsp;<i class="icon n2r-clock"></i>&nbsp;&nbsp;' + data[i].Time + '<br/>' + data[i].Description + '</div></div>');
             }
             else if (data[i].Type == "Image") {
                 $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-image"></i></div><div class="rt"><a href="image.aspx?see=' + data[i].Path + '">  ' + data[i].upName + '</a><br/>By <a href="channel.aspx?user=' + data[i].usID + '"> <span>' + data[i].Name + '</span></a>&nbsp;&nbsp; |&nbsp; &nbsp;' + data[i].Views + '&nbsp;View(s)&nbsp;&nbsp; | &nbsp;&nbsp;<i class="icon n2r-clock"></i>&nbsp;&nbsp;' + data[i].Time + '<br/>' + data[i].Description + '</div></div>');
             }
             else if (data[i].Type == "Audio") {
                 $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-music"></i></div><div class="rt"><a href="audio.aspx?listen=' + data[i].Path + '"> ' + data[i].upName + '</a><br/>By <a href="channel.aspx?user=' + data[i].usID + '"> <span>' + data[i].Name + '</span></a>&nbsp;&nbsp; |&nbsp;&nbsp; ' + data[i].Views + '&nbsp;&nbsp; | &nbsp;&nbsp;<i class="icon n2r-clock"></i>&nbsp;&nbsp;' + data[i].Time + '<br/>' + data[i].Description + '</div></div>');
             }
         }
    </script>

</asp:Content>
