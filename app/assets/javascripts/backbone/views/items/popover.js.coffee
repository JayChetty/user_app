Stirs.Views.Items ||= {}

class Stirs.Views.Items.PopoverView extends Backbone.View
  template: JST["backbone/templates/items/popover"]

  tagName: "div" 
  className: "item-popover" 

  events:
    "click a#delete-item" : "deleteItem"

  render: =>
    data =  @model.toJSON()
    console.log('large image', @model.get('large_image_url'))
    if @model.get('large_image_url') != null
      data.display_image = @model.get('large_image_url')
    else
      data.display_image = @model.get('image_url')
    $(@el).html( @template (data) )
    @

  open: =>
    @$(".modal").modal('show')

  hide: =>
    @$(".modal").modal('hide')

  deleteItem:(event) =>
    @$(".modal").modal('hide').on('hidden.bs.modal',=>
      @model.removeFromShelf()
    )
