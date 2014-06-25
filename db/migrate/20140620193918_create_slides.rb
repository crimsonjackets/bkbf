class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.attachment :image
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
