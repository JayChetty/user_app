class Shelf.Models.Shelf extends Backbone.Model
  paramRoot: 'shelf'

  defaults:
    name: null

class Shelf.Collections.ShelvesCollection extends Backbone.Collection
  model: Shelf.Models.Shelf
  url: '/shelves'
