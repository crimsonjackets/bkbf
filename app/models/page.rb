class Page < ActiveRecord::Base
  has_attached_file :image, styles: {admin_thumb: '128x128'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_attached_file :file
  do_not_validate_attachment_file_type :file
end
