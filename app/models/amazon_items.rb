class AmazonItems
  attr_accessor :amazon_items

  def initialize(options)
    @creator = options[:creator] || ""
    @medium = options[:medium] || ""
    @title = options[:title] || ""
  end

  def fetch
    case @medium
    when "read"
      @amazon_items = Amazon::Ecs.item_search(@title, :author => @creator, :country => "uk", :response_group => "Medium", :binding => "paperback").items
    when "track"
      result = Amazon::Ecs.item_search("#{@title} #{@creator}", :country => "uk", :response_group => "Medium", :search_index => "MP3Downloads").items
      if result.empty?
         result = Amazon::Ecs.item_search(@title, :artist => @creator, :country => "uk", :response_group => "Medium", :search_index => "Music").items
      end
      @amazon_items = result
    when "show"
      @amazon_items = Amazon::Ecs.item_search(@title, :actor => @creator, :country => "uk", :response_group => "Medium", :search_index => "DVD").items
    end 
  end

  def as_native
    case @medium
      when "read"
       creator_string = 'Author'
      when "track"
       creator_string = 'Creator'
      when "show" 
       creator_string = 'Actor'
    end  

    @items = @amazon_items.map do |item|
      item = Item.new(
        creator: item.get("ItemAttributes/#{creator_string}"),
        title: item.get('ItemAttributes/Title'), 
        image_url: item.get("SmallImage/URL"), 
        url: item.get("DetailPageURL"), 
        medium: @medium,  
        blurb: item.get("EditorialReviews/EditorialReview/Content") || "No Review",
        large_image_url: item.get("MediumImage/URL"),
        alt_image_url: ""
      )  
    end
    @items
  end

  # def getBooks(options)
  #   Amazon::Ecs.item_search(options[:title], :author => options[:author], :country => "uk", :response_group => "Medium", :binding => "paperback").items
  # end

  # def getTracks(options)
  #   result = Amazon::Ecs.item_search("#{options[:title]} #{options[:creator]}", :country => "uk", :response_group => "Medium", :search_index => "MP3Downloads").items

  #   if result.empty?
  #      result = Amazon::Ecs.item_search(options[:title], :artist => options[:creator], :country => "uk", :response_group => "Medium", :search_index => "Music").items
  #   end

  #   result
  # end

  # def getShows(options)
  #   result = Amazon::Ecs.item_search(options[:title], :actor => options[:creator], :country => "uk", :response_group => "Medium", :search_index => "DVD").items
  # end

end