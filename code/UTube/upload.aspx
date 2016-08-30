<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="UTube.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Upload - TestTube
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="upload" class="">
        
        <center>
            <span class="top-heading">Upload your file and fill all description</span>
            <table id="upload-table">
                <tr>
                    <td>Select File</td>
                    <td><asp:FileUpload ID="FileUpload" runat="server" CssClass="width-3250"></asp:FileUpload></td>
                    <td>
                        <asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="FileUpload"
                                                        ErrorMessage="Only Supported formats allowed are allowed" 
                                                        ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([Pp][Nn][Gg])|.*\.([Gg][Ii][Ff])|.*\.([Mm][Pp][4])|.*\.([Ff][Ll][Vv])|.*\.([Aa][Vv][Ii])|.*\.([Mm][Kk][Vv])|.*\.([Ww][Mm][Aa])|.*\.([Mm][Pp][3])|.*\.([Oo][Gg][Gg])$)">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><asp:DropDownList ID="VideoType" runat="server" style="padding:3px 13px;">
                        <asp:ListItem Value="0" Selected="True">-Select-</asp:ListItem>
                        <asp:ListItem Value="Video">Video</asp:ListItem>
                        <asp:ListItem Value="Image">Image</asp:ListItem>
                        <asp:ListItem Value="Audio">Audio</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Upload Title</td>
                    <td><asp:TextBox ID="tbTitle" runat="server" CssClass="width-250"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <td>Tags</td>
                    <td><asp:TextBox ID="tbTags" runat="server" CssClass="width-250" TextMode="MultiLine" ToolTip="Separate tags with commas"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <td>Description</td>
                    <td><asp:TextBox ID="tbDescription" runat="server" CssClass="width-250" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Persmission</td>
                    <td>
                        <asp:DropDownList ID="ddlPermission" runat="server">
                            <asp:ListItem Value="Public" Selected="True">Public</asp:ListItem>
                            <asp:ListItem Value="Private">Private</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="tbUpload" runat="server" Text="Upload" CssClass="theme-btn-1" OnClick="tbUpload_Click"></asp:Button></td>
                </tr>

            </table>
        </center>
        </div>
     <script>
         $('input[id$="FileUpload"]').on('change', function () {

             var tempStr = $('input[id$="FileUpload"]').val();
             var x = tempStr.lastIndexOf(".");
             tempStr = tempStr.substring(x, tempStr.length).toLowerCase();
             if (tempStr == ".mp3" || tempStr == ".ogg" || tempStr == ".wma")
                 $('select[id$="VideoType"]').prop('selectedIndex', 3);
             else if (tempStr == ".flv" || tempStr == ".mp4" || tempStr == ".avi" || tempStr == ".mkv")
                 $('select[id$="VideoType"]').prop('selectedIndex', 1);
             else if (tempStr == ".jpg" || tempStr == ".png" || tempStr == ".gif" || tempStr == ".bmp")
                 $('select[id$="VideoType"]').prop('selectedIndex', 2);
             else
                 $('select[id$="VideoType"]').prop('selectedIndex', 0);
         });
    </script>
</asp:Content>
