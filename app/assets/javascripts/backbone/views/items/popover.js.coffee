Stirs.Views.Items ||= {}

class Stirs.Views.Items.PopoverView extends Backbone.View
  template: JST["backbone/templates/items/popover"]

  tagName: "div" 
  className: "item-popover" 

  events:
    "click" : "hide"
    "click a#delete-item" : "deleteItem"

  render: =>
    $(@el).html( @template ( @model.toJSON()) )
    $(@el).hide()
    @

  open: =>
    $(@el).show()

  hide: =>
    $(@el).hide()

  deleteItem: =>
    # console.log('trying to delete item', @model)
    # shelf = window.router.shelves.find(@model.get('shelf_id'))
    # console.log("shelf", window.router.shelves.get(@model.get('shelf_id')))
    @model.removeFromShelf()
