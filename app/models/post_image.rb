class PostImage < ApplicationRecord
  mount_uploader :link, ImagesUploader

  belongs_to :post
  validates :post_id, presence: true
end
