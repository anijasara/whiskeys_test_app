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
    whiskeys = Whiskey.get_whiskeys_param_ordered("#{params[:term].downcase}")
    render json: whiskeys
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