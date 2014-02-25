Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]

  events:
    "dragover" : "dragOver"
    "drop": "drop"
    "click #edit-btn" : "edit"

  initialize: =>
    @model.on('change', @render)

  edit: =>
    console.log("Editing")
    name = $(@el).find('#name').val()
    @model.set('name', name)
    @model.save()

  drop:(ev)=>
    itemText = ev.originalEvent.dataTransfer.getData('Item')
    item = new Stirs.Models.Item(JSON.parse(itemText))
    @model.addItem(item)

  setActive: =>
    console.log("asdf", "#index-#{@model.get('id')}")
    $("#index-#{@model.get('id')}").addClass('active')

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    $(@el).find('#name').val(@model.get('name'))
    item_list = this.$('#items')[0]
    if @model.items.length == 0
      li = document.createElement("li")
      li.innerHTML = "No books added yet, drop books here to add"
      item_list.appendChild(li)
    else
      _.each(@model.items.models, (item) ->
        item_view = new Stirs.Views.Items.ItemView({model : item})
        item_list.appendChild(item_view.render().el)
      )

    @setActive()
    
    return this

  dragOver:(ev) =>
    @allowDrop(ev)

  allowDrop: (ev) =>
    ev.preventDefault()
