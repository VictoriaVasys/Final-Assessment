class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id].to_i)
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end
  
  def create
    @link = current_user.links.create(link_params)
    @links = Link.all
    
    if @link.save
      render json: @links
    else
      render json: @link.errors.full_messages, status: 500
    end
  end
  
  private
  
  def link_params
    params.permit(:title, :url, :read)
  end

end
