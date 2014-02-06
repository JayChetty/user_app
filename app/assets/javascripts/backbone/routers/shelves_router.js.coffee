class Stirs.Routers.ShelvesRouter extends Backbone.Router
  initialize: (options) ->
    @shelves = new Stirs.Collections.ShelvesCollection()
    @shelves.fetch()
    # @shelves.reset options.shelves

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
    # alert "Sup"
    # s = new Stirs.Collections.ShelvesCollection()
    # s.fetch

    # alert "#{s.length}"
    console.log("shelves", @shelves)
    @view = new Stirs.Views.Shelves.IndexView(shelves: @shelves)
    $("#shelves").html(@view.render().el)

  show: (id) ->
    shelf = @shelves.get(id)

    @view = new Stirs.Views.Shelves.ShowView(model: shelf)
    $("#shelves").html(@view.render().el)

  edit: (id) ->
    shelf = @shelves.get(id)

    @view = new Stirs.Views.Shelves.EditView(model: shelf)
    $("#shelves").html(@view.render().el)
