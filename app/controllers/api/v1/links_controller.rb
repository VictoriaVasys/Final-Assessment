class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end
  
  def create
    link = current_user.create(link_params)
    @links = Link.all
    
    if link.save
      render json: @links
    else
      render json: @links.errors.full_messages, status: 500
    end

    # flash[:notice] = "Your comment was added." // flash useless w ajax (we're rendering partial)
    # redirect_to article_path(article) # don't want to redirect (doesn't make sense with an ajax req)
  end
  
  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end
