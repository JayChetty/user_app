class Stirs.Models.Shelf extends Backbone.Model
  paramRoot: 'shelf'

  defaults:
    name: null


class Stirs.Collections.ShelvesCollection extends Backbone.Collection
  model: Stirs.Models.Shelf
  url: "/shelves"

