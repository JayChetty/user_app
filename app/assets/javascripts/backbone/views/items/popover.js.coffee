Stirs.Views.Items ||= {}

class Stirs.Views.Items.PopoverView extends Backbone.View
  template: JST["backbone/templates/items/popover"]

  render: =>
    attr = @model.toJSON()
    attr.cid = @model.cid
    $(@el).html( @template ( attr ) )

    @