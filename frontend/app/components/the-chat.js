import Ember from 'ember';

export default Ember.Component.extend({
  message: "",
  actions: {
    submit: function() {
      var message = this.get("message").trim();
      this.sendAction("action", message);
      this.set("message", "");
    }
  }
});
