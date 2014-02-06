Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
