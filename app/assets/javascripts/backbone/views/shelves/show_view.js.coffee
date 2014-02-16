Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]

  initialize: ->
    @model.on('change', @render)
    

  addItemFinder: ->
    console.log('lalala', @model)
    @item_finder_view = new Stirs.Views.Items.ItemFinderView({shelf : @model})
    console.log('adding item finder', $("#item-finder"))
    $("#item-finder").html(@item_finder_view.render().el)

  setActive: ->
    console.log("asdf", "#index-#{@model.get('id')}")
    $("#index-#{@model.get('id')}").addClass('active')

  render: =>
    $(@el).html(@template(@model.toJSON() ))

    item_list = this.$('#items')[0]

    console.log('in show render model', @model)

    _.each(@model.items.models, (item) ->
      item_view = new Stirs.Views.Items.ItemView({model : item})
      item_list.appendChild(item_view.render().el)
    )
    @setActive()
    @addItemFinder()
    
    return this


