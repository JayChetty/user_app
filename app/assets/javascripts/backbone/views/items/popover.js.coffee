Stirs.Views.Items ||= {}

class Stirs.Views.Items.PopoverView extends Backbone.View
  template: JST["backbone/templates/items/popover"]

  render: =>
    console.log('rendering my Popover', @model)
    $(@el).html(@template(@model.toJSON()))
    console.log("ele", @el)
    @