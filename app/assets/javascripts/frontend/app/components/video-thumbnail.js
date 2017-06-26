import Ember from 'ember';

export default Ember.Component.extend({
  // Sa seule responsabilité est de savoir s'il a été lu ou pas. Mais le controller du dessus, lui, a plus de responsabilité. Il doit savoir combien d'instances il y a sur la page et tout. Et encore au-dessus il y a la gestion de la data et de la persistence. On donne au controller une instance de model ou une collecion.
  actions: {
    renderVideoComponent(videoUrl) {
        var random = Math.floor((Math.random() * 100) + 1);
        var id = 'videoPlayer-' + random
        $('#videoContainer').children().remove();
        $('#videoContainer').append('<video id="' + id + '" class="video-js" controls preload="auto" data-setup="{}">');
        $('#' + id).append('<source src="' + videoUrl +'" type="video/mp4">');
        var player = videojs('#' + id);
        player.load();
        player.play();
        this.set('isRead', true);
    }
  },
  // Ce n'est pas au composant de persister la donnée mais au controller.
  // classNameBindings: ['isRead']
  // isRead: this.attr('isRead')
});
