Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]


  render: ->
    $(@el).html(@template(@model.toJSON() ))

    item_list = this.$('#items')[0]

    _.each(@model.get('items'), (item) ->
      item_element = document.createElement('li')
      item_element.innerHTML = item.title
      item_list.appendChild(item_element)
    )
    
    console.log(@el)
    return this
