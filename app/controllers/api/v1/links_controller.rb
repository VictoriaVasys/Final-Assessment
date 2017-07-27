class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id].to_i)
    if @link.update_attributes(link_params)
      render json: @link
    else
      render status: 500, 
      json: {
        message: "Failed to update your link; #{@link.errors.full_messages}"
      }
    end
  end
  
  def create
    @link = current_user.links.create(link_params)
    @links = Link.all
    
    if @link.save
      render json: @links
    else
      render status: 500, 
      json: {
        message: "Failed to add your link; #{@link.errors.full_messages}"
      }
    end
  end
  
  private
  
  def link_params
    params.permit(:title, :url, :read)
  end

end
