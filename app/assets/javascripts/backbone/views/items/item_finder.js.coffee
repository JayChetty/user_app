Stirs.Views.Items ||= {}

class Stirs.Views.Items.ItemFinderView extends Backbone.View
  template: JST["backbone/templates/items/item_finder"]

  events:
    "click #find_btn": 'findItem'

  tagName: "div"

  render: =>
    $(@el).html(@template())
    return this

  findItem:(ev) =>
    title = $(@el).find('#title').val()
    creator = $(@el).find('#creator').val()
    # medium = $('#medium').val()
    medium = "read"
    $.ajax
      dataType: "json"
      url: "/items/new"
      data: {medium: "#{medium}", title: "#{title}", creator: "#{creator}"}
      success: @success

  success: (data)=>
    @found_items = new Stirs.Collections.ItemCollection()
    @found_items.reset data

    jlist = this.$('#found_items')
    jlist.empty()
    item_list = jlist[0]

    _.each(@found_items.models, (item) =>
      item_view = new Stirs.Views.Items.ItemView({model : item})
      item_view.setIsDraggable(true)
      item_list.appendChild(item_view.render().el)
    )