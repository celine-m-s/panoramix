import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    renderVideoComponent(videoUrl) {
      // var video = $('#videoPlayer source');
      var player = videojs('#videoPlayer');
      player.pause();
      $('#videoPlayer source').attr('src', videoUrl);
      var player = videojs('#videoPlayer');
      player.load();
      player.play();
      this.set('isRead', true);
    }
  },
  classNameBindings: ['isRead'],
  // isRead: this.attr('isRead')
});
