$(function() {
    $('form.edit_contact, form.new_contact').on("click", ".remove_fields", function(e) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('div.field').hide();
        e.preventDefault();
    });

    $('form.edit_contact, form.new_contact').on("click", ".add_fields", function(e) {
        var time = new Date().getTime();
        var regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time));
        e.preventDefault();
    });
});



