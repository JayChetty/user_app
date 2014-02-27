class Stirs.Routers.ShelvesRouter extends Backbone.Router
  initialize: (options) ->
    @shelves = new Stirs.Collections.ShelvesCollection()
    # @shelves.fetch()
    # @shelves.addItems()
    @item_finder_view = new Stirs.Views.Items.ItemFinderView()
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
    @index_view = new Stirs.Views.Shelves.IndexView(shelves: @shelves)    
    $("#shelf-index").html(@index_view.render().el)    
    $("#item-finder").html(@item_finder_view.render().el)

  show: (id) ->
    shelf = @shelves.get(id)
    @index_view = new Stirs.Views.Shelves.IndexView(shelves: @shelves)
    @view = new Stirs.Views.Shelves.ShowView(model: shelf, shelves: @shelves)

    $("#shelf-index").html(@index_view.render().el)
    $("#current-shelf").html(@view.render().el)

    $item_finder = $("#item-finder")
    if ($item_finder.find('form').length == 0)
      console.log('adding finder')
      $item_finder.html(@item_finder_view.render().el)
    

  edit: (id) ->
    shelf = @shelves.get(id)

    @view = new Stirs.Views.Shelves.EditView(model: shelf)
    $("#shelves").html(@view.render().el)
