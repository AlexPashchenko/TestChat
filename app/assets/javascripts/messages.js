$(document).on('turbolinks:load', function() {
   $(document).on('ajax:success', '.save_message', function (xhr, data, status) {
        $('.messages').html(data);
       $('.textarea').val('');
    });
});