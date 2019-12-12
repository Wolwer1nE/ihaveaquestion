import consumer from "../channels/consumer"

function getAuthToken() {
    return $('meta[name=csrf-token]').attr('content');
}
function sendMessage(data) {
    $.ajax({
        type: "POST",
        url: "/chat",
        data:{'body': data.body, 'authenticity_token': getAuthToken() },
        dataType: "script"
    });
}
$(document).ready(function() {
    $('#message-form').submit( function (e) {
        const data = $('#message-form').serializeArray().reduce(function(obj, item) {
            obj[item.name] = item.value;
            return obj;
        }, {});
        sendMessage(data);
        e.preventDefault(e);
        return false;
    });
    consumer.subscriptions.create({ channel: "ChatChannel", room: "BaseRoom" })

});
