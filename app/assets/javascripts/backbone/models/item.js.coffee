class Stirs.Models.Item extends Backbone.Model
  paramRoot: 'item'
  defaults:
    name: null

  urlRoot: ->
    "shelves/#{this.get('shelf_id')}/items/"

  removeFromShelf: =>
    console.log('wanting to remove', @)
    if @.get('shelf_id') != undefined
      @.destroy()
      @shelf().trigger('change')


  shelf: =>
    window.router.shelves.get(@.get('shelf_id'))


class Stirs.Collections.ItemCollection extends Backbone.Collection
  model: Stirs.Models.Item


