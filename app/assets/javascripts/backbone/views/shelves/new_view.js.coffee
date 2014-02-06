Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.NewView extends Backbone.View
  template: JST["backbone/templates/shelves/new"]

  events:
    "submit #new-shelf": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (shelf) =>
        @model = shelf
        window.location.hash = "/#{@model.id}"

      error: (shelf, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
