import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return [];
  },

  chan: null,

  activate: function() {
    var socket = new Phoenix.Socket("ws://localhost:5000/ws");
    var self = this;
    socket.join("rooms", "lobby", {}, function(chan) {
      self.chan = chan;

      chan.on("user:entered", function(message) {
        console.log("user entered: " + message.username);
      });

      chan.on("new:message", function(msg) {
        self.modelFor("index").pushObject({text: msg.content});
      });
    });
  },

  actions: {
    sendMessage: function(message) {
      if (message == "") {
        return;
      }

      var payload = {
        content: message,
      };
      this.chan.send("new:message", payload);
    }
  }
});
