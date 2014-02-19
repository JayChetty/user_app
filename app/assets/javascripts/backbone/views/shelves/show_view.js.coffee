Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]

  events:
    "dragover" : "dragOver"
    "drop": "drop"

  initialize: ->
    @model.on('change', @render)

  drop:(ev)->
    itemText = ev.originalEvent.dataTransfer.getData('Item')
    item = new Stirs.Models.Item(JSON.parse(itemText))
    @model.addItem(item)

  setActive: ->
    console.log("asdf", "#index-#{@model.get('id')}")
    $("#index-#{@model.get('id')}").addClass('active')

  render: =>   
    $(@el).html(@template(@model.toJSON() ))
    item_list = this.$('#items')[0]

    _.each(@model.items.models, (item) ->
      item_view = new Stirs.Views.Items.ItemView({model : item})
      item_list.appendChild(item_view.render().el)
    )
    @setActive()
    
    return this

  dragOver:(ev) ->
    @allowDrop(ev)

  allowDrop: (ev) ->
    ev.preventDefault()
