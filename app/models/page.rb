# == Schema Information
#
# Table name: pages
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  title              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  file_file_name     :string(255)
#  file_content_type  :string(255)
#  file_file_size     :integer
#  file_updated_at    :datetime
#  text_block_1       :text
#  text_block_2       :text
#  created_at         :datetime
#  updated_at         :datetime
#

class Page < ActiveRecord::Base
  has_attached_file :image, styles: {admin_thumb: '128x128'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_attached_file :file
  do_not_validate_attachment_file_type :file
end
