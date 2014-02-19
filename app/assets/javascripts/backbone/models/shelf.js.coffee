class Stirs.Models.Shelf extends Backbone.Model
  paramRoot: 'shelf'

  defaults:
    name: null

  initialize:(data) ->
    console.log("Creating shelf data", data)
    console.log("Creating shelf object", this)

    @createItems(data.items)

  createItems:(items) ->
    @items = new Stirs.Collections.ItemCollection()
    @items.reset items

  addItem:(item) -> 
    item.set('shelf_id', @.get('id'))
    @items.add(item)
    @.trigger('change')
    item.save()

class Stirs.Collections.ShelvesCollection extends Backbone.Collection
  model: Stirs.Models.Shelf
  url: "/shelves"

