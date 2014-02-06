Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.IndexView extends Backbone.View
  template: JST["backbone/templates/shelves/index"]

  initialize: () ->
    @options.shelves.bind('reset', @addAll)

  addAll: () =>
    @options.shelves.each(@addOne)

  addOne: (shelf) =>
    view = new Stirs.Views.Shelves.ShelfView({model : shelf})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(shelves: @options.shelves.toJSON() ))
    @addAll()

    return this