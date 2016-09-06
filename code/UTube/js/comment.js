/// <reference path="../scripts/jquery-1.12.3.min.js" />

$(document).ready(function () {

    $.ajax({
        url: 'Services/StockService.asmx/GetComments',
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({ upID: upID }),
        dataType: "json",
        method: 'post',
        success: function (data) {
            for (var i = 0; i < data.d.length; i++) {
                var comment = '<div class="comment-thread" cid="' + data.d[i].ID + '" uid="' + data.d[i].User + '"><div class="comment-photo"><img class="avatar" src="' + data.d[i].Img + '" />';
                comment += '</div><div class="comment-line"><a class="user-name" href="#">' + data.d[i].Name + '</a> <span class="time">' + data.d[i].Time + '</span>';
                if (data.d[i].User == uID) {
                    comment += '<i class="n2r-bin remove-comment" cid="' + data.d[i].ID + '"></i>';
                }
                comment += '<br /><span class="comment-text">' + data.d[i].Comment + '</span> <hr /></div></div>';
                $('#comment-log').append(comment);
            }

            deleteAjax();
        }, error: function (err) { console.log("ERROR"); }
    });

    $('#new-comment-submit').click(function () {
        if ($('#new-comment').val() != "") {
            $.ajax({
                url: 'Services/StockService.asmx/AddComment',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ usID: uID, upID: upID, comment: $('#new-comment').val() }),
                dataType: "json",
                method: 'post',
                success: function (data) {
                    var comment = '<div class="comment-thread" cid="' + data.d + '" uid="' + uID + '" ><div class="comment-photo">';
                    comment += '<img class="avatar" src="' + Img + '" /></div><div class="comment-line"><a class="user-name" href="#">' + Name + '</a><span class="time">a moment ago</span> <i class="n2r-bin remove-comment" cid="' + data.d + '"></i>';
                    comment += '<br /><span class="comment-text">' + $('#new-comment').val() + '</span> <hr /></div></div>';
                    $('#comment-log').prepend(comment).fadeIn(500);
                    $('#new-comment').val('');
                    deleteAjax();
                }, error: function (err) { console.log("ERROR"); }
            });
        }
    });

    $('.meta-info .like-it').click(function () {
        $.ajax({
            url: 'Services/StockService.asmx/AddLike',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ usID: uID, upID: upID }),
            dataType: "json",
            method: 'post',
            success: function (data) {
                
                if (Liked == "False") {
                    var count = parseInt($('#lblLikes,#ContentPlaceHolder1_lblLikes').text()) + 1;
                    Liked = "True"; $('.meta-info .like-it').css('color', '#ff0000');
                }
                else if (Liked == "True") {
                    var count = parseInt($('#lblLikes,#ContentPlaceHolder1_lblLikes').text()) - 1; Liked = "False";
                    $('.meta-info .like-it').css('color', '#227799');
                }
                //var count = parseInt($('#lblLikes').text()) + 1;
                $('#lblLikes,#ContentPlaceHolder1_lblLikes').text(count);
            }, error: function (err) { console.log("ERROR"); }
        });
    });

    $('#lblWatch').click(function () {
        $.ajax({
            url: 'Services/StockService.asmx/WatchLater',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ usID: uID, upID: upID }),
            dataType: "json",
            method: 'post',
            success: function (data) {
                console.log(typeof (data.d) + " " + data.d);
                //if (data.d.toString() == 'true')
                //    console.log('Added to Saved List');
                //else
                //    console.log('Removed from Saved List');
            }, error: function (err) { console.log("ERROR"); }
        });
    });

    function deleteAjax() {
        $('.remove-comment').click(function () {
            var cattr = $(this).attr('cid');
            $.ajax({
                url: 'Services/StockService.asmx/DelComment',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ cmID: cattr }),
                dataType: "json",
                method: 'post',
                success: function (data) {
                    $('div[cid="' + cattr + '"]').fadeOut(800);
                }, error: function (err) { console.log(" ERROR !!"); }
            });
        });
    }
    //n2r-box-remove .user-name
});