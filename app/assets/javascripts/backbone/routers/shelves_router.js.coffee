class Stirs.Routers.ShelvesRouter extends Backbone.Router
  initialize: (options) ->
    @shelves = new Stirs.Collections.ShelvesCollection()
    # @shelves.fetch()
    # @shelves.addItems()
    @shelves.reset options.shelves

  routes:
    "new"      : "newShelf"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newShelf: ->
    @view = new Stirs.Views.Shelves.NewView(collection: @shelves)
    $("#shelves").html(@view.render().el)

  index: ->
    @view = new Stirs.Views.Shelves.IndexView(shelves: @shelves)
    $("#shelves").html(@view.render().el)

  show: (id) ->
    shelf = @shelves.get(id)
    @index_view = new Stirs.Views.Shelves.IndexView(shelves: @shelves)
    @view = new Stirs.Views.Shelves.ShowView(model: shelf, shelves: @shelves)
    $("#shelf-index").html(@index_view.render().el)
    $("#current-shelf")[0].appendChild(@view.render().el)

  edit: (id) ->
    shelf = @shelves.get(id)

    @view = new Stirs.Views.Shelves.EditView(model: shelf)
    $("#shelves").html(@view.render().el)
