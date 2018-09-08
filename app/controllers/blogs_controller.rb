class BlogsController < ApplicationController
   before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]

   access all: [:show ], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

   layout "application"

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(comic_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to archive_path, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_path, notice: 'Blog was successfully saved.' }
      else
        format.html { render :new }
      end
    end
    redirect_to root_path, notice: "Post has been updated."
  end

  def destroy
    @blog.destroy

		respond_to do |format|
			format.html { redirect_to root_path, notice: "Blog was removed"}
		end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def comic_params
    params.require(:comic).permit(:title,
                                  :body
                                  )
  end

end
