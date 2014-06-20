class Slide < ActiveRecord::Base
  has_attached_file :image, styles: {admin_thumb: '128x128'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
