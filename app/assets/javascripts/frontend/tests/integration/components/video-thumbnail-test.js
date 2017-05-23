import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('video-thumbnail', 'Integration | Component | video thumbnail', {
  integration: true
});

test('it renders', function(assert) {

  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });

  this.render(hbs`{{video-thumbnail}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:
  this.render(hbs`
    {{#video-thumbnail}}
      template block text
    {{/video-thumbnail}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
