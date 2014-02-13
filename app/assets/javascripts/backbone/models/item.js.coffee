class Stirs.Models.Item extends Backbone.Model
  paramRoot: 'item'
  defaults:
    name: null

  url: ->
    "shelves/#{this.get('shelf_id')}/items/"

class Stirs.Collections.ItemCollection extends Backbone.Collection
  model: Stirs.Models.Item


