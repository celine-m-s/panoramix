/* eslint-env node */
const EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    // Add options here
    sassOptions: {
      includePaths: [
        'bower_components'
      ]
    }
  });
  app.import('bower_components/uikit/dist/js/uikit.min.js');
  app.import('bower_components/uikit/dist/js/uikit-icons.min.js');
  app.import('bower_components/videojs/src/js/video.js');

  app.import('bower_components/videojs/src/js/global/window.js');
  app.import('bower_components/videojs/src/js/global/document.js');
  app.import('bower_components/videojs/src/js/setup.js');
  app.import('bower_components/videojs/src/js/utils/stylesheet.js');
  app.import('bower_components/videojs/src/js/component.js');
  app.import('bower_components/videojs/src/js/event-target.js');
  app.import('bower_components/videojs/src/js/player.js');
  app.import('bower_components/videojs/src/js/plugin.js');
  app.import('bower_components/videojs/src/js/utils/merge-options.js');
  app.import('bower_components/videojs/src/js/tracks/text-track.js');
  app.import('bower_components/videojs/src/js/tracks/audio-track.js');
  app.import('bower_components/videojs/src/js/tracks/video-track.js');
  app.import('bower_components/videojs/src/js/utils/time-ranges.js');
  app.import('bower_components/videojs/src/js/utils/format-time.js');
  app.import('bower_components/videojs/src/js/utils/log.js');
  app.import('bower_components/videojs/src/js/utils/dom.js');
  app.import('bower_components/videojs/src/js/utils/browser.js');
  app.import('bower_components/videojs/src/js/utils/url.js');
  app.import('bower_components/videojs/src/js/utils/obj.js');
  app.import('bower_components/videojs/src/js/utils/computed-style.js');
  app.import('bower_components/videojs/src/js/extend.js');
  app.import('bower_components/videojs/src/js/xhr/index.js');

  return app.toTree();
};
