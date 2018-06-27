class ComicsController < ApplicationController
   before_action :set_comic, only: [:show, :edit, :update, :destroy, :toggle_status]
   layout "application"
   # access all: [:show ], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, admin: :all

  def show
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
  end

  def edit
  end

  def update
  end

  def toggle_status
  end

  def destroy
  end

  private
  def comic_params
    params.require(:comic).permit(:title, :main_image, :thumb_image)
  end
end
