class PagesController < ApplicationController

  def home
    @comic = Comic.last

  end

  def about
  end

  def archive
    @comics = Comic.all.order('created_at desc')
  end

  def news
  end

  def contact
  end

end
