class Comic < ApplicationRecord
  def comic_order
    if comic.order == nil
      comic.order = comic.last.order + 1
    end
    comic.order
  end

#file uploading via CarrierWave
mount_uploader :thumb_image, ComicUploader
mount_uploader :main_image, ComicUploader

end
