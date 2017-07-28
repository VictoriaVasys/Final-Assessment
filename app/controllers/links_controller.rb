class LinksController < ApplicationController
  def index
    if current_user
      @link = Link.new
      @links = current_user.links.reverse
    else 
      render file: "/public/404"
    end
  end

end
