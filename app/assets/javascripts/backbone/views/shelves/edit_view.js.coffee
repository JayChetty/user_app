Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.EditView extends Backbone.View
  template : JST["backbone/templates/shelves/edit"]

  events :
    "submit #edit-shelf" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (shelf) =>
        @model = shelf
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
