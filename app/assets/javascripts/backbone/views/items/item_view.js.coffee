Stirs.Views.Items ||= {}

class Stirs.Views.Items.ItemView extends Backbone.View
  template: JST["backbone/templates/items/item"]

  events:
    "dragstart" : "onDragStart"

  tagName: "li"
  className: "item"

  isDraggable: false

  # destroy: () ->
  #   @model.destroy()
  #   this.remove()

  #   return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

  setPosition:(pos) ->

    @el.setAttribute('data-pos', pos)

  setIsDraggable:(isDraggable) =>
    @.isDraggable = isDraggable
    if isDraggable

      console.log('setting positions this.el',this.el)
      console.log('setting positions this.$el',this.$el)
      console.log('setting positions this.$(@el)',$(@el) )
      # $(@el).draggable()
      @el.setAttribute('draggable', true)
      # $(@el)[0].setAttribute('draggable', true)
      # @el.setAttribute('ondragstart', 
      #   alert( "boo")
      # )

      # @$el.on('dragstart', @.onDragStart )


  onDropped:(ev) =>

  onDragStart:=>
    alert('Dragstart')
    console.log("dragstart")
