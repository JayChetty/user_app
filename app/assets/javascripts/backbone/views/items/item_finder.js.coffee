Stirs.Views.Items ||= {}

class Stirs.Views.Items.ItemFinderView extends Backbone.View
  template: JST["backbone/templates/items/item_finder"]

  events:
    "click #find_btn": 'findItem'
    # "click .found_item": 'addItem'

  tagName: "div"

  # initialize: ->
  #   console.log('init', @options)
  #   @shelf = @options.shelf
  #   console.log('init', @)

  render: ->
    $(@el).html(@template())
    return this

  findItem:(ev) =>
    title = $('#title').val()
    creator = $('#creator').val()
    console.log('from find item',@)
    $.ajax
      dataType: "json"
      url: "/items/new"
      data: {medium: "read", title: "#{title}", creator: "#{creator}"}
      success: @success

  success: (data)=>
    @found_items = new Stirs.Collections.ItemCollection()
    @found_items.reset data

    jlist = this.$('#found_items')
    jlist.empty()
    item_list = jlist[0]

    _.each(@found_items.models, (item, i) =>
      #item_view = new Stirs.Views.Items.ItemView({model : item}) 
      #Do this properly

      item_view = new Stirs.Views.Items.ItemView({model : item})

      item_view.setPosition(i)
      item_view.setIsDraggable(true)
      
      # item_element = document.createElement('li')
      # $(item_element).addClass('item')
      # $(item_element).addClass('found_item')
      # item_element.setAttribute('data-pos', i)
      # # item_element.className = "found_item"

      # img = document.createElement("img");
      # img.setAttribute('src', item.get('image_url'))
      # item_element.appendChild(img)
      item_list.appendChild(item_view.render().el)
    )

  addItem:(ev) =>
    item = @found_items.models[ev.currentTarget.getAttribute('data-pos')]
    # item.set('shelf_id', @shelf.get('id'))

    console.log('Item', item)
    
    # @shelf.addItem(item)