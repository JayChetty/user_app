Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.IndexView extends Backbone.View
  template: JST["backbone/templates/shelves/index"]

  events:
    "click #addshelf" : "addShelf"

  initialize: () ->
    @options.shelves.bind('reset', @addAll)

  addAll: () =>
    @options.shelves.each(@addOne)

  addOne: (shelf) =>
    view = new Stirs.Views.Shelves.ShelfView({model : shelf})
    @$("ul").append(view.render().el)

  render: =>
    $(@el).html(@template(shelves: @options.shelves.toJSON() ))
    @addAll()
    return this

  addShelf:(e) =>
    console.log('adding SHelf')
    e.preventDefault()
    # e.stopPropagation()
    newShelf = new Stirs.Models.Shelf({"name":"newShelf"})
    # @options.shelves.add(newShelf)
    # @addOne(newShelf)


    @options.shelves.create(newShelf.toJSON(),
      success: (shelf) =>
        console.log('sucesss', shelf)
        @addOne(shelf)
      error: (shelf, jqXHR) =>
        console.log('ERROT', jqXHR)
    )
        # @model = shelf
        # window.location.hash = "/#{@model.id}"


    