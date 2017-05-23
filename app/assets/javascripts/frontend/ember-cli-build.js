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

  return app.toTree();
};
