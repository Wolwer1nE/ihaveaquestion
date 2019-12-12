function appendIncomingMessage(element, message) {
    element.append("<div class='col-4'></div>")

}
function appendOutgoingMessage(element, message) {
    console.log(data);
}

function getAuthToken() {
    return $('meta[name=csrf-token]').attr('content');
}
function sendMessage(data) {
    $.ajax({
        type: "POST",
        url: "/chat",
        data:{'body': data['body'], 'authenticity_token': getAuthToken() },
        dataType: "script",
        success: function(data) {
            appendIncomingMessage($(".chat-box"), data)}
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
});
