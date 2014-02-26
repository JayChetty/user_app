Stirs.Views.Items ||= {}

class Stirs.Views.Items.PopoverView extends Backbone.View
  template: JST["backbone/templates/items/popover"]

  tagName: "div"  

  events:
    "click" : "hide"

  render: =>
    $(@el).html( @template ( @model.toJSON()) )
    $(@el).hide()
    @

  open: =>
    $(@el).show()

  hide: =>
    $(@el).hide()