class PagesController < ApplicationController

  def home
    @comic = Comic.last
    @is_first = 'false'
    @is_last = 'true' 
  end

  def author
  end

  def news
  end

  def cast
  end

  def archive
    @comics = Comic.all.order('created_at desc')
  end

end
