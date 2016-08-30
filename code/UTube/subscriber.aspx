<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="subscriber.aspx.cs" Inherits="UTube.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Subscriptions - TestTube
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="seb-list">
        <center><h3>Your Subscriptions</h3></center>
        <asp:TextBox ID="tbSubscribers" runat="server" CssClass="hidden"></asp:TextBox>
        
    </div>

    <script>


        
        (function () {
            var data = JSON.parse($('#ContentPlaceHolder1_tbSubscribers').val());

            for (var i = 0; i < data.length; i++) {
                $('#seb-list').append('<div class="full" temp="' + data[i].ID + '"><img src="' + data[i].ImgPath.replace("~/", "") + '" />&nbsp&nbsp&nbsp<a href="channel.aspx?rel=' + data[i].ID + '">' + data[i].Name + '</a><i class="icon n2r-cancel-circle" temp="' + data[i].ID + '"></i></div>');
            }
            
            $('#seb-list .n2r-cancel-circle').click(function () {
                var temp = $(this).attr('temp');

                $.ajax({
                    url: 'Services/StockService.asmx/RemoveSubscriber',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({usID:uID,subscriberID:temp}),
                    dataType: "json",
                    method: 'post',
                    success: function (data) {
                      
                        $('div[temp="' + temp + '"]').remove();
                    }, error: function (err) { console.log("ERROR"); }
                });

                
            });


        }())
    </script>
</asp:Content>
