import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    renderVideoComponent(videoUrl) {
      var video = $('#videoPlayer source');
      $(video).pause();
      $(video).attr('src', videoUrl);
      $(video).load();
      $(video).play();
      this.set('isRead', true);
    }
  },
  classNameBindings: ['isRead'],
  isRead: false
});
