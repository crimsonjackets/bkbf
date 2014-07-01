# == Schema Information
#
# Table name: slides
#
#  id                 :integer          not null, primary key
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  title              :string(255)
#  text               :text
#  created_at         :datetime
#  updated_at         :datetime
#

class Slide < ActiveRecord::Base
  has_attached_file :image, styles: {admin_thumb: '128x128', slide: '1051x616#'},
                            url: "/public/images/slides/:id/:basename.:extension",
                            path: ":rails_root/public/images/slides/:id/:basename.:extension"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
