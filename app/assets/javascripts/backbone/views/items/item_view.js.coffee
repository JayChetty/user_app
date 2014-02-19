Stirs.Views.Items ||= {}

class Stirs.Views.Items.ItemView extends Backbone.View
  template: JST["backbone/templates/items/item"]

  events:
    "dragstart" : "onDragStart"

  tagName: "li"
  className: "item"

  isDraggable: false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

  setIsDraggable:(isDraggable) =>
    @.isDraggable = isDraggable
    if isDraggable
      @el.setAttribute('draggable', true)

  onDragStart:(ev)=>
    ev.originalEvent.dataTransfer.setData("Item", JSON.stringify(@model))

