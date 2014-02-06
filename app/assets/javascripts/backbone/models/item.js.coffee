class Stirs.Models.Item extends Backbone.Model
  paramRoot: 'item'
  defaults:
    name: null

class Stirs.Collections.ItemCollection extends Backbone.Collection
  model: Stirs.Models.Item
  url: ->
    "shelves/#{@shelf_id}/items"

  initialize: (shelf_id) ->
    console.log("Initializeng item collection", shelf_id)
    @shelf_id = shelf_id
    @url = "shelves/#{@shelf_id}/items"


