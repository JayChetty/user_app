Stirs.Views.Items ||= {}

class Stirs.Views.Items.PopoverView extends Backbone.View
  template: JST["backbone/templates/items/popover"]

  tagName: "div" 
  className: "item-popover" 

  events:
    "click a#delete-item" : "deleteItem"

  render: =>
    $(@el).html( @template ( @model.toJSON()) )
    @

  open: =>
    @$(".modal").modal('show')

  hide: =>
    @$(".modal").modal('hide')

  deleteItem:(event) =>
    @$(".modal").modal('hide').on('hidden.bs.modal',=>
      @model.removeFromShelf()
    )
