Stirs.Views.Shelves ||= {}

class Stirs.Views.Shelves.ShowView extends Backbone.View
  template: JST["backbone/templates/shelves/show"]

  # events:
  #   "click #find_btn": 'findItem'
  #   "click .found_item": 'addItem'

  initialize: ->
    @model.on('change', @render)
    

  addItemFinder: ->
    console.log('lalala', @model)
    @item_finder_view = new Stirs.Views.Items.ItemFinderView({shelf : @model})
    console.log('adding item finder', $("#item-finder"))
    $("#item-finder").html(@item_finder_view.render().el)

  render: =>
    $(@el).html(@template(@model.toJSON() ))

    item_list = this.$('#items')[0]

    console.log('in show render model', @model)

    _.each(@model.items.models, (item) ->
      item_view = new Stirs.Views.Items.ItemView({model : item})
      item_list.appendChild(item_view.render().el)
    )

    @addItemFinder()
    
    return this

  # findItem:(ev) =>
  #   title = $('#title').val()
  #   creator = $('#creator').val()
  #   $.ajax
  #     dataType: "json"
  #     url: "/shelves/#{@model.get('id')}/items/new"
  #     data: {medium: "read", title: "#{title}", creator: "#{creator}"}
  #     success: @success

  # success: (data)=>
  #   @found_items = new Stirs.Collections.ItemCollection()
  #   @found_items.reset data

  #   jlist = this.$('#found_items')
  #   jlist.empty()
  #   item_list = jlist[0]

  #   _.each(@found_items.models, (item, i) =>
  #     item_view = new Stirs.Views.Items.ItemView({model : item})
      
  #     item_element = document.createElement('li')
  #     item_element.setAttribute('data-pos', i);
  #     item_element.className = "found_item"

  #     img = document.createElement("img");
  #     img.setAttribute('src', item.get('image_url'))
  #     item_element.appendChild(img)
  #     item_list.appendChild(item_element)
  #   )

  # addItem:(ev) =>
  #   item = @found_items.models[ev.currentTarget.getAttribute('data-pos')]
  #   item.set('shelf_id', @model.get('id'))
    
  #   @model.addItem(item)
