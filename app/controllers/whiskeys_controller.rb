class WhiskeysController < ApplicationController
  def index
    render json: Whiskey.all
  end

  def create
    whiskey = Whiskey.create(whiskey_params)
    render json: whiskey
  end

  def destroy
    Whiskey.destroy(params[:id])
  end

  def search
    search_param = params[:term].downcase
    if search_param && Whiskey.search_params.include?(search_param)
      whiskeys = Whiskey.get_whiskeys_param_ordered("#{search_param}")
      render json: whiskeys
    else
      render json: { status: "error", message: "Please search for taste, color or smokiness." }, status: :unprocessable_entity
    end
  end

  def update
    whiskey = Whiskey.find(params[:id])
    whiskey.update_attributes(whiskey_params)
    render json: whiskey
  end

  private

  def whiskey_params
    params.require(:whiskey).permit(:id, :title, :description, :taste, :color, :smokiness)
  end
end