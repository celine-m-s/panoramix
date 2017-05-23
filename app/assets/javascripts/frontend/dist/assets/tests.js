'use strict';

define('frontend/tests/app.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('ESLint | app');

  QUnit.test('adapters/application.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'adapters/application.js should pass ESLint\n\n');
  });

  QUnit.test('app.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'app.js should pass ESLint\n\n');
  });

  QUnit.test('components/new-trailers.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'components/new-trailers.js should pass ESLint\n\n');
  });

  QUnit.test('components/video-player.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'components/video-player.js should pass ESLint\n\n');
  });

  QUnit.test('controllers/movie.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'controllers/movie.js should pass ESLint\n\n');
  });

  QUnit.test('models/movie.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'models/movie.js should pass ESLint\n\n');
  });

  QUnit.test('resolver.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'resolver.js should pass ESLint\n\n');
  });

  QUnit.test('router.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'router.js should pass ESLint\n\n');
  });

  QUnit.test('routes/dashboard.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/dashboard.js should pass ESLint\n\n');
  });

  QUnit.test('routes/index.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/index.js should pass ESLint\n\n');
  });

  QUnit.test('routes/movies.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/movies.js should pass ESLint\n\n');
  });
});
define('frontend/tests/helpers/destroy-app', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = destroyApp;

  function destroyApp(application) {
    _ember['default'].run(application, 'destroy');
  }
});
define('frontend/tests/helpers/module-for-acceptance', ['exports', 'qunit', 'ember', 'frontend/tests/helpers/start-app', 'frontend/tests/helpers/destroy-app'], function (exports, _qunit, _ember, _frontendTestsHelpersStartApp, _frontendTestsHelpersDestroyApp) {
  var Promise = _ember['default'].RSVP.Promise;

  exports['default'] = function (name) {
    var options = arguments.length <= 1 || arguments[1] === undefined ? {} : arguments[1];

    (0, _qunit.module)(name, {
      beforeEach: function beforeEach() {
        this.application = (0, _frontendTestsHelpersStartApp['default'])();

        if (options.beforeEach) {
          return options.beforeEach.apply(this, arguments);
        }
      },

      afterEach: function afterEach() {
        var _this = this;

        var afterEach = options.afterEach && options.afterEach.apply(this, arguments);
        return Promise.resolve(afterEach).then(function () {
          return (0, _frontendTestsHelpersDestroyApp['default'])(_this.application);
        });
      }
    });
  };
});
define('frontend/tests/helpers/resolver', ['exports', 'frontend/resolver', 'frontend/config/environment'], function (exports, _frontendResolver, _frontendConfigEnvironment) {

  var resolver = _frontendResolver['default'].create();

  resolver.namespace = {
    modulePrefix: _frontendConfigEnvironment['default'].modulePrefix,
    podModulePrefix: _frontendConfigEnvironment['default'].podModulePrefix
  };

  exports['default'] = resolver;
});
define('frontend/tests/helpers/start-app', ['exports', 'ember', 'frontend/app', 'frontend/config/environment'], function (exports, _ember, _frontendApp, _frontendConfigEnvironment) {
  exports['default'] = startApp;

  function startApp(attrs) {
    var attributes = _ember['default'].merge({}, _frontendConfigEnvironment['default'].APP);
    attributes = _ember['default'].merge(attributes, attrs); // use defaults, but you can override;

    return _ember['default'].run(function () {
      var application = _frontendApp['default'].create(attributes);
      application.setupForTesting();
      application.injectTestHelpers();
      return application;
    });
  }
});
define('frontend/tests/integration/components/new-trailers-test', ['exports', 'ember-qunit'], function (exports, _emberQunit) {

  (0, _emberQunit.moduleForComponent)('new-trailers', 'Integration | Component | new trailers', {
    integration: true
  });

  (0, _emberQunit.test)('it renders', function (assert) {

    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.on('myAction', function(val) { ... });

    this.render(Ember.HTMLBars.template({
      'id': 's5oBkVIW',
      'block': '{"statements":[["append",["unknown",["new-trailers"]],false]],"locals":[],"named":[],"yields":[],"blocks":[],"hasPartials":false}',
      'meta': {}
    }));

    assert.equal(this.$().text().trim(), '');

    // Template block usage:
    this.render(Ember.HTMLBars.template({
      'id': '5rbP5CSz',
      'block': '{"statements":[["text","\\n"],["block",["new-trailers"],null,null,0],["text","  "]],"locals":[],"named":[],"yields":[],"blocks":[{"statements":[["text","      template block text\\n"]],"locals":[]}],"hasPartials":false}',
      'meta': {}
    }));

    assert.equal(this.$().text().trim(), 'template block text');
  });
});
define('frontend/tests/integration/components/video-player-test', ['exports', 'ember-qunit'], function (exports, _emberQunit) {

  (0, _emberQunit.moduleForComponent)('video-player', 'Integration | Component | video player', {
    integration: true
  });

  (0, _emberQunit.test)('it renders', function (assert) {

    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.on('myAction', function(val) { ... });

    this.render(Ember.HTMLBars.template({
      'id': 'JXCsORkc',
      'block': '{"statements":[["append",["unknown",["video-player"]],false]],"locals":[],"named":[],"yields":[],"blocks":[],"hasPartials":false}',
      'meta': {}
    }));

    assert.equal(this.$().text().trim(), '');

    // Template block usage:
    this.render(Ember.HTMLBars.template({
      'id': '+47n41P+',
      'block': '{"statements":[["text","\\n"],["block",["video-player"],null,null,0],["text","  "]],"locals":[],"named":[],"yields":[],"blocks":[{"statements":[["text","      template block text\\n"]],"locals":[]}],"hasPartials":false}',
      'meta': {}
    }));

    assert.equal(this.$().text().trim(), 'template block text');
  });
});
define('frontend/tests/test-helper', ['exports', 'frontend/tests/helpers/resolver', 'ember-qunit'], function (exports, _frontendTestsHelpersResolver, _emberQunit) {

  (0, _emberQunit.setResolver)(_frontendTestsHelpersResolver['default']);
});
define('frontend/tests/tests.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('ESLint | tests');

  QUnit.test('helpers/destroy-app.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/destroy-app.js should pass ESLint\n\n');
  });

  QUnit.test('helpers/module-for-acceptance.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/module-for-acceptance.js should pass ESLint\n\n');
  });

  QUnit.test('helpers/resolver.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/resolver.js should pass ESLint\n\n');
  });

  QUnit.test('helpers/start-app.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/start-app.js should pass ESLint\n\n');
  });

  QUnit.test('integration/components/new-trailers-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'integration/components/new-trailers-test.js should pass ESLint\n\n');
  });

  QUnit.test('integration/components/video-player-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'integration/components/video-player-test.js should pass ESLint\n\n');
  });

  QUnit.test('test-helper.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'test-helper.js should pass ESLint\n\n');
  });

  QUnit.test('unit/adapters/movie-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/adapters/movie-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/controllers/movie-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/controllers/movie-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/models/movie-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/models/movie-test.js should pass ESLint\n\n');
  });
});
define('frontend/tests/unit/adapters/movie-test', ['exports', 'ember-qunit'], function (exports, _emberQunit) {

  (0, _emberQunit.moduleFor)('adapter:movie', 'Unit | Adapter | movie', {
    // Specify the other units that are required for this test.
    // needs: ['serializer:foo']
  });

  // Replace this with your real tests.
  (0, _emberQunit.test)('it exists', function (assert) {
    var adapter = this.subject();
    assert.ok(adapter);
  });
});
define('frontend/tests/unit/controllers/movie-test', ['exports', 'ember-qunit'], function (exports, _emberQunit) {

  (0, _emberQunit.moduleFor)('controller:movie', 'Unit | Controller | movie', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  });

  // Replace this with your real tests.
  (0, _emberQunit.test)('it exists', function (assert) {
    var controller = this.subject();
    assert.ok(controller);
  });
});
define('frontend/tests/unit/models/movie-test', ['exports', 'ember-qunit'], function (exports, _emberQunit) {

  (0, _emberQunit.moduleForModel)('movie', 'Unit | Model | movie', {
    // Specify the other units that are required for this test.
    needs: []
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var model = this.subject();
    // let store = this.store();
    assert.ok(!!model);
  });
});
require('frontend/tests/test-helper');
EmberENV.TESTS_FILE_LOADED = true;
//# sourceMappingURL=tests.map
