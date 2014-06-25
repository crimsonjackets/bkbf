class CreatePages < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default pages
    [['company', 'Компания'], ['gofrocarton', 'Гофрокартон'], ['gofropack', 'Гофроупаковка'], ['carton_paper', 'Бумага и картон']].each do |name|
      Page.create!(name: name[0], title: name[1]) if direction == :up
    end
  end

  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.attachment :image
      t.attachment :file
      t.text :text_block_1
      t.text :text_block_2

      t.timestamps
    end
  end
end
