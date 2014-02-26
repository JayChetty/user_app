Stirs.Views.Items ||= {}

class Stirs.Views.Items.PopoverView extends Backbone.View
  template: JST["backbone/templates/items/popover"]

  render: =>
    $(@el).html(@template())
    @