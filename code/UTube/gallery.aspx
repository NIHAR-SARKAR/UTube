<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="UTube.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    My Gallery
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" type="text/css" href="css/demo.css" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="tbPictures" runat="server" CssClass="hidden"></asp:TextBox>
    <div id="img-gal" temp="0">

    </div>

		
		<div id="gallery-flex">
            <center><div id="gallery-frame">
                <div id="gallery-head">
                    <i class="icon n2r-image"></i>&nbsp;&nbsp; 
                    <span class="head-name"></span>

                    <i class="icon n2r-cancel-circle" id="close-it"></i>
                </div>
                <div id="main-gallery-area">
                <img src="" id="main-image" />
                    </div>
                <div id="gallery-nav">
                <i class="icon n2r-circle-left" id="go-left"></i>
                <i class="icon n2r-circle-right" id="go-right"></i>
                    </div>
            </div></center>
		</div>
		<script type="text/javascript" src="js/gallery.js"></script>
    <script>
        
    </script>
</asp:Content>
