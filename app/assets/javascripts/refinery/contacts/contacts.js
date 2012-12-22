$(function() {
    $('#flash').css({
        'opacity': 0,
        'visibility':'visible'
    }).animate({'opacity': '1'}, 550);

    $('#flash_close').live('click', function(e) {
        try {
            $('#flash').animate({
                'opacity': 0,
                'visibility': 'hidden'
            }, 330, function() {
                $('#flash').hide();
            });
        } catch(ex) {
            $('#flash').hide();
        }
        e.preventDefault();
    });
});



