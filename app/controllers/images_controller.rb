class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  
  def new
    @image = Image.new
  end
  
  def edit
    @image = Image.find(params[:id])
  end
  
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def update
    @image = Image.find(params[:id])
    
    if image_params[:name].downcase == 'delete' && image_params[:key] == Rails.configuration.post_key
      @image.destroy
      redirect_to images_path
    else
      @image.update(image_params)

      if @image.save
        redirect_to images_path
      else
        render 'edit'
      end
    end
  end
  
  private
  
  def image_params
    params.require(:image).permit(:name, :key, :file)
  end
end
