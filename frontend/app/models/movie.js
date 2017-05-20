import DS from 'ember-data';

export default DS.Model.extend({
    link:  DS.attr('string'),
    title:  DS.attr('string'),
    date:  DS.attr('date'),
    videoUrl:  DS.attr('string')
});
