class ComicsController < ApplicationController
   before_action :set_comic, only: [:show, :edit, :update, :destroy, :toggle_status]
   
   access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

   layout "application"

  def show
    @comic = Comic.find(params[:id])
    @is_first = @comic == Comic.first ? 'true' : 'false'
    @is_last = @comic == Comic.last ? 'true' : 'false'

  end

  def index
    @comics = Comic.all.order('created_at desc')
  end 

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)

    respond_to do |format|
      if @comic.save
        format.html { redirect_to archive_path, notice: 'Comic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @comic.save
        format.html { redirect_to comic_path, notice: 'Comic was successfully saved.' }
      else
        format.html { render :new }
      end
    end
  end


  def toggle_status

      if @comic.status == nil
        @comic.status = "draft"
      elsif @comic.status == "draft"
        @comic.status == "published"
      elsif @comic.published?
        @comic.draft!
    end

    redirect_to blogs_url, notice: "Post has been updated."
  end

  def destroy
    @comic.destroy

		respond_to do |format|
			format.html { redirect_to root_path, notice: "Comic was removed"}
		end
  end

  private

  def set_comic
    @comic = Comic.find(params[:id])
  end

  def comic_params
    params.require(:comic).permit(:title,
                                  :id,
                                  :main_image,
                                  :thumb_image,
                                  :description,
                                  :status,
                                  :order
                                  )
  end
end
