Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShelfView extends Backbone.View
  template: JST["backbone/templates/shelves/shelf"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"
  # initialize: () ->
    
  initialize: =>
    @model.on('change', @render)
    @el.id= "index-#{@model.get('id')}"

  destroy: () =>
    @model.destroy()
    this.remove()

    return false

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    return this
