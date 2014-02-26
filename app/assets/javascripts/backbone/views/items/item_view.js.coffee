Stirs.Views.Items ||= {}

class Stirs.Views.Items.ItemView extends Backbone.View
  template: JST["backbone/templates/items/item"]

  events:
    "dragstart" : "onDragStart"
    "click img": "popOver"

  tagName: "li"
  className: "item"

  isDraggable: false

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    popOver = new Stirs.Views.Items.PopoverView()
    @el.appendChild(popOver.render().el)
    return this

  setIsDraggable:(isDraggable) =>
    @.isDraggable = isDraggable
    if isDraggable
      @el.setAttribute('draggable', true)

  onDragStart:(ev)=>
    ev.originalEvent.dataTransfer.setData("Item", JSON.stringify(@model))

  popOver:=>
    $(document).foundation('reflow')
    $('#myModal').foundation('reveal', 'open');

