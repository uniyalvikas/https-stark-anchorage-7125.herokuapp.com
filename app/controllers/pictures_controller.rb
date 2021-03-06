class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    @albumID = session[:albumID]

     
    @pictures = Picture.where(:album_id => @albumID)
    respond_with(@pictures)


  end




  def show
    respond_with(@picture)
  end

  def new
    @picture = Picture.new
    respond_with(@picture)
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
    respond_with(@picture)
  end

  def update
    @picture.update(picture_params)
    respond_with(@picture)
  end

  def destroy
    @picture.destroy
    respond_with(@picture)
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:caption, :description, :user_id, :album_id, :content_type, :width, :height)
    end
end
