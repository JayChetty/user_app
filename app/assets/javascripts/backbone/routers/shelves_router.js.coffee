class Shelf.Routers.ShelvesRouter extends Backbone.Router
  initialize: (options) ->
    @shelves = new Shelf.Collections.ShelvesCollection()
    @shelves.reset options.shelves

  routes:
    "new"      : "newShelf"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newShelf: ->
    @view = new Shelf.Views.Shelves.NewView(collection: @shelves)
    $("#shelves").html(@view.render().el)

  index: ->
    @view = new Shelf.Views.Shelves.IndexView(shelves: @shelves)
    $("#shelves").html(@view.render().el)

  show: (id) ->
    shelf = @shelves.get(id)

    @view = new Shelf.Views.Shelves.ShowView(model: shelf)
    $("#shelves").html(@view.render().el)

  edit: (id) ->
    shelf = @shelves.get(id)

    @view = new Shelf.Views.Shelves.EditView(model: shelf)
    $("#shelves").html(@view.render().el)
