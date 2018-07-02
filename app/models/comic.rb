class Comic < ApplicationRecord

#file uploading via CarrierWave
mount_uploader :thumb_image, ComicUploader
mount_uploader :main_image, ComicUploader

end
