class ImagesController < ApplicationController
  def create
    @ajax_image = Image.new(exhibit_params)
    @ajax_image.save
    respond_to do |format|
      format.json{ @image = Image.find(@ajax_image.id) }
    end
  end

  private

  def exhibit_params
    params[:image].permit(:image)
  end
end
