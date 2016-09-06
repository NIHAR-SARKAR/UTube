var idx = 0;
var data = JSON.parse($('#ContentPlaceHolder1_tbPictures').val());
(function () {
 



    for (var i = 0; i < data.length; i++) {
        $('#img-gal').append('<div class="img-4" ><img src="' + data[i].Path.replace("~/", "") + '" temp="' + i + '"/><span>' + data[i].Name + '</span></div>');
        if (i % 4 == 3)
        { $('#img-gal').append('<br/>'); }
    }

    $('.img-4 img').click(function () {

        idx = $(this).attr('temp');
        $('#main-image').attr('src', data[idx].Path.replace("~/", ""));
        $('#gallery-head .head-name').text('   ' + data[idx].Name + '');
        $('#gallery-flex').fadeIn(500);
        stopscroll();
    });
    $('#close-it').click(function () {
        $('#gallery-flex').fadeOut(500);
    });

    $('#go-right').click(function () {
        if (idx < data.length - 1) {
            idx++;
            $('#main-image').attr('src', data[idx].Path.replace("~/", ""));
            $('#gallery-head .head-name').text('   ' + data[idx].Name + '');
            
        }

        else if (idx == data.length - 1) {
            idx = 0;
            $('#main-image').attr('src', data[idx].Path.replace("~/", ""));
            $('#gallery-head .head-name').text('   ' + data[idx].Name + '');
            
        }

    });

    $('#go-left').click(function () {
        if (idx > 0) {
            idx--;
            $('#main-image').attr('src', data[idx].Path.replace("~/", ""));
            $('#gallery-head .head-name').text('   ' + data[idx].Name + '');
           
        }
        else if (idx == 0) {
            idx = data.length - 1;
            $('#main-image').attr('src', data[idx].Path.replace("~/", ""));
            $('#gallery-head .head-name').text('   ' + data[idx].Name + '');
            
        }
    });

    function stopscroll() {
        
    }
    if (window.innerHeight < 640) {
        $('#gallery-flex').css('position', 'absolute');
    }
}());