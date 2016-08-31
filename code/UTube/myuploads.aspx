<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="myuploads.aspx.cs" Inherits="UTube.myuploads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    My Uploads - TestTube
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="tbUploads" runat="server" CssClass="hidden"></asp:TextBox>
    <div id="seb-list">
        <center>
            <h3>My Uploads</h3>
            <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Selected="True">Name: A-Z</asp:ListItem>
                <asp:ListItem>Name: Z-A</asp:ListItem>
                <asp:ListItem>Audio</asp:ListItem>
                <asp:ListItem>Video</asp:ListItem>
                <asp:ListItem>Image</asp:ListItem>
                <asp:ListItem>Latest First</asp:ListItem>
                <asp:ListItem>Oldest First</asp:ListItem>
            </asp:DropDownList>
        </center>
    </div>
    <script>
        var data = JSON.parse($('#ContentPlaceHolder1_tbUploads').val());
        
        for (var i = 0; i < data.length; i++) {
            if (data[i].Type == "Video") {
                $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-film"></i></div><div class="rt"><a href="video.aspx?watch=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '">  ' + data[i].Name + '</a><br/>Views: <span>' + data[i].Views + '</span><br/>' + data[i].Description + '</div></div>');
            }
            else if (data[i].Type == "Image") {
                $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-image"></i></div><div class="rt"><a href="image.aspx?see=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '">  ' + data[i].Name + '</a><br/>Views: <span>' + data[i].Views + '</span><br/>' + data[i].Description + '</div></div>');
            }
            else if (data[i].Type == "Audio") {
                $('#seb-list').append('<div class="full"><div class="thmb"><i class="n2r-music"></i></div><div class="rt"><a href="audio.aspx?listen=' + data[i].Url.substring(data[i].Url.lastIndexOf("/") + 1, data[i].Url.lastIndexOf(".")) + '"> ' + data[i].Name + '</a><br/>Views: <span>' + data[i].Views + '</span><br/>' + data[i].Description + '</div></div>');
            }
        }
    </script>
</asp:Content>
