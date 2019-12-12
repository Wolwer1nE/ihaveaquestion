import consumer from "./consumer"

function appendMessage(element, data) {
  element.append("<div class=\"media w-50 mb-3\"><img alt=\"avatar\" class=\"pic rounded-circle \" src="+data.avatar_url+
      "><div class=\"media-bodyml-3\"><div class=\"bg-light rounded py-2 px-3 mb-2\">"+
      "<p class=\"text-small mb-0 text-muted\">"+data.body+"</p>" +
      '</div><p class=\"small text-muted\">'+data.created_at+"</p></div></div>\n");
    window.scrollTo(0,document.body.scrollHeight);
}

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    appendMessage($('.chat-box'), data);
  }
});
