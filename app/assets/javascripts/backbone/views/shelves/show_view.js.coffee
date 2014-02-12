Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]

  events:
    "click #find_btn": 'findItem'


  render: ->
    $(@el).html(@template(@model.toJSON() ))

    item_list = this.$('#items')[0]

    _.each(@model.get('items'), (item) ->
      item_element = document.createElement('li')
      console.log("item", item)
      # item_element.innerHTML = item.title
      img = document.createElement("img");
      img.setAttribute('src', item.image_url)
      item_element.appendChild(img)
      item_list.appendChild(item_element)
    )
    
    return this

  findItem: ->
    $.ajax
      dataType: "json"
      url: "/shelves/#{@model.get('id')}/items/new"
      data: {medium: "read", title: "Face"}
      success: @success

  success: (data)=>
    items = new Stirs.Collections.ItemCollection()
    items.reset data
    console.log("succes", items)
    console.log("this", this)

    item_list = this.$('#found_items')[0]

    _.each(items.models, (item) ->
      item_element = document.createElement('li')
      console.log("item", item)
      # item_element.innerHTML = item.title
      img = document.createElement("img");
      img.setAttribute('src', item.get('image_url'))
      item_element.appendChild(img)
      item_list.appendChild(item_element)
    )
    this.render