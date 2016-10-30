$(function() {
    console.log('READY!');
    $('#new_message').on('ajax:success', function (xhr, data, status) {
        $('#messages').prepend('<div><div><p>' + message + '</p></div></div>');
        $('#message_text').val('');
    });
});

