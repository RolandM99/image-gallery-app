class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]

  # GET /pictures or /pictures.json
  def index
    @user = current_user
    @pictures = current_user.pictures
  end

  # GET /pictures/1 or /pictures/1.json
  def show; end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # POST /pictures or /pictures.json
  def create
    @picture = current_user.pictures.create(picture_params)
    if @picture.save
      flash[:notice] = 'Picture was successfully created'
    else
      flash.now[:notice] = 'Failed'
    end
    redirect_to root_path
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture destroyed successfully'
    redirect_to root_path
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def picture_params
    params.require(:picture).permit(:title, :description, :user_id, :photo)
  end
end
