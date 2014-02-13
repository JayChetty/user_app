Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]

  events:
    "click #find_btn": 'findItem'
    "click .found_item": 'saveItem'


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

  findItem:(ev) ->
    console.log('event', ev)
    title = $('#title').val()
    creator = $('#creator').val()
    console.log('title', title)
    $.ajax
      dataType: "json"
      url: "/shelves/#{@model.get('id')}/items/new"
      data: {medium: "read", title: "#{title}", creator: "#{creator}"}
      success: @success

  success: (data)=>
    @found_items = new Stirs.Collections.ItemCollection()
    @found_items.reset data
    console.log("succes", @found_items)
    console.log("this", this)

    jlist = this.$('#found_items')
    jlist.empty()
    item_list = jlist[0]

    console.log("item list", item_list)

    _.each(@found_items.models, (item, i) =>
      #want to create a view for an item element right?
      item_element = document.createElement('li')
      # item_element.id = "found_item_#{i}"
      item_element.setAttribute('data-pos', i);
      item_element.className = "found_item"
      console.log("item", item)
      # item_element.innerHTML = item.title
      img = document.createElement("img");
      img.setAttribute('src', item.get('image_url'))
      item_element.appendChild(img)
      item_list.appendChild(item_element)
    )
  saveItem:(ev) =>
    console.log("event", ev.currentTarget)
    item = @found_items.models[ev.currentTarget.getAttribute('data-pos')]
    item.set('shelf_id', @model.get('id'))
    console.log("item", item)
    item.save()
    
    #@model.addItem(item)