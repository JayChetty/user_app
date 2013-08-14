module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "SoulStir"
    if @user && @user.name
      "#{@user.name} | #{base_title}" 
    else     
      base_title
    end
  end
end

